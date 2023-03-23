#1
SELECT first_name, last_name FROM student;

#2
SELECT instructor_id FROM instructor WHERE tenured = 1;

#3
SELECT s.first_name AS first_name, s.last_name AS last_name, a.first_name AS Advisor_first, a.last_name AS Advisor_last
FROM student AS s
INNER JOIN instructor AS a ON s.advisor_id = a.instructor_id;

#4
SELECT i.instructor_id AS instructor_id, i.first_name AS first_name, i.last_name AS last_name
FROM instructor AS i
LEFT JOIN student AS s ON s.advisor_id = i.instructor_id
WHERE s.advisor_id IS NULL;

#5
SELECT i.first_name as first_name, i.last_name AS last_name, SUM(c.num_credits) AS num_credits
FROM instructor AS i
INNER JOIN course AS c ON c.instructor_id = i.instructor_id
GROUP BY i.first_name;

#6
SELECT c.course_code AS course_code, c.course_name AS course_name
FROM course AS c
WHERE c.course_code LIKE '%3___%';

#7
SELECT s.student_id AS student_id, c.course_code AS course_code, c.num_credits AS num_credits, i.first_name AS first_name, i.last_name AS last_name
FROM student AS s
INNER JOIN student_schedule AS sc ON sc.student_id = s.student_id
INNER JOIN course AS c ON c.course_id = sc.course_id
INNER JOIN instructor AS i ON c.instructor_id = i.instructor_id
WHERE s.student_id = 1;