INSERT INTO CURRENCIES(CURR_CODE, CURR_NAME) VALUES
('EUR', 'Euro'),
('USD', 'US Dollar'),
('AUD', 'Australian Dollar'),
('JPY', 'Japanese Yen');

INSERT INTO AIRPORTS(AIRPORT_CODE, CURRENCIES_CURR_CODE) VALUES
('CDG', 'EUR'),
('JFK', 'USD'),
('LAX', 'USD'),
('SYD', 'AUD'),
('HND', 'JPY');


INSERT INTO KoAIRCRAFT(IATA, AUTONOMY, SPEED, SEATS, MAX_LOAD, MAX_FUEL) VALUES
('A320', 6000, 840, 180, 78000, 24210),
('B737', 5600, 853, 178, 70533, 20820),
('A380', 15200, 1020, 853, 577000, 323546),
('B747', 14815, 988, 660, 442000, 216840);


ALTER TABLE AIRLINKS
ALTER COLUMN airlink_distance TYPE INT USING airlink_distance::INT;

INSERT INTO AIRLINKS(AIRLINK_CODE, AIRLINK_DISTANCE, AIRPORTS_AIRPORT_CODE_from, AIRPORTS_AIRPORT_CODE_to) VALUES
(1, 5000, 'CDG', 'JFK'),
(2, 7000, 'CDG', 'LAX'),
(3, 15000, 'CDG', 'SYD'),
(4, 8000, 'CDG', 'HND');

INSERT INTO ROUTES(ROUTE_CODE, ROUTE_DURATION, KoAIRCRAFT_IATA, AIRLINKS_AIRLINK_CODE) VALUES
(1, '06:00:00', 'A320', 1),
(2, '08:20:00', 'B737', 2),
(3, '17:00:00', 'A380', 3),
(4, '09:30:00', 'B747', 4);


SELECT koaircraft.iata AS "Aircraft", koaircraft.autonomy AS "Autonomy", MAX(airlinks.airlink_distance) AS "Max air connection distance"
FROM koaircraft, airlinks
WHERE koaircraft.autonomy < airlinks.airlink_distance
GROUP BY koaircraft.iata, koaircraft.autonomy