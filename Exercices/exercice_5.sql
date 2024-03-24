INSERT INTO QUALIFICATIONS (qualif_code, qualif_name, qualif_dscr)
VALUES ('1', 'Pilot', 'Pilote'),
       ('2', 'Flight Attendant', 'Hotesse de lair'),
       ('3', 'Mechanic', 'mecano');

INSERT INTO have_qualif (staff_staff_code, qualifications_qualif_code)
VALUES ('0', '1'),  -- pilote
       ('1', '1'),
       ('2', '1'),
       ('3', '1'),
       ('4', '1'),
       ('5', '2'), -- hotesse de l'air
       ('6', '2'),
       ('7', '2'),
       ('8', '2'),
       ('9', '2'),
       ('10', '3'), -- mecano
       ('11', '3'),
       ('12', '3'),
       ('13', '3'),
       ('14', '3'),
       ('15', '3'),
       ('16', '3'),
       ('17', '3'),
       ('18', '3'),
       ('19', '3');

INSERT INTO KoCREW (kocrew_code, kocrew_name)
VALUES ('1', 'Pilot Crew'),
       ('2', 'Cabin Crew'),
       ('3', 'Maintenance Crew');


INSERT INTO roles (role_code)
VALUES ('1'),('2'),('3');

INSERT INTO CREWS (CREW_CODE, CREW_NAME)
VALUES
    ('1', 'Alpha'),
    ('2', 'Bravo'),
    ('3', 'Charlie');

INSERT INTO ASSIGNMENTS (staff_staff_code, crews_crew_code, starting, roles_role_code, assignt_nbr)
VALUES  ('1', '1', '2023-01-01', '1', 1),
        ('2', '2', '2022-07-15', '1', 2),
        ('5', '1', '2023-01-01', '2', 3),
        ('6', '2', '2022-07-15', '2', 4),
        ('10', '1', '2023-01-01', '3', 5),
        ('11', '2', '2022-07-15', '3', 6);

truncate table assignments cascade;

SELECT staff.fname, staff.lname
FROM staff
INNER JOIN have_qualif ON staff.staff_code = have_qualif.staff_staff_code
INNER JOIN qualifications ON have_qualif.qualifications_qualif_code = qualifications.qualif_code
INNER JOIN ASSIGNMENTS ON staff.staff_code = ASSIGNMENTS.staff_staff_code
WHERE qualifications.qualif_name = 'Pilot'
  AND EXTRACT(YEAR FROM ASSIGNMENTS.starting) = 2023;


