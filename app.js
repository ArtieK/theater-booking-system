require('dotenv').config();
const express = require('express');
const app = express();
const performanceRoutes = require('./routes/performances');
const playRoutes = require('./routes/plays');
const bookingRoutes = require('./routes/bookings');
const testRoutes = require('./routes/test');

// Middleware
app.use(express.json());

// Routes
app.use('/performances', performanceRoutes);
app.use('/plays', playRoutes);
app.use('/bookings', bookingRoutes);
app.use('/', testRoutes);

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});