-- A table to store images for the carousel on each fragrance page.
-- it will be fragrance_id, image_url, alt_text
CREATE TABLE
  IF NOT EXISTS fragrance_images (
    id SERIAL PRIMARY KEY,
    slug VARCHAR(50) NOT NULL,
    image_count INT NOT NULL DEFAULT 0
  );

-- images are located in blob storage
-- we just need the file names as path can be constructed
INSERT INTO
  fragrance_images (slug, image_count)
VALUES
  ('homme-parfum-2025', 4),
  ('kayaan-classic', 2),
  ('his-confession', 2),
  ('dark-door-intense', 2);