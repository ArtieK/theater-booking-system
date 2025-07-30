
const express = require('express');
const router = express.Router();
const db = require('../db');

// GET all bookings
router.get('/', async (req, res) => {
  try {
    const result = await db.query(`
      SELECT b.*, s.row, s.number, p.date_time
      FROM Booking b
      JOIN Seat s ON b.seat_id = s.id
      JOIN Performances p ON b.performance_id = p.id
      ORDER BY p.date_time;
    `);
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to fetch bookings' });
  }
});

// GET single booking
router.get('/:id', async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM Booking WHERE id = $1', [req.params.id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Booking not found' });
    }
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch booking' });
  }
});

// CREATE new booking
router.post('/', async (req, res) => {
  const {
    id,
    performance_id,
    seat_id,
    club_member_id,
    is_free,
    is_discounted,
    purchase_method
  } = req.body;

  try {
    const result = await db.query(
      `INSERT INTO Booking (
        id, performance_id, seat_id, club_member_id,
        is_free, is_discounted, final_price,
        booking_time, purchase_method
      )
      VALUES (
        $1, $2, $3, $4,
        $5, $6, 0,  -- final_price will be set by trigger
        CURRENT_TIMESTAMP, $7
      ) RETURNING *`,
      [
        id,
        performance_id,
        seat_id,
        club_member_id || null,
        is_free,
        is_discounted,
        purchase_method
      ]
    );

    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create booking' });
  }
});

// UPDATE a booking
router.put('/:id', async (req, res) => {
  const {
    performance_id,
    seat_id,
    club_member_id,
    is_free,
    is_discounted,
    purchase_method
  } = req.body;

  try {
    const result = await db.query(
      `UPDATE Booking SET
        performance_id = $1,
        seat_id = $2,
        club_member_id = $3,
        is_free = $4,
        is_discounted = $5,
        purchase_method = $6,
        final_price = 0, -- let trigger recalculate
        booking_time = CURRENT_TIMESTAMP
      WHERE id = $7 RETURNING *`,
      [
        performance_id,
        seat_id,
        club_member_id || null,
        is_free,
        is_discounted,
        purchase_method,
        req.params.id
      ]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Booking not found' });
    }

    res.json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to update booking' });
  }
});

// DELETE a booking
router.delete('/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM Booking WHERE id = $1', [req.params.id]);
    res.json({ message: 'Booking deleted' });
  } catch (err) {
    res.status(500).json({ error: 'Failed to delete booking' });
  }
});

module.exports = router;
