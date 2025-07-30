const express = require('express');
const router = express.Router();
const db = require('../db'); 

router.get('/test-db', async (req, res) => {
  try {
    const result = await db.query('SELECT NOW()');
    console.log('Query result:', result.rows); // Debug
    res.json({ serverTime: result.rows[0].now });
  } catch (err) {
    console.error('DB ERROR:', err);
    res.status(500).json({ error: 'Failed to connect to DB' });
  }
});

module.exports = router;
