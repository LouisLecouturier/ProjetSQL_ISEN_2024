INSERT INTO CURRENCIES(CURR_CODE, CURR_NAME)
VALUES ('EUR', 'Euro'),
       ('USD', 'US Dollar'),
       ('AUD', 'Australian Dollar'),
       ('JPY', 'Japanese Yen');

INSERT INTO AIRPORTS(AIRPORT_CODE, CURRENCIES_CURR_CODE)
VALUES ('CDG', 'EUR'),
       ('JFK', 'USD'),
       ('LAX', 'USD'),
       ('SYD', 'AUD'),
       ('HND', 'JPY');


-- Insertion dans la table `weekdays`
INSERT INTO weekdays (day_nbr)
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7);

ALTER TABLE AIRLINKS
    ALTER COLUMN airlink_distance TYPE INT USING airlink_distance::INT;

INSERT INTO AIRLINKS(AIRLINK_CODE, AIRLINK_DISTANCE, AIRPORTS_AIRPORT_CODE_from, AIRPORTS_AIRPORT_CODE_to)
VALUES (1, 5000, 'CDG', 'JFK'),
       (2, 7000, 'CDG', 'LAX'),
       (3, 15000, 'CDG', 'SYD'),
       (4, 8000, 'CDG', 'HND');

INSERT INTO KoAIRCRAFT(IATA, AUTONOMY, SPEED, SEATS, MAX_LOAD, MAX_FUEL)
VALUES ('A320', 6000, 840, 180, 78000, 24210),
       ('B737', 5600, 853, 178, 70533, 20820),
       ('A380', 15200, 1020, 853, 577000, 323546),
       ('B747', 14815, 988, 660, 442000, 216840);



-- Insertion dans la table `classes`
INSERT INTO classes (class_code, class_name)
VALUES (1, 'Economy'),
       (2, 'Business'),
       (3, 'First');


ALTER TABLE passengers
    ALTER COLUMN lname TYPE varchar USING lname::varchar;

-- Insertion dans la table `passengers`
INSERT INTO passengers (psgr_code, fname, lname)
VALUES (1, 'John', 'Doe'),
       (2, 'Jane', 'Doe'),
       (3, 'Louis', 'Lecout'),
       (4, 'Guy', 'Liguili');

-- Insertion dans la table `plan_flights`
INSERT INTO plan_flights (flight_nbr, departure, frequency, airlinks_airlink_code)
VALUES (1, '06:00:00', 7, 1),
       (2, '06:00:00', 7, 1);


-- Insertion dans la table `plan_dayflights`
INSERT INTO plan_dayflights (weekdays_day_nbr, plan_flights_flight_nbr, plan_seats, plan_duration, plan_arr_time,
                             koaircraft_iata)
VALUES (1, 1, 100, '02:00:00', '08:00:00', 'A320'),
       (1, 2, 100, '02:00:00', '08:00:00', 'A320'),
       (2, 2, 100, '02:00:00', '08:00:00', 'A320');


-- Insertion into the `crews` table
INSERT INTO crews (crew_code, crew_name)
VALUES (1, 'Crew 1');

-- Insertion into the `aircrafts` table
INSERT INTO aircrafts (aircraft_nbr, last_servicing, totalflighthours, koaircraft_iata)
VALUES (1, '2023-01-01', 1000, 'A320');

-- Insertion into the `eff_flights` table
INSERT INTO eff_flights (weekdays_day_nbr, plan_flights_flight_nbr, plan_dep_date, res_seats_qty, occ_seats_qty,
                         real_dep_time, real_arr_time, loaded_fuel, crews_crew_code, aircrafts_aircraft_nbr)
VALUES (1, 1, '2023-03-01 06:00:00', 100, 100, '2023-03-01 06:00:00', '2023-03-01 08:00:00', 10000, 1, 1),
        (1, 2, '2023-03-01 06:00:00', 100, 100, '2023-03-01 06:00:00', '2023-03-01 08:00:00', 10000, 1, 1);

-- Now you can insert into the `tickets` table
INSERT INTO tickets (weekdays_day_nbr, plan_flights_flight_nbr, eff_flights_plan_dep_date, seat, price,
                     passengers_psgr_code, currencies_curr_code, classes_class_code)
VALUES (1, 1, '2023-03-01 06:00:00', 'A1', 100.00, 1, 'USD', 1),
       (1, 1, '2023-03-01 06:00:00', 'A2', 200.00, 2, 'USD', 2),
       (1, 2, '2023-03-01 06:00:00', 'A1', 200.00, 3, 'USD', 1),
       (1, 2, '2023-03-01 06:00:00', 'A2', 200.00, 2, 'USD', 1),
       (1, 1, '2023-03-01 06:00:00', 'A3', 400.00, 3, 'USD', 3);


-- Insertion dans la table `estimate_price`
INSERT INTO estimate_price (weekdays_day_nbr, plan_flights_flight_nbr, classes_class_code, estimated_price, currencies_curr_code)
VALUES (1, 1, 1, 100.00, 'USD'),
       (2, 2, 2, 150.00, 'USD');

-- Planned revenue per flight
-- Planned revenue per flight for all classes
SELECT
    plan_dayflights.plan_flights_flight_nbr AS "Flight Number",
    SUM(plan_dayflights.plan_seats * estimate_price.estimated_price) AS "Estimated Total Revenue"
FROM
    plan_dayflights
JOIN
    estimate_price ON plan_dayflights.weekdays_day_nbr = estimate_price.weekdays_day_nbr
                    AND plan_dayflights.plan_flights_flight_nbr = estimate_price.plan_flights_flight_nbr
GROUP BY
    plan_dayflights.plan_flights_flight_nbr
ORDER BY
    "Flight Number";

-- Actual revenue per flight
SELECT tickets.plan_flights_flight_nbr, SUM(tickets.price)
FROM tickets
GROUP BY tickets.plan_flights_flight_nbr;

-- Final Request --

SELECT
    estimated_revenue."Flight Number",
    estimated_revenue."Estimated Total Revenue",
    actual_revenue."Actual Total Revenue"
FROM
    (
        SELECT
            plan_dayflights.plan_flights_flight_nbr AS "Flight Number",
            SUM(plan_dayflights.plan_seats * estimate_price.estimated_price) AS "Estimated Total Revenue"
        FROM
            plan_dayflights
        JOIN
            estimate_price ON plan_dayflights.weekdays_day_nbr = estimate_price.weekdays_day_nbr
                            AND plan_dayflights.plan_flights_flight_nbr = estimate_price.plan_flights_flight_nbr
        GROUP BY
            plan_dayflights.plan_flights_flight_nbr
    ) AS estimated_revenue
LEFT JOIN
    (
        SELECT tickets.plan_flights_flight_nbr, SUM(tickets.price) AS "Actual Total Revenue"
        FROM tickets
        GROUP BY tickets.plan_flights_flight_nbr
    ) AS actual_revenue ON estimated_revenue."Flight Number" = actual_revenue.plan_flights_flight_nbr
ORDER BY
    estimated_revenue."Flight Number";