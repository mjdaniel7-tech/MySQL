-- ===========================================

-- Solar System Database Backup Script

-- ===========================================

-- Create backup database

CREATE DATABASE IF NOT EXISTS solar_system_backup;

-- Select backup database

USE solar_system_backup;

-- Backup celestial bodies table

CREATE TABLE celestial_bodies_backup AS

SELECT *

FROM solar_system.celestial_bodies;

-- Backup moons table

CREATE TABLE moons_backup AS

SELECT *

FROM solar_system.moons;

-- Verify backup

SELECT

    'Celestial Bodies' AS Table_Name,

    COUNT(*) AS Records

FROM celestial_bodies_backup

UNION ALL

SELECT

    'Moons',

    COUNT(*)

FROM moons_backup;

-- Backup completed

SELECT

'Backup completed successfully.' AS Status;
