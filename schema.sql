-- Disable foreign key checks for clean start
SET FOREIGN_KEY_CHECKS = 0;

-- Drop tables if they exist to allow re-running the script
DROP TABLE IF EXISTS Property_Amenity;
DROP TABLE IF EXISTS Amenity;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS User;

-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
CREATE TABLE User (
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(20),
    is_host BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_user_email ON User (email);

-- -----------------------------------------------------
-- Table `Property`
-- -----------------------------------------------------
CREATE TABLE Property (
    property_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    host_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL CHECK (price_per_night > 0),
    max_guests INT NOT NULL CHECK (max_guests > 0),
    number_of_rooms INT,
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (host_id) REFERENCES User(user_id)
        ON DELETE CASCADE 
);
CREATE INDEX idx_property_city_price ON Property (city, price_per_night);

-- -----------------------------------------------------
-- Table `Booking`
-- -----------------------------------------------------
CREATE TABLE Booking (
    booking_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    guest_id BIGINT NOT NULL,
    property_id BIGINT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('Pending', 'Confirmed', 'Cancelled', 'Completed') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (guest_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    CHECK (check_out_date > check_in_date)
);
CREATE INDEX idx_booking_property ON Booking (property_id);
CREATE INDEX idx_booking_guest ON Booking (guest_id);

-- -----------------------------------------------------
-- Table `Amenity`
-- -----------------------------------------------------
CREATE TABLE Amenity (
    amenity_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- -----------------------------------------------------
-- Table `Property_Amenity` (Junction Table)
-- -----------------------------------------------------
CREATE TABLE Property_Amenity (
    property_id BIGINT NOT NULL,
    amenity_id INT NOT NULL,
    
    PRIMARY KEY (property_id, amenity_id),
    
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (amenity_id) REFERENCES Amenity(amenity_id) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table `Review`
-- -----------------------------------------------------
CREATE TABLE Review (
    review_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    property_id BIGINT NOT NULL,
    guest_id BIGINT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (guest_id) REFERENCES User(user_id) ON DELETE CASCADE
);
CREATE INDEX idx_review_property ON Review (property_id);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
