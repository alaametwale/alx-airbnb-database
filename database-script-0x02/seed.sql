-- Ensure all foreign keys are respected by inserting parents first

-- 1. Insert Sample Users
INSERT INTO User (user_id, email, password_hash, first_name, last_name, is_host) VALUES
(1, 'host.a@example.com', 'hashed_pw_a1', 'Ahmed', 'Zaki', TRUE),
(2, 'host.b@example.com', 'hashed_pw_b2', 'Layla', 'Said', TRUE),
(3, 'guest.x@example.com', 'hashed_pw_x3', 'Khalid', 'Hassan', FALSE),
(4, 'guest.y@example.com', 'hashed_pw_y4', 'Nour', 'Ali', FALSE);

-- 2. Insert Sample Amenities
INSERT INTO Amenity (amenity_id, name) VALUES
(1, 'WiFi'),
(2, 'Pool'),
(3, 'Parking'),
(4, 'Kitchen'),
(5, 'Air Conditioning');

-- 3. Insert Sample Properties
INSERT INTO Property (property_id, host_id, title, description, address, city, price_per_night, max_guests, number_of_rooms) VALUES
(101, 1, 'Sunny Downtown Loft', 'Modern loft in the heart of the city.', '12 Main St', 'Cairo', 150.00, 4, 1),
(102, 1, 'Desert View Villa', 'Spacious villa with a stunning view.', '5 Oasis Rd', 'Giza', 300.00, 8, 4),
(103, 2, 'Cozy Heliopolis Apartment', 'Quiet and comfortable apartment.', '3 El-Gabal St', 'Cairo', 95.00, 2, 1);

-- 4. Insert Property Amenities (M:N relationship)
INSERT INTO Property_Amenity (property_id, amenity_id) VALUES
(101, 1), (101, 4), 
(102, 1), (102, 2), (102, 3), (102, 5), 
(103, 1), (103, 4); 

-- 5. Insert Sample Bookings
INSERT INTO Booking (booking_id, guest_id, property_id, check_in_date, check_out_date, total_price, status) VALUES
(501, 3, 101, '2025-11-10', '2025-11-15', 750.00, 'Confirmed'),
(502, 4, 102, '2025-12-20', '2025-12-27', 2100.00, 'Confirmed'),
(503, 3, 103, '2026-01-05', '2026-01-07', 190.00, 'Pending');

-- 6. Insert Sample Reviews
INSERT INTO Review (review_id, property_id, guest_id, rating, comment) VALUES
(701, 101, 3, 5, 'Perfect location and very clean!'), 
(702, 102, 4, 4, 'Great pool, but a bit far from the main road.');
