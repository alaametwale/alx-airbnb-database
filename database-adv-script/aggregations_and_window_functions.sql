-- 1. Find total number of bookings made by each user
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    COUNT(bookings.id) AS total_bookings
FROM users
LEFT JOIN bookings
    ON users.id = bookings.user_id
GROUP BY users.id, users.name
ORDER BY total_bookings DESC;
-- 2. Rank properties based on the total number of bookings they have received
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    COUNT(bookings.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(bookings.id) DESC) AS row_number,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS rank_position
FROM properties
LEFT JOIN bookings
    ON properties.id = bookings.property_id
GROUP BY properties.id, properties.name
ORDER BY row_number;

EXPLAIN SELECT * FROM bookings WHERE user_id = 5;
Seq Scan on bookings  (cost=0.00..350.00 rows=50 width=...)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
EXPLAIN SELECT * FROM bookings WHERE user_id = 5;
Index Scan using idx_bookings_user_id on bookings  (cost=0.12..8.50 rows=3 width=...)
