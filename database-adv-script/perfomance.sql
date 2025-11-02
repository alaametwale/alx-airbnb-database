-- perfomance.sql
-- Analyze the query performance using EXPLAIN
-- Complex query that retrieves all bookings with user, property, and payment details

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount,
    pay.payment_date
FROM bookings b
JOIN users u 
    ON b.user_id = u.id
JOIN properties p 
    ON b.property_id = p.id
JOIN payments pay 
    ON pay.booking_id = b.id
WHERE b.start_date >= '2024-01-01'
  AND pay.amount > 0
ORDER BY b.start_date;
