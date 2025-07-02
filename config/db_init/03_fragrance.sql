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
    'homme-parfum-2025'
  );

-- Insert clones
INSERT INTO
  fragrance (name, house_id, description, slug)
VALUES
  (
    'Kayaan Classic',
    2,
    'Kayaan Classic by Al Wataniah is a Oriental Vanilla fragrance for women and men. This is a new fragrance. Kayaan Classic was launched in 2023. Top notes are Bergamot and Orange; middle notes are Tuscan Iris, Spices, Rose and Jasmine; base notes are Vanilla, Sandalwood, Musk and Patchouli.

',
    'kayaan-classic'
  ),
  (
    'His Confession',
    1,
    'His Confession by Lattafa Perfumes is a Oriental Woody fragrance for men. This is a new fragrance. His Confession was launched in 2024. Top notes are Cinnamon, Lavender and Mandarin; middle notes are Iris, Benzoin, Cypress and Mahonial; base notes are Vanilla, Tonka, Amber, Cedarwood, Incense and Patchouli.',
    'his-confession'
  ),
  (
    'Dark Door Intense',
    3,
    'Dark Door Intense by Maison Alhambra is a Aromatic fragrance for women and men. Dark Door Intense was launched in 2022. Top note is Lavender; middle notes are Iris, Ambrette and Pear; base notes are Virginia Cedar and Vetiver.',
    'dark-door-intense'
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
  ('homme-parfum-2025', 'Iris', 45),
  ('homme-parfum-2025', 'Amber', 25),
  ('homme-parfum-2025', 'Vetiver', 10),
  ('homme-parfum-2025', 'Cedar', 10),
  ('homme-parfum-2025', 'Lavender', 10),
  ('kayaan-classic', 'Powdery', 70),
  ('kayaan-classic', 'Iris', 65),
  ('kayaan-classic', 'Woody', 55),
  ('his-confession', 'Vanilla', 48),
  ('his-confession', 'Violet', 30),
  ('dark-door-intense', 'Iris', 68),
  ('dark-door-intense', 'Amber', 25),
  ('dark-door-intense', 'Cedar', 20);