
#Theater Booking System

This project implements a full-featured theater booking database in PostgreSQL, including performance schedules, seat reservations, club memberships, and business logic.

---

## 📁 Deliverables & File Mapping

| Requirement                              | File                     |
|------------------------------------------|--------------------------|
| Environment Setup Instructions           | `ENVIRONMENT.md` (not included here, assumed delivered earlier) |
| **DDL Script** (schema & constraints)    | `schema.sql`             |
| **DML Script** (sample data)             | `data_reorganized_step1.sql` to `data_reorganized_step5.sql` *(can be combined)* |
| **PL/pgSQL Logic** (functions/triggers)  | `logic.sql`              |
| **Queries & Views** (select/view logic)  | `queries.sql`            |
| **README**                               | `README.md` *(this file)* |

---

## Running the Project

### 1.)Load Schema
```bash
psql -U postgres -d theater_db -f schema.sql
```

### 2.)Load Sample Data
In order:
```bash
psql -U postgres -d theater_db -f data_reorganized_step1.sql
psql -U postgres -d theater_db -f data_reorganized_step2.sql
psql -U postgres -d theater_db -f data_reorganized_step3.sql
psql -U postgres -d theater_db -f data_reorganized_step4.sql
psql -U postgres -d theater_db -f data_reorganized_step5.sql
```
Or combine them:
```bash
cat data_reorganized_step*.sql > data_full.sql
psql -U postgres -d theater_db -f data_full.sql
```

### 3.)Load Logic (Triggers & Functions)
```bash
psql -U postgres -d theater_db -f logic.sql
```

### 4.)Run Queries
```bash
psql -U postgres -d theater_db -f queries.sql
```

---

## Assumptions & Notes

- Booking records **link seats and performances directly**, so no separate `PerformanceSeat` table was needed.
- `Booking.final_price` is calculated automatically via a trigger based on `price_factor`.
- Bookings are **not allowed within 3 days** of a performance (enforced via trigger).
- Club seat allocation is tracked per performance using `ClubSeatAllocation`.
- Sample data includes 5 plays, 10 performances, 8 members, 15 seats, and more than 20 bookings.
- Assumes base ticket price of `$20.00` in pricing logic (adjustable in `apply_dynamic_pricing()`).

---

##Final Notes

All deliverables are validated to work in order. Reach out with any issues running your schema or data. Good luck and enjoy the show!
