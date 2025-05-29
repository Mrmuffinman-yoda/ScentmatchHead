-- Create the fragrance table
CREATE TABLE IF NOT EXISTS fragrance (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT,
  slug VARCHAR(50) NOT NULL, -- This is a combination of the house+fragname e.g dior+homme-intense-2025
  imageurl VARCHAR(255) NOT NULL
);

-- Create the fragrance_top_clones table
CREATE TABLE IF NOT EXISTS fragrance_top_clones (
  id SERIAL PRIMARY KEY,
  fragrance_id INT NOT NULL,
  clone_id INT NOT NULL,
  rank INT NOT NULL,
  FOREIGN KEY (fragrance_id) REFERENCES fragrance(id),
  FOREIGN KEY (clone_id) REFERENCES fragrance(id)
);

-- Insert main fragrance
INSERT INTO fragrance (name, description, slug, imageurl)
VALUES
  ('Dior Homme Intense 2025', 'A sophisticated and modern fragrance featuring powdery iris, amber, and woody notes.', 'dior-homme-intense-2025', 'https://placehold.co/1920x1080');

-- Insert clones
INSERT INTO fragrance (name, description, slug, imageurl)
VALUES
  ('Kayaan Classic', 'A clone of Dior Homme Intense.', 'kayaan-classic', 'https://placehold.co/1920x1080'),
  ('His Confession by Lattafa', 'A clone of Dior Homme Intense.', 'lattafa-his-confession', 'https://placehold.co/1920x1080'),
  ('Dark Door by Maison Alhambra', 'A clone of Dior Homme Intense.', 'maison-alhambra-dark-door', 'https://placehold.co/1920x1080');

INSERT INTO fragrance_top_clones (fragrance_id, clone_id, rank)
VALUES
  (1, 2, 2), -- 1st clone
  (1, 3, 1), -- 2nd clone
  (1, 4, 3); -- 3rd clone