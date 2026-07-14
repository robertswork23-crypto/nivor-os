# Nivor OS

A stateful lead follow-up system built with n8n, PostgreSQL, and Docker.

## What it does

- Receives leads via webhook
- Deduplicates by phone number
- Stores and updates records
- Tracks last_contacted timestamps
- Automatically follows up with inactive leads
- Generates AI-powered personalized follow-up messages

## Stack

- **n8n** - Workflow automation
- **PostgreSQL** - Data persistence
- **OpenAI GPT-4o-mini** - AI follow-up generation
- **Docker** - Container orchestration

## Workflows

### 1. Lead Capture API
Webhook endpoint that:
- Accepts POST requests with lead data (name, phone, intent)
- Generates AI-personalized follow-up messages
- Checks if lead already exists (deduplication)
- Inserts new leads or updates existing ones

### 2. Follow-Up Engine
Scheduled workflow that:
- Runs on a configured interval
- Queries leads that haven't been replied to within 1 hour
- Loops through and sends follow-up messages
- Updates last_contacted timestamp

### 3. Nivor - Backend OS
Manual testing workflow for:
- Testing lead insertion/update flows
- Verifying database operations
- Debugging lead deduplication logic

## Getting Started

### Prerequisites

- Docker & Docker Compose
- n8n instance
- PostgreSQL database
- OpenAI API key

### Setup

1. Clone this repository
2. Set up your PostgreSQL database with the schema in `db/schema.sql`
3. Import the workflows into n8n
4. Configure credentials:
   - OpenAI API key
   - PostgreSQL connection
5. Deploy with Docker Compose:

```bash
docker-compose up -d
```

## Database Schema

```sql
CREATE TABLE leads (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  phone VARCHAR(20) UNIQUE,
  intent VARCHAR(100),
  ai_message TEXT,
  last_contacted TIMESTAMP,
  last_replied TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

## API Usage

### POST /lead-in

```json
{
  "name": "John Doe",
  "phone": "5551234567",
  "intent": "buyer"
}
```

## Next Steps

- [ ] SMS/Email integration for outreach
- [ ] Lead scoring based on engagement
- [ ] Custom prompt templates
- [ ] Analytics dashboard

---

**Built to understand how real backend + AI systems work.**
