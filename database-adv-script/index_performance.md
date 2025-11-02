# Index Performance Optimization

## Objective
To improve the performance of frequent SQL queries by adding indexes on high-usage columns.

---

## 1. Identified High-Usage Columns
- **users.email** — used in `WHERE` or `JOIN` when finding user details.
- **bookings.user_id** — used in joins between users and bookings.
- **bookings.property_id** — used in joins between properties and bookings.
- **properties.name** — used in sorting or searching properties.
- **reviews.property_id** — used when displaying all reviews for a property.

---

## 2. Index Creation
```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_properties_name ON properties(name);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
Before adding index:
EXPLAIN SELECT * FROM bookings WHERE user_id = 5;
→ Seq Scan on bookings (cost=0.00..350.00)

After adding index:
EXPLAIN SELECT * FROM bookings WHERE user_id = 5;
→ Index Scan using idx_bookings_user_id (cost=0.12..8.50)

The index reduced query cost significantly, improving performance.
