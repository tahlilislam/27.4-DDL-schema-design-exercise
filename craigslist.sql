DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region VARCHAR(25) NOT NULL
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category VARCHAR(25) NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(200) NOT NULL,
    pref_region_id INTEGER REFERENCES regions(id) NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description TEXT,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES regions 
);
-- if one or more categories for posts
CREATE TABLE category_post (
    post_id INTEGER REFERENCES posts ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE CASCADE,
    PRIMARY KEY (post_id, category_id)
);

INSERT INTO regions (region) VALUES 
('San Francisco'),
('Atlanta'),
('Seattle'),
('New York'),
('Austin');

INSERT INTO categories (category) VALUES 
('For Sale'),
('Jobs'),
('Housing'),
('Services'),
('Community');

INSERT INTO users (username, password, pref_region_id) VALUES 
('john_doe', 'password123', 1),
('jane_smith', 'securepass456', 2),
('bob_jones', 'mypassword789', 3);

INSERT INTO posts (title, description, user_id, region_id) VALUES 
('Vintage Bicycle', 'A classic red bicycle in good condition.', 1, 1),
('Java Developer Needed', 'Looking for a Java developer with 5 years of experience.', 1, 2),
('2 Bedroom Apartment for Rent', 'Spacious 2 bedroom apartment in a friendly neighborhood available for rent.', 2, 1);

INSERT INTO category_post (post_id, category_id) VALUES 
(1, 1),
(2, 2),
(3, 3);
