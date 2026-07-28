-- ===========================================

-- Solar System Database Stored Procedures

-- ===========================================

-- Procedure 1: Show all planets

DELIMITER $$

CREATE PROCEDURE GetAllPlanets()

BEGIN

    SELECT *

    FROM celestial_bodies

    WHERE type = 'Planet'

    ORDER BY order_from_sun;

END$$

DELIMITER ;

-- ===========================================

-- Procedure 2: Search for a planet by name

DELIMITER $$

CREATE PROCEDURE FindPlanet(IN planetName VARCHAR(100))

BEGIN

    SELECT *

    FROM celestial_bodies

    WHERE name LIKE CONCAT('%', planetName, '%');

END$$

DELIMITER ;

-- ===========================================

-- Procedure 3: Show moons for a planet

DELIMITER $$

CREATE PROCEDURE GetPlanetMoons(IN planetID INT)

BEGIN

    SELECT *

    FROM moons

    WHERE celestial_body_id = planetID;

END$$

DELIMITER ;

-- ===========================================

-- Procedure 4: Count all planets

DELIMITER $$

CREATE PROCEDURE CountPlanets()

BEGIN

    SELECT COUNT(*) AS TotalPlanets

    FROM celestial_bodies

    WHERE type = 'Planet';

END$$

DELIMITER ;

-- ===========================================

-- Procedure 5: Largest planets

DELIMITER $$

CREATE PROCEDURE LargestPlanets()

BEGIN

    SELECT name, mean_radius_km

    FROM celestial_bodies

    WHERE type = 'Planet'

    ORDER BY mean_radius_km DESC;

END$$

DELIMITER 
