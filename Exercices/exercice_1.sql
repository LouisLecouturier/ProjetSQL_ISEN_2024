INSERT INTO status (status_code, status_name, status_dscr)
VALUES (0, 'Hiring', 'In hiring status'),
       (1, 'Available', 'Available status'),
       (2, 'Not Available', 'Not Available status'),
       (3, 'Sick', 'Sick status'),
       (4, 'On boarding', 'On boarding status'),
       (5, 'On leave', 'On leave status'),
       (6, 'Retired', 'Retired status'),
       (7, 'Resigned', 'Resigned status');

INSERT INTO staff (staff_code, lname, fname, birth, member_position, flying, tfh, status_status_code)
VALUES
    (0, 'Michael', 'Brown', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'CEO', false, 0, 1),
    (1, 'Emily', 'Clark', TO_DATE('1991-02-02', 'YYYY-MM-DD'), 'CFO', false, 0, 1),
    (2, 'David', 'Moore', TO_DATE('1992-03-03', 'YYYY-MM-DD'), 'CIO', false, 0, 1),
    (3, 'Olivia', 'Davis', TO_DATE('1993-04-04', 'YYYY-MM-DD'), 'COO', false, 0, 1),
    (4, 'William', 'Wilson', TO_DATE('1993-05-04', 'YYYY-MM-DD'), 'emp', false, 0, 1),
    (5, 'Sophia', 'Taylor', TO_DATE('1993-06-04', 'YYYY-MM-DD'), 'emp', false, 0, 1),
    (6, 'James', 'Anderson', TO_DATE('1993-07-04', 'YYYY-MM-DD'), 'emp', false, 0, 1),
    (7, 'Isabella', 'Martinez', TO_DATE('1999-08-04', 'YYYY-MM-DD'), 'emp', false, 0, 2),
    (8, 'Benjamin', 'Hernandez', TO_DATE('1998-09-04', 'YYYY-MM-DD'), 'emp', false, 0, 2),
    (9, 'Emma', 'Gonzalez', TO_DATE('1993-10-04', 'YYYY-MM-DD'), 'emp', false, 0, 2),
    (10, 'Alexander', 'Lopez', TO_DATE('1993-11-04', 'YYYY-MM-DD'), 'emp', true, 0, 2),
    (11, 'Mia', 'Perez', TO_DATE('1993-12-04', 'YYYY-MM-DD'), 'emp', true, 0, 2),
    (12, 'Daniel', 'Torres', TO_DATE('1994-01-04', 'YYYY-MM-DD'), 'emp', true, 0, 2),
    (13, 'Charlotte', 'Ramirez', TO_DATE('1993-02-04', 'YYYY-MM-DD'), 'emp', true, 0, 2),
    (14, 'Henry', 'Flores', TO_DATE('1995-03-04', 'YYYY-MM-DD'), 'emp', true, 0, 1),
    (15, 'Ava', 'Rivera', TO_DATE('1993-04-04', 'YYYY-MM-DD'), 'emp', true, 0, 1),
    (16, 'Matthew', 'Gomez', TO_DATE('1996-05-04', 'YYYY-MM-DD'), 'emp', true, 0, 6),
    (17, 'Ella', 'Sanchez', TO_DATE('1997-06-04', 'YYYY-MM-DD'), 'emp', true, 0, 1),
    (18, 'Luke', 'Mitchell', TO_DATE('1993-07-04', 'YYYY-MM-DD'), 'emp', true, 0, 1),
    (19, 'Lily', 'King', TO_DATE('1993-08-04', 'YYYY-MM-DD'), 'emp', true, 0, 1);



SELECT * FROM staff ORDER BY staff.member_position DESC, staff.lname;