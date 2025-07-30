
-- 1. List all upcoming performances with their play title and date
SELECT p.title, perf.date_time
FROM Performances perf
JOIN Play p ON perf.play_id = p.id
WHERE perf.date_time > CURRENT_TIMESTAMP
ORDER BY perf.date_time;

-- 2. Show seat bookings for a specific performance (replace UUID as needed)
SELECT s.row, s.number, b.is_free, b.is_discounted, b.final_price, cm.name AS booked_by
FROM Booking b
JOIN Seat s ON b.seat_id = s.id
LEFT JOIN ClubMember cm ON b.club_member_id = cm.id
WHERE b.performance_id = '6f341aa7-a038-4f3e-a5b9-ba82fcfac7e9';

-- 3. Check how many free tickets a club member has left
SELECT name, free_tickets
FROM ClubMember
WHERE id = 'd88a76ac-8131-4736-b526-eadf6b037658';

-- 4. Count of seats booked for each performance
SELECT p.title, perf.date_time, COUNT(b.id) AS total_bookings
FROM Performances perf
JOIN Play p ON perf.play_id = p.id
LEFT JOIN Booking b ON perf.id = b.performance_id
GROUP BY p.title, perf.date_time
ORDER BY perf.date_time;

-- 5. See club seat allocations per performance
SELECT perf.date_time, csa.seat_class, csa.reserved_count, csa.free_tickets
FROM ClubSeatAllocation csa
JOIN Performances perf ON csa.performance_id = perf.id
ORDER BY perf.date_time, csa.seat_class;

-- 6. Identify available seats for a performance (not yet booked)
SELECT s.row, s.number
FROM Seat s
WHERE NOT EXISTS (
    SELECT 1 FROM Booking b
    WHERE b.seat_id = s.id
      AND b.performance_id = '6f341aa7-a038-4f3e-a5b9-ba82fcfac7e9'
)
ORDER BY s.row, s.number;
