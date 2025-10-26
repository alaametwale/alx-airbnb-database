# Database Schema Design (DDL)

This directory contains the SQL script (`schema.sql`) for defining the database structure.

## File Description: `schema.sql`

The script includes `CREATE TABLE` statements for all entities, ensuring Third Normal Form (3NF). The DDL incorporates:
* Appropriate **data types** and **Primary Keys**.
* **Foreign Keys** with `ON DELETE CASCADE` for maintaining data integrity.
* **Constraints** (`NOT NULL`, `UNIQUE`, `CHECK`).
* **Indexes** (`CREATE INDEX`) to optimize common search operations.
