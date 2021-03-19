USE RNP;

-- Mostrar el porcentaje de hondureños y exntrajeros

SELECT
    CASE
        WHEN
            bit_nacionalidad = 0 THEN CAST(bit_nacionalidad AS INT)
            ELSE 
                CAST(bit_nacionalidad AS INT)
    END AS "País",
    CONCAT
    (
        (
            SELECT
                COUNT(*)
            FROM
                Persona
            INNER JOIN
                PersonaInfo ON Persona.id = PersonaInfo.id
            INNER JOIN
                PersonaNacionalidad ON PersonaInfo.id = PersonaNacionalidad.id
            WHERE
                bit_nacionalidad LIKE b'0'
        )/
        (
            SELECT
                COUNT(*)
            FROM
                Persona
            INNER JOIN
                PersonaInfo ON Persona.id = PersonaInfo.id
            INNER JOIN
                PersonaNacionalidad ON PersonaInfo.id = PersonaNacionalidad.id
            WHERE
                PersonaInfo.id = PersonaNacionalidad.id
        )*100,
        " %"
    ) AS "Porcentaje de Hondureños",
    CONCAT
    (
        (
            SELECT
                COUNT(*)
            FROM
                Persona
            INNER JOIN
                PersonaInfo ON Persona.id = PersonaInfo.id
            INNER JOIN
                PersonaNacionalidad ON PersonaInfo.id = PersonaNacionalidad.id
            WHERE
                bit_nacionalidad LIKE b'1'
        )/
        (
            SELECT
                COUNT(*)
            FROM
                Persona
            INNER JOIN
                PersonaInfo ON Persona.id = PersonaInfo.id
            INNER JOIN
                PersonaNacionalidad ON PersonaInfo.id = PersonaNacionalidad.id
            WHERE
                PersonaInfo.id = PersonaNacionalidad.id
        )*100,
        " %"
    ) AS "Porcentaje de Extranjeros"
FROM
    Persona
INNER JOIN
    PersonaInfo ON Persona.id = PersonaInfo.id
INNER JOIN
    PersonaNacionalidad ON PersonaInfo.id = PersonaNacionalidad.id
GROUP BY
    bit_nacionalidad
;

-- Mostrar el total de personas con la misma edad

SELECT
    num_edad AS "Edad",
    COUNT(*) AS "Total de personas con la misma edad"
FROM
    Persona
INNER JOIN
    PersonaInfo ON Persona.id = PersonaInfo.id
WHERE
    num_edad LIKE 26
GROUP BY
    num_edad
;

-- Mostrar el total de personas en un rango de edad

SELECT
    tex_nombre AS "Nombre",
    num_edad AS "Edad",
    COUNT(*) AS "Total de personas con el rango de edad 20-22"
FROM
    Persona
INNER JOIN
    PersonaInfo ON Persona.id = PersonaInfo.id
GROUP BY
    num_edad
HAVING
    num_edad >=22 AND num_edad<=24
;