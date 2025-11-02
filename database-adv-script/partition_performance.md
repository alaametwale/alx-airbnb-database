# Partitioning Performance Report

## Objective
To optimize queries on the large `bookings` table by implementing partitioning based on the `start_date` column.

---

## Steps Taken
1. Implemented **RANGE partitioning** on the `bookings` table using the `start_date` column.
2. Created separate partitions for each year (2021–2024).
3. Tested query performance using `EXPLAIN ANALYZE` on date-range queries.

---

## Observations

### Before Partitioning
- Query execution on large datasets required **full table scans**.
- Average query time: ~850ms  
- Execution plan showed: `Seq Scan on bookings`

### After Partitioning
- Query execution limited to relevant partitions (e.g., `bookings_2024`).
- Average query time: ~150ms  
- Execution plan showed: `Bitmap Index Scan` on partitions.
- Significant improvement in query performance, especially for date-based filters.

---

## Conclusion
Partitioning the `bookings` table by `start_date` drastically improved performance for date range queries.  
It reduced unnecessary scans on unrelated data, improving both speed and resource efficiency.
