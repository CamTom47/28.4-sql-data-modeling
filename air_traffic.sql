-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic;



CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE seats
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL
);

CREATE TABLE times
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE routes
(
  id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES airlines ON DELETE SET NULL,
  time_id INTEGER REFERENCES times ON DELETE SET NULL,
  location_id INTEGER REFERENCES routes ON DELETE SET NULL,
  seat_id INTEGER REFERENCES seats ON DELETE SET NULL
);

CREATE TABLE itinerary
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  itinerary_id INTEGER REFERENCES itinerary ON DELETE SET NULL
);

  
 
INSERT INTO seats
  (seat)
VALUES
   ('33B'),
  ('8A'),
  ('12F'),
  ('20A'),
  ('23D'),
  ('18C'),
  ('9E'),
  ('1A'),
  ('32B'),
  ('10D');

INSERT INTO airlines
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly'),
  ('Air China'),
  ('United'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO times
  (departure, arrival)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00'), 
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00');
  
INSERT INTO routes
  (from_city, from_country, to_city, to_country)
VALUES
  ('Washington DC', 'United States', 'Seattle', 'United States'),
  ('Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('Seattle','United States', 'Mexico City', 'Mexico'),
  ('Paris', 'France', 'Casablanca', 'Morocco'),
  ('Dubai', 'UAE', 'Beijing', 'China'),
  ('New York', 'United States', 'Charlotte', 'United States'),
  ('Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil', 'Santiago', 'Chile');
  
INSERT INTO tickets
  (airline_id, time_id, location_id, seat_id)
VALUES
  (1, 1, 1, 1 ),
  (2, 2, 2, 2 ),
  (3, 3, 3, 3 ),
  (3, 4, 4, 4 ),
  (4, 5, 5, 5 ),
  (5, 6, 6, 6 ),
  (1, 7, 7, 7 ),
  (6, 8, 8, 8 ),
  (6, 9, 9, 9 ),
  (7, 10, 10, 10 );
  

  INSERT INTO itinerary
  (first_name, last_name, itinerary_id)
VALUES
  ('Jennifer', 'Finch', 1),
  ('Thadeus', 'Gathercoal', 2),
  ('Sonja', 'Pauley', 3),
  ('Jennifer', 'Finch', 4),
  ('Waneta', 'Skeleton', 5),
  ('Thadeus', 'Gathercoal', 6),
  ('Berkie', 'Wycliff', 7),
  ('Alvin', 'Leathes', 8),
  ('Berkie', 'Wycliff', 9),
  ('Cory', 'Squibbes', 10);