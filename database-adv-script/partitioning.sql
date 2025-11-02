-- partitioning.sql
-- Implement partitioning on the bookings table based on start_date

-- 1. Drop existing table if needed (optional)
-- DROP TABLE IF EXISTS bookings;

-- 2. Recreate the table with partitioning
CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);

-- 3. Example query to test performance on a partitioned table
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
