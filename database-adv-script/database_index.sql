-- Task 3: Implement Indexes for Optimization

-- 1. Index on Users table
-- Index the 'email' column for faster user lookup (e.g., login or search)
CREATE INDEX idx_user_email ON Users(email);

-- 2. Indexes on Bookings table
-- Index the 'user_id' column, heavily used for joins with the Users table (e.g., Task 0 and 1)
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);

-- Index the 'property_id' column, heavily used for joins with the Properties table and filtering
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- Index 'start_date' for efficient range queries (e.g., finding bookings in a specific month or week)
CREATE INDEX idx_bookings_start_date ON Bookings(start_date);

-- 3. Index on Property table
-- Index the 'host_id' column for finding properties owned by a specific host
CREATE INDEX idx_property_host_id ON Properties(host_id);
