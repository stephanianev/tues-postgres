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

-- Question 2b (bonus): when room 204 is FREE during the week.
-- Returns: every (weekday, period) slot with no lesson in room 204.
SELECT d.weekday, p.period
FROM generate_series(1, 5) AS d(weekday)
CROSS JOIN generate_series(1, 7) AS p(period)
WHERE NOT EXISTS (
    SELECT 1
    FROM lessons l
    JOIN rooms r ON r.id = l.room_id
    WHERE r.number = '204'
      AND l.weekday = d.weekday
      AND l.period  = p.period
)
ORDER BY d.weekday, p.period;