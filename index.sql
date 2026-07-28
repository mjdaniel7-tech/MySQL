-- ===========================================

-- Solar System Database Indexes

-- ===========================================

-- Primary search by name

CREATE INDEX idx_body_name

ON celestial_bodies(name);

-- Search by planet type

CREATE INDEX idx_body_type

ON celestial_bodies(type);

-- Sort planets by order from the Sun

CREATE INDEX idx_order_from_sun

ON celestial_bodies(order_from_sun);

-- Search moons by parent planet

CREATE INDEX idx_moon_planet

ON moons(celestial_body_id);

-- Search moon names

CREATE INDEX idx_moon_name

ON moons(name);

-- Search by gravity

CREATE INDEX idx_surface_gravity

ON celestial_bodies(surface_gravity_ms2);

-- Search by radius

CREATE INDEX idx_mean_radius

ON celestial_bodies(mean_radius_km);
