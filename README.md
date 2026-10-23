# Data Warehouse Project (SQL Server)

> **📚 Learning project**
> This is a learning project built while following the free *SQL Data Warehouse*
> course by **Baraa Khatib Salkini** ([Data With Baraa](https://github.com/DataWithBaraa/sql-data-warehouse-project)).
>
> - Original repository: https://github.com/DataWithBaraa/sql-data-warehouse-project
> - Video tutorial: https://youtu.be/SSKVgrwhzus?si=jnNL6c97yBya66NP
>
> The original idea, structure and data belong to the author. I followed the course
> step by step to practice SQL and data warehousing. My own changes and additions
> are listed in the section [What I did myself](#what-i-did-myself).

## Overview

Building a modern data warehouse with SQL Server, including ETL processes,
data modeling and analytics.

Raw data from two source systems (CRM and ERP, provided as CSV files) is loaded,
cleaned and combined into a single data model that is ready for analysis.

## Architecture

The project follows the **Medallion Architecture**:

<img width="5445" height="2793" alt="High_Level_Architecture" src="https://github.com/user-attachments/assets/dc86e4e8-1c76-4942-bb78-f83f87eed332" />

| Layer | Purpose |
|--------|---------|
| **Bronze** | Raw data loaded as-is from the CSV files |
| **Silver** | Cleaned and standardized data |
| **Gold** | Business-ready data modeled as a star schema for reporting and analytics |

## Tech Stack

- SQL Server
- SQL Server Management Studio (SSMS)
- Git / GitHub
- Figma (diagrams)



## What I Did Myself

<!-- Fill this in as you go. Examples: -->
- Rewrote the script headers and documentation in my own words
- <your addition, e.g. extra data quality checks>
- <your addition, e.g. additional analytical queries>

## What I Learned

<!-- 3-5 sentences in your own words: ETL, data modeling, data cleaning, working with Git. -->

## License

This project is licensed under the [MIT License](LICENSE).
The original work is Copyright (c) 2024 Baraa Khatib Salkini.
