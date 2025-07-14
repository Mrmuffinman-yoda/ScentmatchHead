-- init.sql (optional)
CREATE TABLE
    IF NOT EXISTS users (
        id SERIAL PRIMARY KEY,
        username VARCHAR(50) NOT NULL,
        email VARCHAR(100) NOT NULL,
        password VARCHAR(100) NOT NULL, -- BCRYPT to be used as standard
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

INSERT INTO
    users (username, email, password)
VALUES
    ('muffin', 'muffin@example.com','$2b$12$oQMlODBxoigy54K5dlMohel805jNFzuFgTKkoklUKukxz4A6mAipC');