const db = require('../config/db');

exports.getAllProducts = async (req, res) => {
    try {
        const { sort, category } = req.query;
        let queryText = 'SELECT * FROM products';
        const queryParams = [];

        if (category) {
            queryText += ' WHERE category = $1';
            queryParams.push(category);
        }

        if (sort === 'price_asc') {
            queryText += ' ORDER BY price ASC';
        } else if (sort === 'price_desc') {
            queryText += ' ORDER BY price DESC';
        } else {
            queryText += ' ORDER BY created_at DESC';
        }

        const result = await db.query(queryText, queryParams);
        res.json(result.rows);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Server error' });
    }
};

exports.getProductById = async (req, res) => {
    try {
        const { id } = req.params;
        const result = await db.query('SELECT * FROM products WHERE id = $1', [id]);

        if (result.rows.length === 0) {
            return res.status(404).json({ error: 'Product not found' });
        }

        res.json(result.rows[0]);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Server error' });
    }
};
