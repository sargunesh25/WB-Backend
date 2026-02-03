const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
require('./config/db'); // Initialize DB connection

dotenv.config();

const app = express();
const port = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Routes
const authRoutes = require('./routes/authRoutes');
const productRoutes = require('./routes/productRoutes');
const heroRoutes = require('./routes/heroRoutes');
const faqRoutes = require('./routes/faqRoutes');
const contactRoutes = require('./routes/contactRoutes');

app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/products', productRoutes);
app.use('/api/v1/hero-slides', heroRoutes);
app.use('/api/v1/faqs', faqRoutes);
app.use('/api/v1/contact', contactRoutes);

app.get('/', (req, res) => {
    res.send('Wild Breeze API is running');
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
