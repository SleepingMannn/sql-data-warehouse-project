# Data Catalog: Gold Layer

> Based on the data catalog from the *SQL Data Warehouse Project* by Baraa Khatib Salkini
> (https://github.com/DataWithBaraa/sql-data-warehouse-project, MIT License).
> Descriptions were reworded as part of my learning project.

## Overview

The Gold layer is the final, business-ready layer of the data warehouse. Its data is
organized as a star schema to support reporting and analytics, and it contains
**dimension tables** (descriptive context) and a **fact table** (measurable business events).

---

## 1. gold.dim_customers

**Purpose:** Holds customer information combined from the CRM and ERP sources, including
demographic and geographic attributes.

| Column Name     | Data Type    | Description                                                                              |
|-----------------|--------------|------------------------------------------------------------------------------------------|
| customer_key    | INT          | Surrogate key that uniquely identifies each row in the customer dimension.               |
| customer_id     | INT          | Numeric customer identifier assigned in the source system.                               |
| customer_number | NVARCHAR(50) | Alphanumeric customer code used to track and reference the customer.                     |
| first_name      | NVARCHAR(50) | Customer's first name.                                                                   |
| last_name       | NVARCHAR(50) | Customer's last name (family name).                                                      |
| country         | NVARCHAR(50) | Customer's country of residence (e.g., 'Australia').                                     |
| marital_status  | NVARCHAR(50) | Customer's marital status (e.g., 'Married', 'Single').                                   |
| gender          | NVARCHAR(50) | Customer's gender (e.g., 'Male', 'Female', 'n/a' when unknown).                          |
| birthdate       | DATE         | Customer's date of birth in YYYY-MM-DD format (e.g., 1971-10-06).                        |
| create_date     | DATE         | Date when the customer record was created in the source system.                          |

---

## 2. gold.dim_products

**Purpose:** Holds product information and classification attributes.

| Column Name    | Data Type    | Description                                                                                  |
|----------------|--------------|----------------------------------------------------------------------------------------------|
| product_key    | INT          | Surrogate key that uniquely identifies each row in the product dimension.                    |
| product_id     | INT          | Numeric product identifier used internally in the source system.                             |
| product_number | NVARCHAR(50) | Structured alphanumeric product code, used for categorization and inventory.                 |
| product_name   | NVARCHAR(50) | Descriptive product name, including details such as type, color and size.                    |
| category_id    | NVARCHAR(50) | Identifier of the product's category, linking it to the high-level classification.           |
| category       | NVARCHAR(50) | Main product group (e.g., 'Bikes', 'Components').                                            |
| subcategory    | NVARCHAR(50) | More specific classification within the category, such as the product type.                  |
| maintenance    | NVARCHAR(50) | Shows whether the product requires maintenance (e.g., 'Yes', 'No').                          |
| cost           | INT          | Base cost (price) of the product, in whole currency units.                                   |
| product_line   | NVARCHAR(50) | Product line or series the product belongs to (e.g., 'Road', 'Mountain').                    |
| start_date     | DATE         | Date when the product became available for sale or use.                                      |

---

## 3. gold.fact_sales

**Purpose:** Stores sales transactions (one row per order line) for analysis.

| Column Name   | Data Type    | Description                                                                                  |
|---------------|--------------|----------------------------------------------------------------------------------------------|
| order_number  | NVARCHAR(50) | Unique alphanumeric identifier of the sales order (e.g., 'SO54496').                         |
| product_key   | INT          | Surrogate key linking the sale to `gold.dim_products`.                                       |
| customer_key  | INT          | Surrogate key linking the sale to `gold.dim_customers`.                                      |
| order_date    | DATE         | Date when the order was placed.                                                              |
| shipping_date | DATE         | Date when the order was shipped to the customer.                                             |
| due_date      | DATE         | Date by which payment for the order was due.                                                 |
| sales_amount  | INT          | Total value of the order line, in whole currency units (e.g., 25).                           |
| quantity      | INT          | Number of units ordered in the order line (e.g., 1).                                         |
| price         | INT          | Price per unit for the order line, in whole currency units (e.g., 25).                       |

---

## Relationships

- `gold.fact_sales.customer_key` → `gold.dim_customers.customer_key`
- `gold.fact_sales.product_key` → `gold.dim_products.product_key`
