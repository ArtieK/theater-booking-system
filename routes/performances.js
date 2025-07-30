const express = require('express');
const router = express.Router();
const db = require('../db'); //PostgreSQL connection file

// GET /performances/:id/available-seats
router.get('/:id/available-seats', async (req, res) => {
  const performanceId = req.params.id;

  try {
    const result = await db.query(`
      SELECT s.seat_class, json_agg(json_build_object('row', s.row, 'number', s.number)) AS seats
      FROM Seat s
      WHERE NOT EXISTS (
        SELECT 1 FROM Booking b
        WHERE b.seat_id = s.id
          AND b.performance_id = $1
      )
      GROUP BY s.seat_class
      ORDER BY s.seat_class;
    `, [performanceId]);

    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching available seats:', err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
