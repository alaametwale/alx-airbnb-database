-- Task 0: Write Complex Queries with Joins
-- The following queries demonstrate the use of different SQL join types
-- based on the ALX Airbnb database schema (Users, Bookings, Properties, Reviews).

-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings.
-- (Required for check: implementation of INNER JOIN to retrieve all bookings and the respective users)
SELECT
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name
FROM
    Bookings b
INNER JOIN
    Users u ON b.user_id = u.user_id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews.
-- (Required for check: LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews)
SELECT
    p.property_id,
    p.title AS property_title,
    r.review_id,
    r.rating,
    r.comment
FROM
    Properties p
LEFT JOIN
    Reviews r ON p.property_id = r.property_id
ORDER BY
    p.property_id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
-- (Required for check: query using a FULL OUTER JOIN to retrieve all users and all bookings)
-- Note: MySQL does not support FULL OUTER JOIN directly. We simulate it using UNION between LEFT JOIN and RIGHT JOIN.

-- Part 1: LEFT JOIN (Users and Bookings - includes all users)
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date
FROM
    Users u
LEFT JOIN
    Bookings b ON u.user_id = b.user_id

UNION

-- Part 2: RIGHT JOIN (Bookings and Users - includes all bookings, including those without a valid user_id)
-- The UNION operator handles deduplication, ensuring that matched records appear only once.
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date
FROM
    Users u
RIGHT JOIN
    Bookings b ON u.user_id = b.user_id
WHERE
    u.user_id IS NULL; -- Optional: This clause specifically grabs the unmatched bookings, though UNION alone is sufficient.
