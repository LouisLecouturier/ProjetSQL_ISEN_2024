-- Exercice 10 --

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

INSERT INTO airlinks(AIRLINK_CODE, AIRLINK_DISTANCE, AIRPORTS_AIRPORT_CODE_from, AIRPORTS_AIRPORT_CODE_to)
VALUES (1, '5000', 'CDG', 'JFK'),
       (2, '7000', 'CDG', 'LAX'),
       (3, '15000', 'CDG', 'SYD'),
       (4, '8000', 'CDG', 'HND');

INSERT INTO plan_flights(flight_nbr, departure, frequency, airlinks_airlink_code)
VALUES (1, '08:00:00', 7, 1),
       (2, '10:00:00', 7, 2),
       (3, '12:00:00', 7, 3);


INSERT INTO weekdays (day_nbr)
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7);


INSERT INTO koaircraft(iata, autonomy, speed, seats, max_load, max_fuel)
VALUES ('A320', 3500, 840, 150, 15000, 24000),
       ('A330', 3500, 840, 150, 15000, 24000),
       ('A340', 3500, 840, 150, 15000, 24000);

INSERT INTO aircrafts(aircraft_nbr, last_servicing, totalflighthours, koaircraft_iata)
VALUES (1, '2022-01-01', 1000, 'A320'),
       (2, '2022-01-01', 1000, 'A330'),
       (3, '2022-01-01', 1000, 'A340');



INSERT INTO plan_dayflights(weekdays_day_nbr, plan_flights_flight_nbr, plan_seats, plan_duration, plan_arr_time,
                            koaircraft_iata)
VALUES (1, 1, 100, '02:00:00', '10:00:00', 'A320'),
       (2, 2, 200, '02:00:00', '12:00:00', 'A330'),
       (3, 3, 300, '02:00:00', '14:00:00', 'A340');


INSERT INTO crews(crew_code, crew_name)
VALUES (1, 'Crew 1'),
       (2, 'Crew 2'),
       (3, 'Crew 3');


INSERT INTO eff_flights(weekdays_day_nbr, plan_flights_flight_nbr, plan_dep_date, res_seats_qty, occ_seats_qty,
                        real_dep_time, real_arr_time, loaded_fuel, crews_crew_code, aircrafts_aircraft_nbr)
VALUES (1, 1, '08:00:00', 80, 70, '2022-01-01 08:00:00', '2022-01-01 10:00:00', 5000, 1, 1),
       (2, 2, '10:00:00', 210, 200, '2022-01-02 10:00:00', '2022-01-02 12:00:00', 6000, 2, 2),
       (3, 3, '12:00:00', 280, 250, '2022-01-03 12:00:00', '2022-01-03 14:00:00', 7000, 3, 3);



SELECT DISTINCT eff_flights.plan_flights_flight_nbr AS "Flight number",
                plan_dayflights.plan_seats          AS "Planned seats",
                eff_flights.occ_seats_qty           AS "Occupied seats"
FROM eff_flights
         INNER JOIN plan_flights ON plan_flights.flight_nbr = eff_flights.plan_flights_flight_nbr
         INNER JOIN plan_dayflights ON plan_flights.flight_nbr = eff_flights.plan_flights_flight_nbr AND
                                       plan_dayflights.weekdays_day_nbr = eff_flights.weekdays_day_nbr
WHERE plan_dayflights.plan_seats <> eff_flights.occ_seats_qty