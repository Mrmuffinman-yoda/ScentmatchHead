-- Create the fragrance table
CREATE TABLE
  IF NOT EXISTS fragrance (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    house_id INT NOT NULL,
    description TEXT,
    slug VARCHAR(50) NOT NULL -- This is a combination of the house+fragname e.g dior+homme-intense-2025
  );

-- Create the fragrance_top_clones table
CREATE TABLE
  IF NOT EXISTS fragrance_top_clones (
    id SERIAL PRIMARY KEY,
    fragrance_id INT NOT NULL,
    clone_id INT NOT NULL,
    rank INT NOT NULL,
    FOREIGN KEY (fragrance_id) REFERENCES fragrance (id),
    FOREIGN KEY (clone_id) REFERENCES fragrance (id)
  );

-- Insert main fragrance
INSERT INTO
  fragrance (name, house_id, description, slug)
VALUES
  (
    'Dior Homme Parfum 2025',
    5,
    'A sophisticated and modern fragrance featuring powdery iris, amber, and woody notes.',
    'dior-homme-parfum-2025'
  );

-- Insert clones
INSERT INTO
  fragrance (name, house_id, description, slug)
VALUES
  (
    'Kayaan Classic',
    2,
    'A clone of Dior Homme Parfum 2025.',
    'al-wataniah-kayaan-classic'
  ),
  (
    'His Confession',
    1,
    'A clone of Dior Homme Parfum 2025.',
    'lattafa-his-confession'
  ),
  (
    'Dark Door Intense',
    3,
    'A clone of Dior Homme Parfum 2025.',
    'maison-alhambra-dark-door-intense'
  );

INSERT INTO
  fragrance_top_clones (fragrance_id, clone_id, rank)
VALUES
  (1, 2, 2), -- 1st clone
  (1, 3, 1), -- 2nd clone
  (1, 4, 3);

-- 3rd clone
-- Table of fragrance accords for each fragrance
-- fragrance slug + accord
CREATE TABLE
  IF NOT EXISTS fragrance_accords (
    id SERIAL PRIMARY KEY,
    slug VARCHAR(50) NOT NULL,
    accord VARCHAR(50) NOT NULL,
    percentage INT NOT NULL
  );

-- Insert fragrance accords
INSERT INTO
  fragrance_accords (slug, accord, percentage)
VALUES
  ('dior-homme-parfum-2025', 'Iris', 45),
  ('dior-homme-parfum-2025', 'Amber', 25),
  ('dior-homme-parfum-2025', 'Vetiver', 10),
  ('dior-homme-parfum-2025', 'Cedar', 10),
  ('dior-homme-parfum-2025', 'Lavender', 10);