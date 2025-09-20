-- Ejercicio A1
SELECT 
    s.student_id,
    s.nombre AS estudiante,
    s.ciudad,
    c.course_id,
    c.nombre AS curso,
    e.estado
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
ORDER BY s.student_id, c.course_id;

-- Ejercicio A2
SELECT 
    c.course_id,
    c.nombre
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;