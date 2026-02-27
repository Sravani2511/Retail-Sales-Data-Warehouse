-- 00_create_schema.sql
-- Create schemas
CREATE SCHEMA IF NOT EXISTS retail;

-- Staging table (raw landing, minimal transforms)
CREATE TABLE IF NOT EXISTS retail.stg_transactions (
  invoice_no       TEXT,
  stock_code       TEXT,
  description      TEXT,
  quantity         INTEGER,
  invoice_date     TIMESTAMP,
  unit_price       NUMERIC(10,2),
  customer_id      INTEGER,
  country          TEXT
);

-- Dimensions
CREATE TABLE IF NOT EXISTS retail.dim_customer (
  customer_key     BIGSERIAL PRIMARY KEY,
  customer_id      INTEGER UNIQUE,
  first_seen_date  DATE,
  country          TEXT
);

CREATE TABLE IF NOT EXISTS retail.dim_product (
  product_key      BIGSERIAL PRIMARY KEY,
  stock_code       TEXT UNIQUE,
  description      TEXT
);

CREATE TABLE IF NOT EXISTS retail.dim_date (
  date_key         INTEGER PRIMARY KEY, -- yyyymmdd
  date             DATE UNIQUE,
  year             INTEGER,
  month            INTEGER,
  day              INTEGER
);

CREATE TABLE IF NOT EXISTS retail.dim_country (
  country_key      BIGSERIAL PRIMARY KEY,
  country          TEXT UNIQUE
);

-- Fact table
CREATE TABLE IF NOT EXISTS retail.fact_sales (
  sales_key        BIGSERIAL PRIMARY KEY,
  invoice_no       TEXT,
  date_key         INTEGER REFERENCES retail.dim_date(date_key),
  customer_key     BIGINT REFERENCES retail.dim_customer(customer_key),
  product_key      BIGINT REFERENCES retail.dim_product(product_key),
  country_key      BIGINT REFERENCES retail.dim_country(country_key),
  quantity         INTEGER,
  unit_price       NUMERIC(10,2),
  line_amount      NUMERIC(12,2),
  is_return        BOOLEAN DEFAULT FALSE
);

-- Helpful indexes
CREATE INDEX IF NOT EXISTS idx_stg_invoice ON retail.stg_transactions(invoice_no);
CREATE INDEX IF NOT EXISTS idx_fact_date ON retail.fact_sales(date_key);