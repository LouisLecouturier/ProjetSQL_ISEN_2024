INSERT INTO KoAIRCRAFT (IATA, AUTONOMY, SPEED, SEATS, MAX_LOAD, MAX_FUEL)
VALUES
  ('A320', 4400, 840, 180, 70000, 30000),
  ('B737', 5000, 800, 160, 60000, 27000),
  ('A330', 11000, 870, 290, 230000, 110000),
  ('B777', 14600, 905, 360, 230000, 170000);

INSERT INTO AIRCRAFTS (AIRCRAFT_NBR, LAST_SERVICING, TOTALFLIGHTHOURS, KoAIRCRAFT_IATA)
VALUES
  (1, '2023-12-25', 2500, 'A320'),
  (2, '2024-01-10', 3100, 'B737'),
  (3, '2023-11-18', 7800, 'A330'),
  (4, '2024-02-15', 5200, 'B777');


INSERT INTO EFF_FLIGHTS (WEEKDAYS_DAY_NBR, PLAN_FLIGHTS_FLIGHT_NBR, PLAN_DEP_DATE, RES_SEATS_QTY, OCC_SEATS_QTY, REAL_DEP_TIME, REAL_ARR_TIME, LOADED_FUEL, CREWS_CREW_CODE, AIRCRAFTS_AIRCRAFT_NBR)
VALUES
  (1, 101, '2024-03-25 10:00:00', 180, 170, '2024-03-25 10:15:00', '2024-03-25 11:30:00', 25000, 1, 1),
  (2, 102, '2024-03-26 15:00:00', 160, 145, '2024-03-26 15:10:00', '2024-03-26 16:45:00', 20000, 1, 2),
  (3, 103, '2024-03-27 08:00:00', 290, 280, '2024-03-27 08:15:00', '2024-03-27 12:15:00', 45000, 2, 3),
  (4, 104, '2024-03-28 12:00:00', 360, 340, '2024-03-28 12:15:00', '2024-03-28 15:30:00', 50000, 3, 4),
  (5, 105, '2024-03-29 10:00:00', 180, 170, '2024-03-29 10:15:00', '2024-03-29 11:30:00', 25000, 1, 1),
  (6, 101, '2024-03-30 10:00:00', 140, 130, '2024-03-30 10:15:00', '2024-03-30 11:00:00', 20000, 1, 1),
  (6, 102, '2024-03-30 13:00:00', 120, 110, '2024-03-30 13:15:00', '2024-03-30 15:00:00', 18000, 2, 2);


INSERT INTO CURRENCIES (CURR_CODE, CURR_NAME)
VALUES
  ('USD', 'US Dollar'),
  ('EUR', 'Euro'),
  ('GBP', 'British Pound'),
  ('AUD', 'Australian Dollar'),
  ('JPY', 'Japanese Yen'),
  ('CNY', 'Chinese Yuan Renminbi'),
  ('CHF', 'Swiss Franc'),
  ('SGD', 'Singapore Dollar'),
  ('HKD', 'Hong Kong Dollar'),
  ('AED', 'United Arab Emirates Dirham'),
  ('QAR', 'Qatari Rial'),
  ('BRL', 'Brazilian Real'),
  ('CAD', 'Canadian Dollar'),
  ('MXN', 'Mexican Peso'),
  ('INR', 'Indian Rupee'); -- You can add more currencies as needed


