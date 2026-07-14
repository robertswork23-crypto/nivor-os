-- Leads table for storing prospect information
CREATE TABLE IF NOT EXISTS leads (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20) UNIQUE NOT NULL,
  intent VARCHAR(100),
  ai_message TEXT,
  last_contacted TIMESTAMP,
  last_replied TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Index for faster phone lookups
CREATE INDEX IF NOT EXISTS idx_leads_phone ON leads(phone);

-- Index for follow-up engine queries
CREATE INDEX IF NOT EXISTS idx_leads_last_contacted ON leads(last_contacted);
