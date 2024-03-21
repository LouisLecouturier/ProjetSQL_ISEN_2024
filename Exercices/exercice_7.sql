-- Exercice 7 --

INSERT INTO public.plan_flights (flight_nbr, departure, frequency, airlinks_airlink_code)
VALUES 
(1, '08:00:00', 7, 1),
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
VALUES 
(1),
(2),
(3),
(4),
(5),
(6),
(7);

INSERT INTO public.plan_dayflights (weekdays_day_nbr, plan_flights_flight_nbr, plan_seats, plan_duration, plan_arr_time, koaircraft_iata)
VALUES 
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 2, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '08:20:00', '10:20:00', 'B737'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 3, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '17:00:00', '19:00:00', 'A380'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 4, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '09:30:00', '11:30:00', 'B747'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 5, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '10:30:00', '12:30:00', 'A320'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 6, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '11:30:00', '13:30:00', 'B737'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 7, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '12:30:00', '14:30:00', 'A380'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 8, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '13:30:00', '15:30:00', 'B747'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 9, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '14:30:00', '16:30:00', 'A320'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 10, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '15:30:00', '17:30:00', 'B737'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '16:30:00', '18:30:00', 'A380'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 2, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '17:30:00', '19:30:00', 'B747'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 3, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '18:30:00', '20:30:00', 'A320'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 4, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '19:30:00', '21:30:00', 'B737'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '20:30:00', '22:30:00', 'A380'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 6, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '21:30:00', '23:30:00', 'B747'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 2, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '08:20:00', '10:20:00', 'B737'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 3, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '17:00:00', '19:00:00', 'A380'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 4, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '09:30:00', '11:30:00', 'B747'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 5, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '10:30:00', '12:30:00', 'A320'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 6, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '11:30:00', '13:30:00', 'B737'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 7, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '12:30:00', '14:30:00', 'A380'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 8, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '13:30:00', '15:30:00', 'B747'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 9, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '14:30:00', '16:30:00', 'A320'),
(FLOOR(RANDOM() * (7 - 1 + 1) + 1), 10, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '15:30:00', '17:30:00', 'B737');

INSERT INTO public.plan_dayflights (weekdays_day_nbr, plan_flights_flight_nbr, plan_seats, plan_duration, plan_arr_time, koaircraft_iata)
VALUES 
(5, 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
(3, 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
(6, 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
(1, 1, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '06:00:00', '08:00:00', 'A320'),
(2, 2, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '02:00:00', '00:00:00', 'B747'),
(6, 2, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '02:00:00', '00:00:00', 'B747'),
(7, 2, FLOOR(RANDOM() * (200 - 1 + 1) + 1), '02:00:00', '00:00:00', 'B747');

INSERT INTO public.plan_stopovers (weekdays_day_nbr, plan_flights_flight_nbr, stopover_nbr, stopover_duration, routes_route_code)
VALUES 
(7, 1, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '01:00:00', 1),
(5, 2, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '02:00:00', 2),
(1, 3, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '03:00:00', 3),
(4, 4, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '04:00:00', 4),
(4, 5, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '05:00:00', 1),
(7, 6, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '06:00:00', 2),
(4, 7, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '07:00:00', 3),
(3, 8, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '08:00:00', 4),
(7, 9, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '09:00:00', 1),
(4, 10, FLOOR(RANDOM() * (10 - 1 + 1) + 1), '10:00:00', 2);

SELECT pd.*
FROM public.plan_dayflights pd
LEFT JOIN public.plan_stopovers ps
ON pd.weekdays_day_nbr = ps.weekdays_day_nbr AND pd.plan_flights_flight_nbr = ps.plan_flights_flight_nbr
WHERE ps.plan_flights_flight_nbr IS NULL;