INSERT INTO AIRPORTS (AIRPORT_CODE, CURRENCIES_CURR_CODE)
VALUES
  ('CDG', 'EUR'), -- Paris, France (using Euro)
  ('LHR', 'GBP'), -- London, United Kingdom (using British Pound)
  ('JFK', 'USD'), -- New York, United States (using US Dollar)
  ('LAX', 'USD'), -- Los Angeles, United States (using US Dollar)
  ('FRA', 'EUR'), -- Frankfurt, Germany (using Euro)
  ('SIN', 'SGD'), -- Singapore (using Singapore Dollar)
  ('DXB', 'AED'), -- Dubai, United Arab Emirates (assuming AED currency exists)
  ('HKG', 'HKD'), -- Hong Kong (assuming HKD currency exists)
  ('SYD', 'AUD'), -- Sydney, Australia (using Australian Dollar)
  ('PEK', 'CNY'), -- Beijing, China (assuming CNY currency exists)
  ('DOH', 'QAR'), -- Doha, Qatar (assuming QAR currency exists)
  ('GRU', 'BRL'); -- São Paulo, Brazil (assuming BRL currency exists)



INSERT INTO AIRLINKS (AIRLINK_CODE, AIRLINK_DISTANCE, AIRPORTS_AIRPORT_CODE_from, AIRPORTS_AIRPORT_CODE_to)
VALUES
  (1234, '1500', 'CDG', 'LHR'), -- Airlink 1234 from Paris (CDG) to London (LHR), 1500 km
  (2345, '2800', 'JFK', 'LAX'), -- Airlink 2345 from New York (JFK) to Los Angeles (LAX), 2800 km
  (3456, '4200', 'FRA', 'SIN'), -- Airlink 3456 from Frankfurt (FRA) to Singapore (SIN), 4200 km
  (4567, '3500', 'DXB', 'HKG'); -- Airlink 4567 from Dubai (DXB) to Hong Kong (HKG), 3500 km


INSERT INTO PLAN_FLIGHTS (FLIGHT_NBR, DEPARTURE, FREQUENCY, AIRLINKS_AIRLINK_CODE)
VALUES
  (101, '10:00:00', 7, 1234), -- Daily flight (7 times a week) with Airlink code 1234
  (102, '13:00:00', 5, 2345), -- Flight on weekdays (5 times a week) with Airlink code 2345
  (103, '09:00:00', 2, 3456), -- Flight twice a week (e.g., Tuesdays & Thursdays) with Airlink code 3456
  (104, '15:00:00', 3, 4567), -- Flight three times a week (specify weekdays if needed) with Airlink code 4567
  (105, '10:00:00', 7, 1234); -- Daily flight (7 times a week) with Airlink code 1234 (Assuming repeated schedule



INSERT INTO PLAN_DAYFLIGHTS (WEEKDAYS_DAY_NBR, PLAN_FLIGHTS_FLIGHT_NBR, PLAN_SEATS, PLAN_DURATION, PLAN_ARR_TIME, KoAIRCRAFT_IATA)
VALUES
  (1, 101, 180, '01:15:00', '11:45:00', 'A320'), -- Monday Flight 101
  (2, 102, 160, '01:35:00', '16:45:00', 'B737'), -- Tuesday Flight 102
  (3, 103, 290, '04:15:00', '12:15:00', 'A330'), -- Wednesday Flight 103
  (4, 104, 360, '03:30:00', '15:30:00', 'B777'), -- Thursday Flight 104
  (5, 105, 180, '01:15:00', '11:45:00', 'A320'), -- Friday Flight 105
  (6, 101, 140, '01:00:00', '11:00:00', 'A320'), -- Saturday Flight 101
  (6, 102, 120, '01:20:00', '15:00:00', 'B737'); -- Saturday Flight 102 

INSERT INTO WEEKDAYS (DAY_NBR)
VALUES (1), (2), (3), (4), (5), (6), (7);



SELECT KoAIRCRAFT.IATA, COUNT(*) AS nb_flights
FROM EFF_FLIGHTS
INNER JOIN AIRCRAFTS ON EFF_FLIGHTS.AIRCRAFTS_AIRCRAFT_NBR = AIRCRAFTS.AIRCRAFT_NBR
INNER JOIN KoAIRCRAFT ON AIRCRAFTS.KoAIRCRAFT_IATA = KoAIRCRAFT.IATA
GROUP BY KoAIRCRAFT.IATA
ORDER BY nb_flights DESC
LIMIT 5;


