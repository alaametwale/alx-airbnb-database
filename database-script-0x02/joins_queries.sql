-- 1. INNER JOIN: Retrieve all bookings with their respective users
SELECT 
    b.id AS booking_id,
    b.property_id,
    b.booking_date,
    u.id AS user_id,
    u.first_name,
    u.last_name
FROM bookings b
INNER JOIN users u
ON b.user_id = u.id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews (include properties without reviews)
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    r.id AS review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r
ON p.id = r.property_id;

-- 3. FULL OUTER JOIN simulation: Retrieve all users and all bookings
-- MySQL doesn't support FULL OUTER JOIN directly, so we use UNION
SELECT 
    u.id AS user_id,
    u.first_name,
    b.id AS booking_id,
    b.property_id
FROM users u
LEFT JOIN bookings b
ON u.id = b.user_id

UNION

SELECT 
    u.id AS user_id,
    u.first_name,
    b.id AS booking_id,
    b.property_id
FROM users u
RIGHT JOIN bookings b
ON u.id = b.user_id;
