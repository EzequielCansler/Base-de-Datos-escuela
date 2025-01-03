# 🎓 Base de Datos Escolar

Este repositorio contiene un script SQL para crear una base de datos escolar. El esquema incluye tablas para gestionar alumnos, profesores, cursos, materias, asistencias, notas y boletines.

## 📋 Tablas Principales

- **Usuario**: Información de alumnos y profesores.
- **Curso**: Datos de los cursos y su asignación de turnos.
- **Rol**: Roles de personas en cursos (Alumno, Profesor).
- **Materia**: Materias asociadas a los cursos.
- **Asistencia**: Registro de asistencias de los alumnos.
- **Nota**: Notas obtenidas por los alumnos.
- **Boletin**: Boletines con notas promedio y asistencias.

## 🗂️ Ejemplo de Tabla

```sql
CREATE TABLE Usuario (
    UsuarioID INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    DNI INT NOT NULL UNIQUE,
    Telefono VARCHAR(15),
    PasswordHash VARCHAR(255) NOT NULL
);
