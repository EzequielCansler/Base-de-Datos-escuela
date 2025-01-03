

CREATE TABLE Turno (
  turno_id INT PRIMARY KEY IDENTITY(1,1),
  nombre VARCHAR(50) NOT NULL
);


CREATE TABLE Curso (
  curso_id INT PRIMARY KEY IDENTITY(1,1),
  nombre VARCHAR(100) NOT NULL,
  tipo_cursada VARCHAR(50),
  anio INT NOT NULL,
  encargado VARCHAR(100),
  turno_id INT NOT NULL,
  FOREIGN KEY (turno_id) REFERENCES Turno(turno_id)
);


CREATE TABLE Persona (
  persona_id INT PRIMARY KEY IDENTITY(1,1),
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  dni INT NOT NULL UNIQUE,
  telefono VARCHAR(15),
  password_hash VARCHAR(255) NOT NULL
);


CREATE TABLE Rol (
  rol_id INT PRIMARY KEY IDENTITY(1,1),
  persona_id INT NOT NULL,
  tipo VARCHAR(10) CHECK(tipo IN ('Alumno', 'Profesor')) NOT NULL,
  curso_id INT, 
  FOREIGN KEY (persona_id) REFERENCES Persona(persona_id),
  FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)  
);


CREATE TABLE Materia (
  materia_id INT PRIMARY KEY IDENTITY(1,1),
  nombre VARCHAR(100) NOT NULL,
  curso_id INT NOT NULL,
  FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)
);


CREATE TABLE ProfesorMateria (
  profesor_materia_id INT PRIMARY KEY IDENTITY(1,1),
  profesor_id INT NOT NULL,
  materia_id INT NOT NULL,
  FOREIGN KEY (profesor_id) REFERENCES Persona(persona_id),
  FOREIGN KEY (materia_id) REFERENCES Materia(materia_id)
);


CREATE TABLE Asistencia (
  asistencia_id INT PRIMARY KEY IDENTITY(1,1),
  tipo VARCHAR(20) CHECK(tipo IN ('Presente', 'Ausente', 'Justificado')) NOT NULL,
  fecha DATE NOT NULL,
  materia_id INT NOT NULL,
  alumno_id INT NOT NULL,
  FOREIGN KEY (materia_id) REFERENCES Materia(materia_id),
  FOREIGN KEY (alumno_id) REFERENCES Persona(persona_id)
);


CREATE TABLE Nota (
  nota_id INT PRIMARY KEY IDENTITY(1,1),
  nota_num FLOAT NOT NULL,
  motivo VARCHAR(100),
  fecha DATE NOT NULL,
  materia_id INT NOT NULL,
  alumno_id INT NOT NULL,
  FOREIGN KEY (materia_id) REFERENCES Materia(materia_id),
  FOREIGN KEY (alumno_id) REFERENCES Persona(persona_id)
);


CREATE TABLE Boletin (
  boletin_id INT PRIMARY KEY IDENTITY(1,1),
  alumno_id INT NOT NULL,
  nombre_materia VARCHAR(100),
  nota_prom_TEA VARCHAR(50),
  nota_prom_num FLOAT,
  asistencia FLOAT,
  FOREIGN KEY (alumno_id) REFERENCES Persona(persona_id)
);
