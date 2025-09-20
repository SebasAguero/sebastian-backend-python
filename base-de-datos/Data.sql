-- DDL
CREATE DATABASE practicas;

\c practicas

CREATE TABLE students (
  student_id    SERIAL PRIMARY KEY,
  nombre        VARCHAR(80) NOT NULL,
  email         VARCHAR(120) NOT NULL UNIQUE,
  ciudad        VARCHAR(60) NOT NULL,
  fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE courses (
  course_id  SERIAL PRIMARY KEY,
  nombre     VARCHAR(100) NOT NULL,
  categoria  VARCHAR(50)  NOT NULL,
  creditos   INT NOT NULL CHECK (creditos > 0)
);

-- estado: 'activa' | 'retirada' | 'aprobada'
CREATE TABLE enrollments (
  enrollment_id  SERIAL PRIMARY KEY,
  student_id     INT NOT NULL REFERENCES students(student_id),
  course_id      INT NOT NULL REFERENCES courses(course_id),
  fecha_matricula DATE NOT NULL DEFAULT CURRENT_DATE,
  estado         VARCHAR(10) NOT NULL CHECK (estado IN ('activa','retirada','aprobada')),
  CONSTRAINT uq_enrollment UNIQUE (student_id, course_id) -- un estudiante no se matricula dos veces al mismo curso
);

CREATE TABLE payments (
  payment_id     SERIAL PRIMARY KEY,
  enrollment_id  INT NOT NULL REFERENCES enrollments(enrollment_id),
  monto          NUMERIC(10,2) NOT NULL CHECK (monto > 0),
  fecha_pago     DATE NOT NULL DEFAULT CURRENT_DATE,
  medio_pago     VARCHAR(20) NOT NULL CHECK (medio_pago IN ('efectivo','tarjeta','transferencia'))
);


-- DATA

-- Students (10)
INSERT INTO students (nombre, email, ciudad, fecha_registro) VALUES
('Ana Torres','ana.torres@example.com','Lima','2025-08-20'),
('Bruno Díaz','bruno.diaz@example.com','Arequipa','2025-08-21'),
('Carla Ramos','carla.ramos@example.com','Cusco','2025-08-22'),
('Diego Paredes','diego.paredes@example.com','Lima','2025-08-25'),
('Elena Silva','elena.silva@example.com','Arequipa','2025-08-26'),
('Fabio Núñez','fabio.nunez@example.com','Trujillo','2025-08-27'),
('Gabriela Mita','gabriela.mita@example.com','Lima','2025-08-28'),
('Hugo Quispe','hugo.quispe@example.com','Chiclayo','2025-08-28'),
('Inés Valdez','ines.valdez@example.com','Cusco','2025-08-29'),
('Jorge León','jorge.leon@example.com','Lima','2025-08-30');

-- Courses (6)
INSERT INTO courses (nombre, categoria, creditos) VALUES
('SQL desde Cero','Data',3),
('Python Básico','Programación',4),
('Modelado de Datos','Data',3),
('Excel para Análisis','Ofimática',2),
('Estadística Intro','Data',3),
('Git y GitHub','DevOps',2);

-- Enrollments (15)
-- estados variados: activa/retirada/aprobada
INSERT INTO enrollments (student_id, course_id, fecha_matricula, estado) VALUES
(1,1,'2025-09-01','activa'),
(1,2,'2025-09-01','aprobada'),
(2,1,'2025-09-02','activa'),
(2,3,'2025-09-02','retirada'),
(3,1,'2025-09-02','aprobada'),
(3,5,'2025-09-03','activa'),
(4,2,'2025-09-03','activa'),
(4,3,'2025-09-03','aprobada'),
(5,1,'2025-09-03','retirada'),
(5,4,'2025-09-03','activa'),
(6,6,'2025-09-04','aprobada'),
(7,2,'2025-09-04','activa'),
(8,3,'2025-09-04','activa'),
(9,5,'2025-09-04','retirada'),
(10,1,'2025-09-05','activa');

-- Payments (algunas matrículas tienen más de un pago; otras ninguna)
-- Busca que sumas sean variadas para validaciones
INSERT INTO payments (enrollment_id, monto, fecha_pago, medio_pago) VALUES
(1, 120.00, '2025-09-05', 'tarjeta'),
(1, 60.00 , '2025-09-10', 'tarjeta'),
(2, 150.00, '2025-09-06', 'efectivo'),
(3, 90.00 , '2025-09-07', 'transferencia'),
(5, 200.00, '2025-09-08', 'tarjeta'),
(6, 80.00 , '2025-09-09', 'efectivo'),
(8, 160.00, '2025-09-09', 'tarjeta'),
(10,70.00 , '2025-09-10', 'transferencia'),
(11,100.00, '2025-09-10', 'efectivo'),
(12,140.00, '2025-09-11', 'tarjeta'),
(14,50.00 , '2025-09-11', 'efectivo'),
(15,60.00 , '2025-09-12', 'transferencia');
