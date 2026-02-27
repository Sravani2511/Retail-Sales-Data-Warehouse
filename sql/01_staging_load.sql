-- 01_staging_load.sql
-- Staging load will be done via CSV import through pgAdmin
-- Steps:
-- 1) Convert Excel to CSV locally (not committed to GitHub)
-- 2) Use pgAdmin Import/Export on retail.stg_transactions
-- 3) Run validation queries below

-- Basic checks
SELECT COUNT(*) AS stg_row_count FROM retail.stg_transactions;

SELECT
  COUNT(*) FILTER (WHERE customer_id IS NULL) AS null_customer_id,
  COUNT(*) FILTER (WHERE quantity < 0) AS negative_qty
FROM retail.stg_transactions;