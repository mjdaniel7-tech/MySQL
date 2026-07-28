-- ===========================================

-- Solar System Database Functions

-- ===========================================

-- Function 1: Count total planets

DELIMITER $$

CREATE FUNCTION TotalPlanets()

RETURNS INT

DETERMINISTIC

BEGIN

    DECLARE total INT;

    SELECT COUNT(*)

    INTO total

    FROM celestial_bodies

    WHERE type = 'Planet';

    RETURN total;

END$$

DELIMITER ;

-- ===========================================

-- Function 2: Count moons for a planet

DELIMITER $$

CREATE FUNCTION MoonCount(planetID INT)

RETURNS INT

DETERMINISTIC

BEGIN

    DECLARE total INT;

    SELECT COUNT(*)

    INTO total

    FROM moons

    WHERE celestial_body_id = planetID;

    RETURN total;

END$$

DELIMITER ;

-- ===========================================

-- Function 3: Escape velocity estimate

DELIMITER $$

CREATE FUNCTION EscapeVelocity(gravity DOUBLE)

RETURNS DOUBLE

DETERMINISTIC

BEGIN

    RETURN SQRT(gravity * 2);

END$$

DELIMITER ;

-- ===========================================

-- Function 4: Planet category

DELIMITER $$

CREATE FUNCTION PlanetCategory(radius DOUBLE)

RETURNS VARCHAR(30)

DETERMINISTIC

BEGIN

    IF radius < 3000 THEN

        RETURN 'Small Planet';

    ELSEIF radius < 10000 THEN

        RETURN 'Medium Planet';

    ELSE

        RETURN 'Large Planet';

    END IF;

END$$

DELIMITER ;

-- ===========================================

-- Function 5: Uppercase planet name

DELIMITER $$

CREATE FUNCTION PlanetUpper(planetName VARCHAR(100))

RETURNS VARCHAR(100)

DETERMINISTIC

BEGIN

    RETURN UPPER(planetName);

END$$

DELIMITER 
