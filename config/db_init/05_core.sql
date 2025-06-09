-- create a table which stores the current top fragrances
CREATE TABLE
  IF NOT EXISTS top_fragrances (
    id SERIAL PRIMARY KEY,
    fragrance_id INT NOT NULL,
    rank INT NOT NULL,
    FOREIGN KEY (fragrance_id) REFERENCES fragrance (id)
  );

-- insert the top three fragrances
INSERT INTO
  top_fragrances (fragrance_id, rank)
VALUES
  (1, 1);

-- Assuming fragrance with ID 3 is the third top fragrance