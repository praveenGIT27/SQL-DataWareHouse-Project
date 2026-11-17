# SQL Data Warehouse Project

A modern data warehouse built on **SQL Server** using the **Medallion Architecture** (Bronze, Silver, Gold). It consolidates sales data from two source systems (CRM and ERP) into a star schema that is ready for reporting and analytics.
---

## Architecture

![Data Architecture](docs/data_architecture.png)

| Layer | Purpose | Object type | Load method | Transformations |
|---|---|---|---|---|
| **Bronze** | Raw data, exactly as it arrives from the source | Tables | Batch, full load (truncate & insert) | None |
| **Silver** | Cleaned, standardized data | Tables | Batch, full load (truncate & insert) | Cleaning, standardization, normalization, derived columns, enrichment |
| **Gold** | Business-ready data | Views | None (views over Silver) | Integration, aggregation, business logic (star schema) |

**Flow:** CSV files (CRM + ERP) → Bronze → Silver → Gold → BI reporting, ad-hoc SQL, machine learning.

---

## Project Requirements

**Objective:** develop a modern data warehouse in SQL Server that consolidates sales data and enables analytical reporting.

- **Data sources:** import data from two source systems (ERP and CRM), provided as CSV files.
- **Data quality:** cleanse and resolve data quality issues before analysis.
- **Integration:** combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope:** latest dataset only. Historization is not required.
- **Documentation:** provide clear documentation of the data model for business stakeholders and analytics teams.

---

## Source Data

| Source | File | Content |
|---|---|---|
| CRM | `cust_info.csv` | Customer master data |
| CRM | `prd_info.csv` | Product master data, with history |
| CRM | `sales_details.csv` | Sales transactions |
| ERP | `CUST_AZ12.csv` | Extra customer attributes (birthdate, gender) |
| ERP | `LOC_A101.csv` | Customer country |
| ERP | `PX_CAT_G1V2.csv` | Product categories |

---

## Repository Structure

```
SQL-DataWareHouse-Project/
├── datasets/              # Raw CSV files
│   ├── source_crm/
│   └── source_erp/
├── docs/                  # Architecture diagram (Draw.io), naming conventions, data catalog
├── scripts/               # SQL scripts
│   ├── init_database.sql  # Creates the database and the bronze/silver/gold schemas
│   ├── bronze/            # DDL + load procedure for raw tables
│   ├── silver/            # DDL + cleansing/load procedure
│   └── gold/              # Star schema views
├── tests/                 # Data quality checks
├── README.md
└── LICENSE
```

---

## Getting Started

1. Install **SQL Server Express** and **SQL Server Management Studio (SSMS)**.
2. Clone this repository.
3. Run `scripts/init_database.sql` to create the `DataWarehouse` database and its schemas.
4. Run the Bronze scripts, then Silver, then Gold.
5. Run the scripts in `tests/` to validate the results.

---

## Project Status

- [x] Requirements analysis
- [x] Data architecture design (Draw.io)
- [x] Git repository setup
- [ ] Database and schemas
- [ ] Bronze layer
- [ ] Silver layer
- [ ] Gold layer
- [ ] Data catalog and data flow documentation

---

## Tools

SQL Server Express · SSMS · Draw.io · Git/GitHub · Notion

## License

[MIT](LICENSE)

## About

Built by Praveen, an operations and reporting lead with a Master's in Engineering (Data Analytics) from the University of Toronto.
