-- Question 1: timetable of class 10a on Monday, period by period.
-- Returns: period, subject, teacher, room (3 rows).
SELECT l.period, s.name AS subject, t.full_name AS teacher, r.number AS room
FROM lessons l
JOIN classes  c ON c.id = l.class_id
JOIN subjects s ON s.id = l.subject_id
JOIN teachers t ON t.id = l.teacher_id
JOIN rooms    r ON r.id = l.room_id
WHERE c.name = '10a' AND l.weekday = 1
ORDER BY l.period;

-- Question 2a: when room 204 is taken during the week.
-- Returns: weekday (1=Mon), period, class (6 rows).
SELECT l.weekday, l.period, c.name AS class
FROM lessons l
JOIN rooms   r ON r.id = l.room_id
JOIN classes c ON c.id = l.class_id
WHERE r.number = '204'
ORDER BY l.weekday, l.period;