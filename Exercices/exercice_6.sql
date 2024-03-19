SELECT staff.staff_code, staff.lname, staff.fname -- You can add other staff attributes here
FROM staff
LEFT JOIN ASSIGNMENTS ON staff.staff_code = ASSIGNMENTS.staff_staff_code
WHERE ASSIGNMENTS.starting IS NULL OR EXTRACT(YEAR FROM ASSIGNMENTS.starting) <> 2023;
