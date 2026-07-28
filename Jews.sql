-- ===========================================

-- Solar System Database Views

-- ===========================================

-- View 1: All Celestial Bodies

CREATE VIEW view_all_bodies AS

SELECT

    id,

    name,

    type,

    order_from_sun,

    mean_radius_km,

    surface_gravity_ms2

FROM celestial_bodies;

-- View 2: Planet Summary

CREATE VIEW view_planet_summary AS

SELECT

    name,

    order_from_sun,

    mean_radius_km,

    surface_gravity_ms2

FROM celestial_bodies

ORDER BY order_from_sun;

-- View 3: Moon Information

CREATE VIEW view_moon_details AS

SELECT

    m.name AS moon_name,

    cb.name AS planet_name,

    m.distance_from_planet_km,

    m.mean_radius_km,

    m.orbital_period_days

FROM moons m

JOIN celestial_bodies cb

ON m.celestial_body_id = cb.id;

-- View 4: Moon Count Per Planet

CREATE VIEW view_moon_count AS

SELECT

    cb.name AS planet_name,

    COUNT(m.id) AS total_moons

FROM celestial_bodies cb

LEFT JOIN moons m

ON cb.id = m.celestial_body_id

GROUP BY cb.id, cb.name;

-- View 5: Largest Moon Per Planet

CREATE VIEW view_largest_moons AS

SELECT

    cb.name AS planet_name,

    m.name AS moon_name,

    m.mean_radius_km

FROM moons m

JOIN celestial_bodies cb

ON cb.id = m.celestial_body_id

WHERE (m.celestial_body_id, m.mean_radius_km) IN (

    SELECT celestial_body_id, MAX(mean_radius_km)

    FROM moons

    GROUP BY celestial_body_id
