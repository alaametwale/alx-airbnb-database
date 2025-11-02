-- Task 3: Implement Indexes for Optimization

-- 1. Performance Measurement BEFORE Indexing:
-- Example command to measure a query using the user_id column before indexing:
-- EXPLAIN ANALYZE
-- SELECT * FROM Bookings WHERE user_id = 100;

-- 2. Index Creation:
-- Index the 'user_id' column on the Bookings table
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);

-- Index the 'property_id' column on the Bookings table
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- Index the 'start_date' column for range filtering on Bookings
CREATE INDEX idx_bookings_start_date ON Bookings(start_date);

-- Index the 'email' column for fast user lookups on Users
CREATE INDEX idx_user_email ON Users(email);

-- Index the 'host_id' column for looking up properties by host on Properties
CREATE INDEX idx_property_host_id ON Properties(host_id);


-- 3. Performance Measurement AFTER Indexing:
-- Example command to measure the same query after indexing to demonstrate improvement:
-- EXPLAIN ANALYZE
-- SELECT * FROM Bookings WHERE user_id = 100;
