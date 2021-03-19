/*

    Simulación de la base de datos del registro nacional de las personas en Honduras.
    NO REPRESENTA NINGÚN DATO REAL.

*/
DROP DATABASE IF EXISTS RNP;
CREATE DATABASE RNP CHARACTER SET utf8;
USE RNP;

CREATE TABLE PersonaCedula
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tex_cedula VARCHAR(15) NOT NULL COMMENT "Cedula de la persona donde, se debe incluir los guiones entre cada cuatro números E.g.: '0801-1999-0000'"

) COMMENT "Corresponde a la cedula de la persona" ;

CREATE TABLE PersonaResidencia
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tex_residencia VARCHAR(100) NOT NULL COMMENT "Nombre de residencia/colonia de la persona"

) COMMENT "Corresponde a la residencia/colonia de la persona";

CREATE TABLE PersonaCiudad
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tex_ciudad VARCHAR(100) NOT NULL COMMENT "Nombre del municipio de la persona"
    
) COMMENT "Corresponde al municipio de la persona";


CREATE TABLE PersonaDepartamento
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_residencia INT NOT NULL,
    id_ciudad INT NOT NULL,
    tex_departamento VARCHAR(100) NOT NULL COMMENT "Nombre del departamento en donde se encuentra la persona",
    FOREIGN KEY (id_residencia) REFERENCES PersonaResidencia(id),
    FOREIGN KEY (id_ciudad) REFERENCES PersonaCiudad(id)

) COMMENT "Corresponde al departamento de la persona";


CREATE TABLE PersonaNacionalidad
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cedula INT NOT NULL,
    id_departamento INT NOT NULL,
    bit_nacionalidad BIT NOT NULL DEFAULT 0 COMMENT "Nacionalidad de la persona donde, 0: Hondureño, 1: Extranjero",
    FOREIGN KEY (id_cedula) REFERENCES PersonaCedula(id),
    FOREIGN KEY (id_departamento) REFERENCES PersonaDepartamento(id)

) COMMENT "Corresponde a la nacionalidad de la Persona";

CREATE TABLE PersonaEstadoCivil
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    bit_estado BIT NOT NULL COMMENT "Estado de la persona donde, 0: Soltero, 1: Casado"

) COMMENT "Corresponde al estado de la persona";

CREATE TABLE PersonaInfo
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_estadoCivil INT NOT NULL,
    id_nacionalidad INT NOT NULL,
    num_edad TINYINT UNSIGNED NOT NULL COMMENT "Edad de la persona",
    tex_nombre VARCHAR(200) NOT NULL COMMENT "Nombre de la persona",
    FOREIGN KEY (id_estadoCivil) REFERENCES PersonaEstadoCivil(id),
    FOREIGN KEY (id_nacionalidad) REFERENCES PersonaNacionalidad(id)

) COMMENT "Corresponde a la información personal de la Persona";

CREATE TABLE Persona
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES PersonaInfo(id)

) COMMENT "Corresponde a la tabla de Persona registrada en el sistema";
