#  Retail Sales Data Warehouse


Designed and implemented a PostgreSQL retail data warehouse using a star schema architecture and developed an interactive Power BI dashboard to analyze revenue trends, customer behavior, and product performance across 1M+ transactions (2009–2011).

This project demonstrates a complete end-to-end data workflow:

Raw Data → ETL → Star Schema → KPI Mart → BI Dashboard

---

## Architecture

### Data Source
Online Retail II transactional dataset (2009–2011)

### Pipeline
1. Excel preprocessing using Python (pandas)
2. Staging layer in PostgreSQL
3. Dimension and fact table modeling
4. KPI mart creation
5. Power BI dashboard integration
---

## Data Model (Star Schema)

### Fact Table
- `fact_sales`

### Dimension Tables
- `dim_date`
- `dim_customer`
- `dim_product`
- `dim_country`

---

## Power BI Dashboard
- Total Revenue
- Total Orders
- Total Customers
- Monthly Revenue Trend
- Revenue by Country
- Top 10 Products by Revenue
