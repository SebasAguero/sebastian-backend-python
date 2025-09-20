-- Ejercicio D1 - Actualizar matrículas a aprobadas
UPDATE enrollments e
SET estado = 'aprobada'
WHERE e.estado = 'activa'
  AND (
      SELECT COALESCE(SUM(p.monto), 0)
      FROM payments p
      WHERE p.enrollment_id = e.enrollment_id
  ) >= 150;
-- Mostrar matrículas modificadas
SELECT 
    e.enrollment_id,
    e.estado,
    COALESCE(SUM(p.monto), 0) AS total_pagado
FROM enrollments e
LEFT JOIN payments p ON e.enrollment_id = p.enrollment_id
WHERE e.estado = 'aprobada'
GROUP BY e.enrollment_id, e.estado
ORDER BY e.enrollment_id;
-- Ejercicio D2 - Eliminar retiradas sin pagos
DELETE FROM enrollments e
WHERE e.estado = 'retirada'
  AND NOT EXISTS (
      SELECT 1 
      FROM payments p 
      WHERE p.enrollment_id = e.enrollment_id
  );