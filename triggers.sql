-- ===========================================

-- Solar System Database Triggers

-- ===========================================

-- Trigger 1: Automatically update modified date

DELIMITER $$

CREATE TRIGGER trg_update_modified

BEFORE UPDATE

ON celestial_bodies

FOR EACH ROW

BEGIN

    SET NEW.last_updated = CURRENT_TIMESTAMP;

END$$

DELIMITER ;

-- ===========================================

-- Trigger 2: Prevent duplicate planet names

DELIMITER $$

CREATE TRIGGER trg_prevent_duplicate_planets

BEFORE INSERT

ON celestial_bodies

FOR EACH ROW

BEGIN

    IF EXISTS (

        SELECT 1

        FROM celestial_bodies

        WHERE name = NEW.name

    ) THEN

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT = 'Planet already exists.';

    END IF;

END$$

DELIMITER ;

-- ===========================================

-- Trigger 3: Log new planet insertions

DELIMITER $$

CREATE TRIGGER trg_log_new_planet

AFTER INSERT

ON celestial_bodies

FOR EACH ROW

BEGIN

    INSERT INTO activity_log

    (

        action,

        object_name,

        action_date

    )

    VALUES

    (

        'INSERT',

        NEW.name,

        NOW()

    );

END$$

DELIMITER ;

-- ===========================================

-- Trigger 4: Log deleted planets

DELIMITER $$

CREATE TRIGGER trg_log_deleted_planet

AFTER DELETE

ON celestial_bodies

FOR EACH ROW

BEGIN

    INSERT INTO activity_log

    (

        action,

        object_name,

        action_date

    )

    VALUES

    (

        'DELETE',

        OLD.name,

        NOW()

    );

END$$

DELIMITER ;

-- ===========================================

-- Trigger 5: Prevent negative radius

DELIMITER $$

CREATE TRIGGER trg_check_radius

BEFORE INSERT

ON celestial_bodies

FOR EACH ROW

BEGIN

    IF NEW.mean_radius_km < 0 THEN

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT = 'Radius cannot be negative.';

    END IF;

END$$

DELIMITER 
