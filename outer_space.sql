  -- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space;

CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  name TEXT not null
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy_id INTEGER NOT NULL REFERENCES galaxies ON DELETE CASCADE,
  orbits_id INTEGER NOT NULL REFERENCES orbits ON DELETE CASCADE
);

CREATE TABLE planet_moon
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER NOT NULL REFERENCES planets ON DELETE CASCADE,
  moon_id INTEGER NOT NULL REFERENCES moons ON DELETE CASCADE
);

INSERT INTO orbits
  (name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');
  
INSERT INTO moons
  (moon_name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'), 
  ('Nereid'), 
  ('Halimede'), 
  ('Sao'), 
  ('Laomedeia'), 
  ('Psamathe'), 
  ('Neso');

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

  INSERT INTO planets
  (planet_name, orbital_period_in_years, galaxy_id, orbits_id)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 1, 2),
  ('Gliese 876 b', 0.23, 1, 3);

INSERT INTO planet_moon
  (planet_id, moon_id)
VALUES
  (1, 1),
  (2, 2),
  (2, 3),
  (4, 4),
  (4, 5),
  (4, 6),
  (4, 7),
  (4, 8),
  (4, 9),
  (4, 10),
  (4, 11),
  (4, 12),
  (4, 13),
  (4, 14),
  (4, 15),
  (4, 16),
  (4, 17);