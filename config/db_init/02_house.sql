-- This SQL script creates a table for fragrance houses with the following columns:
CREATE TABLE
    IF NOT EXISTS fragrance_house (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        founded INT NOT NULL,
        country_of_origin VARCHAR(50) NOT NULL,
        logo_url VARCHAR(255) NOT NULL,
        website_url VARCHAR(255) NOT NULL,
        description TEXT NOT NULL
    );

INSERT INTO
    fragrance_house (
        name,
        founded,
        country_of_origin,
        logo_url,
        website_url,
        description
    )
VALUES
    (
        'Lattafa',
        1980,
        'United Arab Emirates',
        'https://example.com/logo.jpg',
        'https://example.com',
        'Lattafa is a fragrance house known for its unique and captivating scents.'
    ),
    (
        'Al Haramain',
        1970,
        'Saudi Arabia',
        'https://example.com/logo.jpg',
        'https://example.com',
        'Al Haramain is a renowned fragrance house that specializes in traditional Arabian perfumes.'
    ),
    (
        'Ajmal',
        1951,
        'United Arab Emirates',
        'https://example.com/logo.jpg',
        'https://example.com',
        'Ajmal is a leading fragrance house that offers a wide range of oriental and western perfumes.'
    );

-- Add more as required --