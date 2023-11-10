-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE airplanes (
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  airline_id INTEGER REFERENCES airlines 
);

CREATE TABLE times (
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL
);

CREATE TABLE from_destination (
  id SERIAL PRIMARY KEY,
  from_city INTEGER REFERENCES cities,
  from_country INTEGER REFERENCES countries
);

CREATE TABLE to_destination (
  id SERIAL PRIMARY KEY,
  to_city INTEGER REFERENCES cities,
  to_country INTEGER REFERENCES countries
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers,
  airplanes_id INTEGER REFERENCES airplanes,
  time_id INTEGER REFERENCES times,
  from_id INTEGER REFERENCES from_destination,
  to_id INTEGER REFERENCES to_destination
);

INSERT INTO passengers (first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Jennifer', 'Finch'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes')
;

INSERT INTO airlines (airline)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil')
;

INSERT INTO airplanes (seat, airline_id)
VALUES
('33B', 1),
('8A', 2),
('12F', 3),
('20A', 3),
('23D', 4),
('18C', 5),
('9E', 1),
('1A', 6),
('32B', 6),
('10D', 7)
;

INSERT INTO times (departure, arrival) 
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
('2019-01-20 19:30:00', '2019-01-20 22:45:00')
;

INSERT INTO cities (city)
VALUES
('Washington DC'),
('Tokyo'),
('Los Angeles'),
('Seattle'),
('Paris'),
('Dubai'),
('New York'),
('Cedar Rapids'),
('Charlotte'),
('Sao Paolo'),
('London'),
('Las Vegas'),
('Mexico City'),
('Casablanca'),
('Beijing'),
('Chicago'),
('New Orleans'),
('Santiago')
;

INSERT INTO countries (country)
VALUES
('United States'),
('Japan'),
('France'),
('UAE'),
('Brazil'),
('United Kingdom'),
('Mexico'),
('Morocco'),
('China'),
('Chile')
;

INSERT INTO from_destination (from_city, from_country)
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 3),
(6, 4),
(7, 1),
(8, 1),
(9, 1),
(10, 5)
;

INSERT INTO to_destination (to_city, to_country)
VALUES
(4, 1),
(11, 6),
(12, 1),
(13, 7),
(14, 10),
(15, 9),
(9, 1),
(16, 1),
(17, 1),
(18, 10)
;

INSERT INTO tickets (passenger_id, airplanes_id, time_id, from_id, to_id) 
VALUES 
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3),
(4, 4, 4, 4, 4),
(5, 5, 5, 5, 5),
(2, 6, 6, 6, 6),
(6, 7, 7, 7, 7),
(7, 8, 8, 8, 8),
(6, 9, 9, 9, 9),
(8, 10, 10, 10, 10)
;

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');