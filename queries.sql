-- ===========================================

-- Solar System Database Queries

-- ===========================================

-- Query 1: List all planets

SELECT * FROM celestial_bodies;

-- Query 2: Find Earth

SELECT *

FROM celestial_bodies

WHERE name = 'Earth';

-- Query 3: List all moons

SELECT *

FROM moons;

-- Query 4: List moons of Jupiter

SELECT m.name

FROM moons m

JOIN celestial_bodies c

ON m.celestial_body_id = c.id

WHERE c.name = 'Jupiter';

-- Query 5: Count moons for each planet

SELECT c.name,

       COUNT(m.id) AS total_moons

FROM celestial_bodies c

LEFT JOIN moons m

ON c.id = m.celestial_body_id

GROUP BY c.name

ORDER BY total_moons DESC;

-- Query 6: Largest planet

SELECT name, mean_radius_km

FROM celestial_bodies

ORDER BY mean_radius_km DESC

LIMIT 1;

-- Query 7: Search for a planet

SELECT *

FROM celestial_bodies

WHERE name LIKE '%Mars%';

-- Query 8: Planets ordered from the Sun

SELECT name, order_from_sun

FROM celestial_bodies

ORDER BY order_from_sun;
