const express = require('express');
const router = express.Router();
const db = require('../db');

// GET all plays
router.get('/', async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM Play');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to fetch plays' });
  }
});

// GET one play by ID
router.get('/:id', async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM Play WHERE id = $1', [req.params.id]);
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch play' });
  }
});

// CREATE new play
router.post('/', async (req, res) => {
  const { id, title, duration, author, has_recess } = req.body;
  try {
    const result = await db.query(
      `INSERT INTO Play (id, title, duration, author, has_recess)
       VALUES ($1, $2, $3, $4, $5) RETURNING *`,
      [id, title, duration, author, has_recess]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create play' });
  }
});

// UPDATE a play
router.put('/:id', async (req, res) => {
  const { title, duration, author, has_recess } = req.body;
  try {
    const result = await db.query(
      `UPDATE Play SET title = $1, duration = $2, author = $3, has_recess = $4
       WHERE id = $5 RETURNING *`,
      [title, duration, author, has_recess, req.params.id]
    );
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: 'Failed to update play' });
  }
});

// DELETE a play
router.delete('/:id', async (req, res) => {
  try {
    await db.query('DELETE FROM Play WHERE id = $1', [req.params.id]);
    res.json({ message: 'Play deleted' });
  } catch (err) {
    res.status(500).json({ error: 'Failed to delete play' });
  }
});

module.exports = router;
