-- Ejercicio C1
SELECT 
    s.student_id,
    s.nombre,
    c.nombre AS curso,
    e.estado
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.ciudad = 'Arequipa'
  AND e.estado = 'activa'
ORDER BY s.student_id;

-- Ejercicio C2
SELECT 
    s.student_id,
    s.nombre,
    COALESCE(SUM(p.monto), 0) AS total_pagado
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN payments p ON e.enrollment_id = p.enrollment_id
GROUP BY s.student_id, s.nombre
ORDER BY total_pagado DESC, s.student_id ASC
LIMIT 3;