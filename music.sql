-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE production
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER NOT NULL REFERENCES songs ON DELETE SET NULL,
  artist_id INTEGER NOT NULL REFERENCES artists ON DELETE SET NULL,
  album_id INTEGER NOT NULL REFERENCES albums ON DELETE SET NULL,
  producer_id INTEGER NOT NULL REFERENCES producers ON DELETE SET NULL
);


INSERT INTO albums
(album_name)
VALUES
 ('Middle of Nowhere'),
 ('A Night at the Opera'),
 ('Daydream'),
 ('A Star Is Born'),
 ('Silver Side Up'),
 ('The Blueprint 3'),
 ('Prism'),
 ('Hands All Over'),
 ('Let Go'),
 ('The Writings on the Wall');

 INSERT INTO artists
(artist_name)
VALUES
 ('Hanson'),
 ('Queen'),
 ('Mariah Cary'),
 ('Lady Gaga'),
 ('Nickelback'),
 ('Jay Z'),
 ('Katy Perry'),
 ('Maroon 5'),
 ('Avril Lavigne'),
 ('Destinys Child'),
 ('Boyz II Men'),
 ('Bradley Cooper'),
 ('Alicia Keys'),
 ('Juicy J'),
 ('Christina Aguilera');

INSERT INTO producers
(producer_name)
VALUES
 ('Dust Brothers'),
 ('Roy Thomas Baker'),
 ('Walter Afanasieff'),
 ('Benjamin Rice'),
 ('Rick Parashar'),
 ('Al Shux'),
 ('Max Martin'),
 ('Shellback'),
 ('The Matrix'),
 ('Darkchild'),
 ('Stephen Lironi'),
 ('Cirkut'),
 ('Benny Blanco');

INSERT INTO songs
  (title, duration_in_seconds, release_date)
VALUES
('MMMBop',	238, '04-15-1997'),
('Bohemian Rhapsody',	355, '10-31-1975'),
('One Sweet Day',	282, '11-14-1995'),
('Shallow',	216, '09-27-2018'),
('How You Remind Me',	223, '08-21-2001'),
('New York State of Mind',	276, '10-20-2009'),
('Dark Horse', 215, '12-17-2013'),
('Moves Like Jagger',	201, '06-21-2011'),
('Complicated',	244, '05-14-2002'),
('Say My Name',	240, '11-07-1999');

INSERT INTO production
(song_id, artist_id, album_id, producer_id)
VALUES
(1,1,1,1),
(1,1,1,11),
(2,2,2,2),
(3,3,3,3),
(3,11,3,3),
(4,4,4,4),
(4,12,4,4),
(5,5,5,5),
(6,6,6,6),
(6,13,6,6),
(7,7,7,7),
(7,7,7,12),
(7,14,7,7),
(7,14,7,12),
(8,8,8,8),
(8,8,8,13),
(8,15,8,8),
(8,15,8,13),
(9,9,9,9),
(10,10,10,10);

SELECT * FROM production
JOIN songs ON songs.id = production.song_id
JOIN artists ON artists.id = production.artist_id
JOIN albums ON albums.id = production.album_id
JOIN producers ON producers.id = production.producer_id;