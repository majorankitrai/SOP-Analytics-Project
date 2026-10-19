# Sales & Operations Planning (S&OP) Analytics

## Project Overview

This project delivers a centralized Sales & Operations Planning (S&OP) analytics solution using PostgreSQL, SQL, and Microsoft Power BI.

The objective is to bring together business data across sales, budgeting, forecasting, inventory, operations, and logistics to provide actionable insights through interactive dashboards and analytical queries.

The solution helps stakeholders monitor business performance, identify gaps against targets, and make data-driven operational and strategic decisions.

## Business Objectives

- Analyze actual sales performance against budget.
- Calculate budget achievement and budget variance.
- Evaluate sales trends and forecast performance.
- Monitor inventory health and stock availability.
- Measure production and operational efficiency.
- Track shipment performance and on-time delivery.
- Analyze customer and product profitability.
- Provide management with a consolidated view of business performance.

## Technology Stack

| Technology | Purpose |
|---|---|
| PostgreSQL | Relational database and data storage |
| pgAdmin 4 | SQL development and database management |
| SQL | Data analysis, aggregation, joins, and KPI calculations |
| Microsoft Power BI | Interactive dashboards and business reporting |
| Power Query | Data preparation and transformation in Power BI |
| DAX | Measures and analytical calculations |
| Microsoft Excel | Supporting dataset and data inspection |
| GitHub | Project version control and documentation |

## Project Structure

- `01_Data/` — Fact tables, dimension tables, and supporting datasets.
- `02_Data/` — Dimension tables
- `03_Data/` - Images
-  04_SQL scripts for business analysis and KPI calculations.
- `05_PowerBI/` — Power BI report files.
- `06_Documentation/` — Business Requirements Document and modeling presentation.
- `07_Images/` — Dashboard screenshots and visual assets.

*Note: Update the folder names above if your actual repository uses different names.*

## Data Model

The project uses fact and dimension tables to organize business data for analytical reporting.

Fact tables store measurable business events and values, while dimension tables provide descriptive attributes for analyzing results across relevant business categories.

The model supports analysis of sales, budgets, forecasts, inventory, production, and shipments, according to the tables available in the project.

## Key Performance Indicators (KPIs)

The analytical solution covers the following business metrics, where supported by the available data:

- **Total Sales:** Total sales revenue over the selected period.
- **Budget Achievement %:** Actual sales divided by budget, multiplied by 100.
- **Budget Variance:** Difference between actual sales and budget.
- **Forecast Accuracy:** Comparison of forecasted and actual performance using a defined accuracy methodology.
- **Inventory Health:** Assessment of inventory levels and stock availability.
- **Production Efficiency:** Production output relative to the applicable target or standard.
- **On-Time Delivery %:** Percentage of shipments delivered on or before the expected delivery date.
- **Customer Profitability:** Profit contribution by customer.
- **Product Profitability:** Profit contribution by product.

KPI calculations depend on the business definitions, available data, and reporting filters.

## SQL Analysis

The SQL scripts demonstrate analytical techniques including:

- Common Table Expressions (CTEs).
- Aggregate functions such as `SUM()` and `COUNT()`.
- Joins between fact and dimension tables.
- Date-based and monthly analysis.
- Year-wise and category-wise aggregations.
- Budget achievement and variance calculations.
- Business KPI development.

## Power BI Reporting

The Power BI report provides interactive business analysis using measures, visualizations, filters, and a structured data model.

The reporting solution is intended to help business stakeholders review performance, compare results with targets, and investigate areas requiring attention.

## Business Requirements

The Business Requirements Document defines the business problem, reporting objectives, scope, and analytical requirements.

The modeling presentation provides supporting information about the analytical model and project design.

## Repository Contents

This repository includes:

- Business Requirements Document (BRD).
- SQL analytical queries.
- Power BI report file(s).
- Fact and dimension table CSV files.
- Supporting dataset.
- Data modeling presentation.
- Dashboard images and visual assets.

## How to Explore the Project

1. Review the BRD to understand the business objectives and requirements.
2. Explore the data files to understand the available datasets.
3. Review the SQL scripts to understand the analytical calculations.
4. Open the Power BI report in Microsoft Power BI Desktop to explore the dashboards.
5. Review the screenshots and modeling presentation for additional context.

Opening the Power BI report may require importing the sample data or configuring a compatible database connection.

## Project Status

Portfolio project — documentation and analytical artifacts are maintained in this repository.

## Author

Ankit

**Disclaimer:** This repository is intended for portfolio and educational purposes. Published datasets should be synthetic or otherwise authorized for public distribution.
