CREATE TABLE
    IF NOT EXISTS fragrance_house (
        id SERIAL PRIMARY KEY,
        slug VARCHAR(50) NOT NULL UNIQUE, -- Unique identifier for the house
        name VARCHAR(50) NOT NULL,
        founded INT NOT NULL,
        country_of_origin VARCHAR(50) NOT NULL,
        website_url VARCHAR(255) NOT NULL,
        description TEXT NOT NULL
    );

INSERT INTO
    fragrance_house (
        name,
        slug,
        founded,
        country_of_origin,
        website_url,
        description
    )
VALUES
    (
        'Lattafa',
        'lattafa',
        1980,
        'United Arab Emirates',
        'https://example.com',
        'Lattafa is a fragrance house known for its unique and captivating scents.'
    ),
    (
        'Al Wataniah',
        'al-wataniah',
        1970,
        'Saudi Arabia',
        'https://example.com',
        'Kaayan is a renowned fragrance house that specializes in traditional Arabian perfumes.'
    ),
    (
        'Maison Alhambra',
        'maison-alhambra',
        2000,
        'United Arab Emirates',
        'https://example.com',
        'Maison Alhambra is known for its luxurious and high-quality fragrances.'
    ),
    (
        'Ajmal',
        'ajmal',
        1951,
        'United Arab Emirates',
        'https://example.com',
        'Ajmal is a leading fragrance house that offers a wide range of oriental and western perfumes.'
    ),
    (
        'Dior',
        'dior',
        1946,
        'France',
        'https://www.dior.com',
        'Dior is a luxury fragrance house known for its iconic perfumes and innovative scents.'
    );

-- Add more as required --