-- A table to store images for the carousel on each fragrance page.
-- it will be fragrance_id, image_url, alt_text
CREATE TABLE
  IF NOT EXISTS fragrance_images (
    id SERIAL PRIMARY KEY,
    slug VARCHAR(50) NOT NULL, -- This is a combination of the house+fragname e.g dior+homme-intense-2025
    image_count INT NOT NULL DEFAULT 0 -- Removed the trailing comma here
  );

-- images are located in blob storage
-- we just need the file names as path can be constructed
INSERT INTO
  fragrance_images (slug, image_count)
VALUES
  ('dior-homme-parfum-2025', 4),
  ('kayaan-classic', 2),
  ('lattafa-his-confession', 2),
  ('maison-alhambra-dark-door-intense', 2);