-- Exercice 7 --

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

INSERT INTO KoAIRCRAFT(IATA, AUTONOMY, SPEED, SEATS, MAX_LOAD, MAX_FUEL)
VALUES ('A320', 6000, 840, 180, 78000, 24210),
       ('B737', 5600, 853, 178, 70533, 20820),
       ('A380', 15200, 1020, 853, 577000, 323546),
       ('B747', 14815, 988, 660, 442000, 216840);

INSERT INTO AIRLINKS(AIRLINK_CODE, AIRLINK_DISTANCE, AIRPORTS_AIRPORT_CODE_from, AIRPORTS_AIRPORT_CODE_to)
VALUES (1, '5000', 'CDG', 'JFK'),
       (2, '7000', 'CDG', 'LAX'),
       (3, '15000', 'CDG', 'SYD'),
       (4, '8000', 'CDG', 'HND');

INSERT INTO ROUTES(ROUTE_CODE, ROUTE_DURATION, KoAIRCRAFT_IATA, AIRLINKS_AIRLINK_CODE)
VALUES (1, '06:00:00', 'A320', 1),
       (2, '08:20:00', 'B737', 2),
       (3, '17:00:00', 'A380', 3),
       (4, '09:30:00', 'B747', 4);

INSERT INTO public.plan_flights (flight_nbr, departure, frequency, airlinks_airlink_code)
VALUES (1, '08:00:00', 7, 1),
       (2, '12:00:00', 5, 2),
       (3, '16:00:00', 3, 3),
       (4, '20:00:00', 4, 4),
       (5, '10:00:00', 6, 1),
       (6, '14:00:00', 7, 2),
       (7, '18:00:00', 5, 3),
       (8, '22:00:00', 3, 4),
       (9, '09:00:00', 4, 1),
       (10, '13:00:00', 7, 2);

INSERT INTO public.weekdays (day_nbr)
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7);



INSERT INTO public.plan_dayflights (weekdays_day_nbr, plan_flights_flight_nbr, plan_seats, plan_duration, plan_arr_time,
                                    koaircraft_iata)
VALUES (7, 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
       (5, 2, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
       (1, 3, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
       (4, 4, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
       (5, 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
       (3, 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
       (6, 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
       (1, 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
       (2, 2, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '02:00:00', '00:00:00', 'B747'),
       (6, 2, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '02:00:00', '00:00:00', 'B747'),
       (7, 2, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '02:00:00', '00:00:00', 'B747'),
       (4, 3, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '04:00:00', '06:00:00', 'A380'),
       (5, 3, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '05:00:00', '07:00:00', 'B737'),
       (6, 4, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320');



INSERT INTO public.plan_stopovers (weekdays_day_nbr, plan_flights_flight_nbr, stopover_nbr, stopover_duration,
                                   routes_route_code)
VALUES (7, 1, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '01:00:00', 1),
       (5, 2, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '02:00:00', 2),
       (1, 3, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '03:00:00', 3),
       (4, 4, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '04:00:00', 4);


SELECT pd.*
FROM public.plan_dayflights pd
         LEFT JOIN public.plan_stopovers ps
                   ON pd.weekdays_day_nbr = ps.weekdays_day_nbr AND
                      pd.plan_flights_flight_nbr = ps.plan_flights_flight_nbr
WHERE ps.plan_flights_flight_nbr IS NULL;




