-- Create indexes to improve query performance

CREATE INDEX idx_users_email
ON users(email);

CREATE INDEX idx_bookings_user_id
ON bookings(user_id);

CREATE INDEX idx_bookings_property_id
ON bookings(property_id);

CREATE INDEX idx_properties_name
ON properties(name);

-- Check performance before and after using EXPLAIN or ANALYZE
EXPLAIN SELECT * FROM bookings WHERE user_id = 1;
ANALYZE SELECT * FROM bookings WHERE user_id = 1;
