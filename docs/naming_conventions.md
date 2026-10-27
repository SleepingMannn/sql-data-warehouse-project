# Naming Conventions

> Based on the naming conventions document from the *SQL Data Warehouse Project* by
> Baraa Khatib Salkini (https://github.com/DataWithBaraa/sql-data-warehouse-project, MIT License).
> Reworded as part of my learning project.

This document describes how schemas, tables, views, columns and other objects are named in the data warehouse.

## Table of Contents

1. [General Principles](#general-principles)
2. [Table Naming Conventions](#table-naming-conventions)
   - [Bronze Layer](#bronze-layer)
   - [Silver Layer](#silver-layer)
   - [Gold Layer](#gold-layer)
3. [Column Naming Conventions](#column-naming-conventions)
   - [Surrogate Keys](#surrogate-keys)
   - [Technical Columns](#technical-columns)
4. [Stored Procedures](#stored-procedures)

---

## General Principles

- **Style:** use `snake_case`: lowercase letters with underscores (`_`) between words.
- **Language:** all names are in English.
- **Reserved words:** do not use SQL reserved words as object names.

## Table Naming Conventions

### Bronze Layer

Bronze tables keep the names of the source tables. The only addition is a prefix with the name of the source system.

- **Pattern:** `<sourcesystem>_<entity>`
  - `<sourcesystem>`: name of the source system (e.g., `crm`, `erp`).
  - `<entity>`: the original table name from the source system, unchanged.
- **Example:** `crm_cust_info` → customer information from the CRM system.

### Silver Layer

Silver tables follow the same rules as Bronze: the source system prefix plus the original table name, without renaming.

- **Pattern:** `<sourcesystem>_<entity>`
  - `<sourcesystem>`: name of the source system (e.g., `crm`, `erp`).
  - `<entity>`: the original table name from the source system, unchanged.
- **Example:** `crm_cust_info` → cleaned customer information from the CRM system.

### Gold Layer

Gold tables use clear, business-oriented names and start with a prefix that shows the role of the table.

- **Pattern:** `<category>_<entity>`
  - `<category>`: the role of the table, such as `dim` (dimension) or `fact` (fact table).
  - `<entity>`: a descriptive name aligned with the business domain (e.g., `customers`, `products`, `sales`).
- **Examples:**
  - `dim_customers` → dimension table with customer data.
  - `fact_sales` → fact table with sales transactions.

#### Category Prefixes

| Prefix    | Meaning         | Examples                                    |
|-----------|-----------------|---------------------------------------------|
| `dim_`    | Dimension table | `dim_customers`, `dim_products`             |
| `fact_`   | Fact table      | `fact_sales`                                |
| `report_` | Report table    | `report_customers`, `report_sales_monthly` |

## Column Naming Conventions

### Surrogate Keys

The primary (surrogate) key of every dimension table ends with the suffix `_key`.

- **Pattern:** `<entity>_key`
  - `<entity>`: the name of the entity the key belongs to.
  - `_key`: shows that the column is a surrogate key.
- **Example:** `customer_key` → surrogate key of the `dim_customers` table.

### Technical Columns

System-generated metadata columns start with the prefix `dwh_`, followed by a name that describes their purpose.

- **Pattern:** `dwh_<column_name>`
  - `dwh_`: prefix reserved only for system-generated metadata.
  - `<column_name>`: a descriptive name showing the purpose of the column.
- **Example:** `dwh_create_date` → system column that stores the date when the record was loaded into the warehouse.

## Stored Procedures

Stored procedures that load data are named after the layer they load.

- **Pattern:** `load_<layer>`
  - `<layer>`: the layer being loaded: `bronze`, `silver` or `gold`.
- **Examples:**
  - `load_bronze` → procedure that loads data into the Bronze layer.
  - `load_silver` → procedure that loads data into the Silver layer.
