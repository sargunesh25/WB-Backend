-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    original_price DECIMAL(10, 2),
    image_url TEXT,
    is_sale BOOLEAN DEFAULT FALSE,
    is_available BOOLEAN DEFAULT TRUE,
    category VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Hero Slides Table
CREATE TABLE IF NOT EXISTS hero_slides (
    id SERIAL PRIMARY KEY,
    image_url TEXT NOT NULL,
    promo_text VARCHAR(255),
    sort_order INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE
);

-- FAQs Table
CREATE TABLE IF NOT EXISTS faqs (
    id SERIAL PRIMARY KEY,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    sort_order INTEGER DEFAULT 0
);

-- Seed Data (Optional - useful for testing)
INSERT INTO products (title, price, image_url, is_sale) VALUES 
('Teddy Bear Crew', 45.00, 'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', false),
('Sardine Crew', 35.00, 'https://images.unsplash.com/photo-1576566588028-4147f3842f27?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', false);

INSERT INTO hero_slides (image_url, promo_text, sort_order) VALUES
('/hero-background.png', 'All orders $100+ ship for free!', 1),
('/hero-bg-2.png', 'New Arrivals: Check out our latest collection!', 2);

INSERT INTO faqs (question, answer, sort_order) VALUES
('WHEN WILL MY ORDER SHIP?', 'All orders... will ship after January 1st!', 1),
('WHAT SIZE SHOULD I ORDER?', 'All state flower apparel is unisex...', 2);
