-- Exercice 9 - List of all staff members who worked during a weekend (Saturday or Sunday)

INSERT INTO public.languages(lng_code)
VALUES 
    ('es'), -- Espagnol
    ('de'), -- Allemand
    ('fr'), -- Français
    ('it'), -- Italien
    ('ru'), -- Russe
    ('zh'), -- Chinois
    ('ja'), -- Japonais
    ('ar'); -- Arabe
    ('en'); -- Englais


ALTER TABLE public.languages RENAME COLUMN lng_code TO lng_code_in;

INSERT INTO public.name_weekday(languages_lng_code_in, weekdays_day_nbr, dayname)
VALUES 
    ('en', 1, 'Monday'), ('fr', 1, 'Lundi'), ('es', 1, 'Lunes'), ('de', 1, 'Montag'),
    ('en', 2, 'Tuesday'), ('fr', 2, 'Mardi'), ('es', 2, 'Martes'), ('de', 2, 'Dienstag'),
    ('en', 3, 'Wednesday'), ('fr', 3, 'Mercredi'), ('es', 3, 'Miércoles'), ('de', 3, 'Mittwoch'),
    ('en', 4, 'Thursday'), ('fr', 4, 'Jeudi'), ('es', 4, 'Jueves'), ('de', 4, 'Donnerstag'),
    ('en', 5, 'Friday'), ('fr', 5, 'Vendredi'), ('es', 5, 'Viernes'), ('de', 5, 'Freitag'),
    ('en', 6, 'Saturday'), ('fr', 6, 'Samedi'), ('es', 6, 'Sábado'), ('de', 6, 'Samstag'),
    ('en', 7, 'Sunday'), ('fr', 7, 'Dimanche'), ('es', 7, 'Domingo'), ('de', 7, 'Sonntag');


INSERT INTO ASSIGNMENTS (staff_staff_code, crews_crew_code, starting, ending, roles_role_code, assignt_nbr)
VALUES  
(0, 3, '01/02/2024', '01/02/2024', 1, 7),
(3, 2, '01/03/2024', '01/03/2024', 2, 8),
(7, 3, '01/04/2024', '01/04/2024', 3, 9),
(8, 1, '01/05/2024', '01/05/2024', 2, 10),
(12, 3, '01/06/2023', '01/06/2023', 3, 11),
(13, 2, '01/07/2023', '01/07/2023', 2, 12),
(14, 2, '01/08/2022', '01/08/2022', 3, 13),
(15, 1, '01/09/2022', '01/09/2022', 3, 14),
(16, 3, '01/10/2022', '01/10/2022', 3, 15),
(17, 2, '01/11/2022', '01/11/2022', 2, 16);

SELECT s.lname, s.fname
FROM staff s
JOIN assignments a ON s.staff_code = a.staff_staff_code
WHERE (EXTRACT(DOW FROM a.starting) IN (6, 0) OR EXTRACT(DOW FROM a.ending) IN (6, 0));



