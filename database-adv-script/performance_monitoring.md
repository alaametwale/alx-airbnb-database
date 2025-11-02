# Performance Monitoring and Refinement Report

## Objective
To monitor and refine database performance by analyzing query execution plans and making schema improvements.

---

## Step 1: Monitoring Queries
We analyzed the performance of frequently used queries such as retrieving bookings with user and property details.

Example monitored query:

```sql
SELECT 
    b.id AS booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date BETWEEN '2024-01-01' AND '2024-12-31';

