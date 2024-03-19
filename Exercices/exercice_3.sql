-- For each staff member give total flight hours per year
INSERT INTO public.in_flight (staff_staff_code, year_periods_year_period, month_periods_month_period, hours_nbr)
VALUES 
	(1, 2023, 01, 120),
    (3, 2023, 02, 110),
    (1, 2023, 03, 130),
    (5, 2023, 04, 140),
    (2, 2023, 05, 150),
    (1, 2023, 06, 160),
    (4, 2023, 07, 170),
    (2, 2023, 08, 180),
    (3, 2023, 09, 190),
    (2, 2023, 10, 200);
	(1, 2022, 01, 125),
	(11, 2022, 02, 115),
	(10, 2022, 03, 135),
	(14, 2022, 04, 145),
	(19, 2022, 05, 155),
	(4, 2022, 06, 165),
	(1, 2024, 01, 125),
	(11, 2024, 02, 115),
	(10, 2024, 01, 135),
	(14, 2024, 02, 145),
	(19, 2024, 03, 155),
	(4, 2024, 01, 165),
	(8, 2022, 07, 175);

SELECT
    STAFF_STAFF_CODE AS STAFF_CODE,
    YEAR_PERIODS_YEAR_PERIOD AS YEAR,
    SUM(HOURS_NBR) AS HOURS
FROM in_flight
GROUP BY
    STAFF_STAFF_CODE,
    YEAR_PERIODS_YEAR_PERIOD
ORDER BY
    STAFF_STAFF_CODE;
