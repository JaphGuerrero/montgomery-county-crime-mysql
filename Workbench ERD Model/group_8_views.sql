USE montgomery_county_crime;

-- 1. Full incident details (all tables joined)
-- Joins all tables into a single flat view to make it easier to create queries any incident's agency, location, district, and offense without writing manual joins
CREATE OR REPLACE VIEW full_incident_details AS
SELECT
    i.incident_id,
    i.cr_number,
    a.agency_name,
    l.city,
    l.zip_code,
    s.street_name,
    s.street_type,
    pd.district_name,
    o.crime_name1,
    o.crime_name2,
    o.crime_name3
FROM incidents i
JOIN agencies          a  ON a.agency_id           = i.agency_id
JOIN locations         l  ON l.location_id          = i.location_id
JOIN streets           s  ON s.street_id            = l.street_id
JOIN police_districts  pd ON pd.police_district_id  = i.police_district_id
JOIN incident_offenses io ON io.incident_id         = i.incident_id
JOIN offenses          o  ON o.offense_code         = io.offense_code;


-- 2. How many incidents each agency handled
-- Shows how many incidents each law enforcement agency handled ranked from most to least
CREATE OR REPLACE VIEW incidents_per_agency AS
SELECT
    a.agency_name,
    COUNT(i.incident_id) AS total_incidents
FROM agencies a
JOIN incidents i ON i.agency_id = a.agency_id
GROUP BY a.agency_name
ORDER BY total_incidents DESC;


-- 3. Most common offenses
-- Lists every offense type ranked by how many times it was charged across all incidents
CREATE OR REPLACE VIEW top_offenses AS
SELECT
    o.crime_name3 AS offense_name,
    o.crime_name1 AS crime_against,
    COUNT(io.incident_id) AS times_charged
FROM offenses o
JOIN incident_offenses io ON io.offense_code = o.offense_code
GROUP BY o.crime_name3, o.crime_name1
ORDER BY times_charged DESC;


-- 4. Incident count by city
-- Shows the total number of incidents per city, ranked from most to least
CREATE OR REPLACE VIEW incidents_by_city AS
SELECT
    l.city,
    COUNT(i.incident_id) AS total_incidents
FROM locations l
JOIN incidents i ON i.location_id = l.location_id
GROUP BY l.city
ORDER BY total_incidents DESC;


-- 5. Incident count by police district
-- Shows the total number of incidents per police district, ranked from most to least.
CREATE OR REPLACE VIEW incidents_by_district AS
SELECT
    pd.district_name,
    COUNT(i.incident_id) AS total_incidents
FROM police_districts pd
JOIN incidents i ON i.police_district_id = pd.police_district_id
GROUP BY pd.district_name
ORDER BY total_incidents DESC;