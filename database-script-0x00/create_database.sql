-- Task 0: Create the main Airbnb database
CREATE DATABASE IF NOT EXISTS airbnb_clone;

-- Switch to this database
USE airbnb_clone;

-- Create a simple base table to start
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
