-- Ejercicio B1
SELECT 
    c.course_id,
    c.nombre AS nombre_curso,
    COUNT(e.enrollment_id) AS total_matriculas
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.nombre
ORDER BY c.course_id;

-- Ejercicio B2
SELECT 
    s.student_id,
    s.nombre,
    COALESCE(SUM(p.monto), 0) AS total_pagado
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN payments p ON e.enrollment_id = p.enrollment_id
GROUP BY s.student_id, s.nombre
ORDER BY s.student_id;

-- Ejercicio B3
SELECT 
    p.medio_pago,
    AVG(p.monto) AS promedio_monto
FROM payments p
GROUP BY p.medio_pago
HAVING AVG(p.monto) >= 100
ORDER BY promedio_monto DESC;

-- Ejercicio B4
SELECT 
    c.course_id,
    c.nombre,
    COALESCE(COUNT(e.enrollment_id), 0) AS aprobadas
FROM courses c
LEFT JOIN enrollments e 
    ON c.course_id = e.course_id 
    AND e.estado = 'aprobada'
GROUP BY c.course_id, c.nombre
ORDER BY c.course_id;