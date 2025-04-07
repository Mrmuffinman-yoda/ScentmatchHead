-- Create the fragrance table
CREATE TABLE
  IF NOT EXISTS fragrance (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    scent_profile VARCHAR(50),
    house_id INT NOT NULL,
    FOREIGN KEY (house_id) REFERENCES fragrance_house (id)
  );

-- Insert data into the fragrance table
INSERT INTO
  fragrance (name, description, price, scent_profile, house_id)
VALUES
  -- Dior Homme Intense 2025
  (
    'Homme Intense',
    'A rich and intense fragrance with notes of iris, amber, and leather.',
    120.00,
    'Woody Floral',
    1
  ),
  -- Lattafa Raghba
  (
    'Raghba',
    'A sweet and spicy fragrance with notes of vanilla, oud, and amber.',
    50.00,
    'Oriental Spicy',
    2
  ),
  -- Al Haramain Amber Oud
  (
    'Amber Oud',
    'A luxurious fragrance with notes of oud, amber, and spices.',
    80.00,
    'Oriental Woody',
    3
  );

-- Create the fragrance_top table
CREATE TABLE
  IF NOT EXISTS fragrance_top (
    id SERIAL PRIMARY KEY,
    fragrance_id INT NOT NULL,
    rank INT NOT NULL,
    FOREIGN KEY (fragrance_id) REFERENCES fragrance (id)
  );

-- Insert data into the fragrance_top table
INSERT INTO
  fragrance_top (fragrance_id, rank)
VALUES
  (1, 1),
  (2, 2);