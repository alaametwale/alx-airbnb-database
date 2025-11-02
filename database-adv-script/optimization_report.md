# Optimization Report

## 1. Initial Query
The initial query joined four tables: bookings, users, properties, and payments.
It retrieved all columns and filtered records by start_date >= '2024-01-01'.

### Performance (Before Optimization)
- Execution Time: ~850ms
- Issues:
  - Full table scans on `bookings` and `payments`
  - No indexes on join columns
  - Retrieved unnecessary columns

---

## 2. Optimization Steps
- Added indexes on:
  - `bookings(user_id)`
  - `bookings(property_id)`
  - `bookings(start_date)`
  - `payments(booking_id)`
- Reduced SELECT columns to only required fields
- Ensured joins use indexed columns

---

## 3. Results (After Optimization)
- Execution Time: ~120ms
- Query plan shows usage of indexes instead of full table scans

---

## 4. Conclusion
Optimization significantly improved performance by reducing scan time and data load.
Indexing and query refactoring were effective in optimizing database operations.
