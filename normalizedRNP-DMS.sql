TRUNCATE PersonaCedula;
TRUNCATE PersonaResidencia;
TRUNCATE PersonaCiudad;
TRUNCATE PersonaDepartamento;
TRUNCATE PersonaNacionalidad;
TRUNCATE PersonaEstadoCivil;
TRUNCATE PersonaInfo;
TRUNCATE Persona;

INSERT INTO PersonaCedula(tex_cedula) VALUES

    ("0801-1999-01234"),
    ("0801-1998-56789"),
    ("0801-1997-01234"),
    ("0805-1995-56789"),
    ("0805-1996-01234"),
    ("0805-1996-56789")

;
INSERT INTO PersonaResidencia(tex_residencia) VALUES

    ("Residencial Plaza"),
    ("Residencial Plaza"),
    ("Residencial Plaza"),
    ("Residencial Toledo"),
    ("Residencial Toledo"),
    ("Residencial Toledo")

;
INSERT INTO PersonaCiudad(tex_ciudad) VALUES

    ("Tegucigalpa"),
    ("Tegucigalpa"),
    ("Tegucigalpa"),
    ("San Pedro Sula"),
    ("San Pedro Sula"),
    ("San Pedro Sula")

;

INSERT INTO PersonaDepartamento(id_residencia,id_ciudad,tex_departamento) VALUES

    (1,1,"Francisco Morazán"),
    (2,2,"Francisco Morazán"),
    (3,3,"Francisco Morazán"),
    (4,4,"Cortés"),
    (5,5,"Cortés"),
    (6,6,"Cortés")

;


INSERT INTO PersonaNacionalidad(id_cedula,id_departamento,bit_nacionalidad) VALUES

    (1,1,b'0'),
    (2,2,b'1'),
    (3,3,b'0'),
    (4,4,b'1'),
    (5,5,b'0'),
    (6,6,b'0')

;


INSERT INTO PersonaEstadoCivil(bit_estado) VALUES

    (b'0'),
    (b'1'),
    (b'0'),
    (b'1'),
    (b'0'),
    (b'0')

;

INSERT INTO PersonaInfo(id_estadoCivil,id_nacionalidad,num_edad,tex_nombre) VALUES

    (1,1,22,"Test"),
    (2,2,23,"Test2"),
    (3,3,24,"Test3"),
    (4,4,25,"Test4"),
    (5,5,26,"Test5"),
    (6,6,26,"Test6")

;

INSERT INTO Persona(id_persona) VALUES

    (1),(2),(3),(4),(5),(6)

;