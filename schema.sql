-- ==========================================

-- Solar System Database Schema

-- Author: Michael Daniel

-- ==========================================

CREATE DATABASE IF NOT EXISTS solar_system;

USE solar_system;

DROP TABLE IF EXISTS moons;

DROP TABLE IF EXISTS celestial_bodies;

-- ==========================================

-- Celestial Bodies Table

-- ==========================================

CREATE TABLE celestial_bodies (

    id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(50) NOT NULL UNIQUE,

    type ENUM(

        'Terrestrial',

        'Gas Giant',

        'Ice Giant',

        'Dwarf Planet'

    ) NOT NULL,

    order_from_sun INT NOT NULL,

    mass_kg_val DECIMAL(6,3) NOT NULL,

    mass_kg_exp INT NOT NULL,

    mean_radius_km DECIMAL(8,2) NOT NULL,

    surface_gravity_ms2 DECIMAL(5,2) NOT NULL,

    orbital_period_days DECIMAL(8,2) NOT NULL

);

-- ==========================================

-- Moons Table

-- ==========================================

CREATE TABLE moons (

    id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(50) NOT NULL UNIQUE,

    celestial_body_id INT NOT NULL,

    discovery_year INT,

    distance_from_planet_km DECIMAL(10,2) NOT NULL,

    mass_kg_val DECIMAL(6,3),

    mass_kg_exp INT,

    mean_radius_km DECIMAL(8,2) NOT NULL,

    surface_gravity_ms2 DECIMAL(6,4),

    orbital_period_days DECIMAL(8,3) NOT NULL,

    CONSTRAINT fk_celestial_body

        FOREIGN KEY (celestial_body_id)

        REFERENCES celestial_bodies(id)

        ON DELETE CASCADE

)
