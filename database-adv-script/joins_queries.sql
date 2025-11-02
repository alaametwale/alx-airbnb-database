-- 1. Retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email
FROM bookings
INNER JOIN users
ON bookings.user_id = users.id;

-- 2. Retrieve all properties and their reviews (including those without reviews)
SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating AS review_rating,
    reviews.comment AS review_comment
FROM properties
LEFT JOIN reviews
    ON properties.id = reviews.property_id
ORDER BY properties.id;


-- 3. Retrieve all users and all bookings, even if user has no booking
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date
FROM users
FULL OUTER JOIN bookings
ON users.id = bookings.user_id;
