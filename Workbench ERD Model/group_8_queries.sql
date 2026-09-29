USE montgomery_county_crime;

-- Q1 – Are certain types of crimes more prevalent in specific locations?
-- Returns multiple rows grouped by crime type, city, and street, 
-- showing the number of incidents for each combination.
-- ---------------------------------------------------------------
SELECT o.crime_name2 AS crime_type,
       l.city,
       s.street_name,
       s.street_type,
       COUNT(i.incident_id) AS num_incidents
FROM incidents i
JOIN incident_offenses io ON i.incident_id = io.incident_id
JOIN offenses o           ON io.offense_code = o.offense_code
JOIN locations l          ON i.location_id = l.location_id
JOIN streets s            ON l.street_id = s.street_id
GROUP BY o.crime_name2, l.city, s.street_name, s.street_type
ORDER BY num_incidents DESC;


-- Q2 – Which areas experience the highest amount of reported crime?
-- Uses the incidents_by_city view. Returns cities grouped by total incidents, 
-- ordered from highest to lowest.
-- ---------------------------------------------------------------
SELECT city, total_incidents
FROM incidents_by_city
ORDER BY total_incidents DESC;


-- Q3 – What types of crime occur most frequently in Montgomery County?
-- Uses the top_offenses view. Returns crime types with their total counts 
-- ordered from most to least frequent.
-- ---------------------------------------------------------------
SELECT offense_name, crime_against, times_charged
FROM top_offenses
ORDER BY times_charged DESC;

 
-- Q4 – Which cities have more incidents than the county average?
-- Uses a subquery to calculate the average number of incidents per city, 
-- then filters to only return cities above that average.
-- ---------------------------------------------------------------
SELECT city, total_incidents
FROM incidents_by_city
WHERE total_incidents > (
    SELECT AVG(total_incidents) FROM incidents_by_city
);



-- Q5 – How many person crimes occurred per police district?
-- Joins incidents, police districts, incident_offenses, and offenses. 
-- Filters to only crimes against a person and groups by district.
-- ---------------------------------------------------------------
SELECT pd.district_name,
       COUNT(i.incident_id) AS person_crime_incidents
FROM incidents i
JOIN police_districts pd  ON pd.police_district_id = i.police_district_id
JOIN incident_offenses io ON io.incident_id = i.incident_id
JOIN offenses o           ON o.offense_code = io.offense_code
WHERE o.crime_name1 = 'Crime Against Person'
GROUP BY pd.district_name
ORDER BY person_crime_incidents DESC;

 
 
-- Q6 – Which incidents in Silver Spring involved more than one offense?
-- Filters incidents to Silver Spring using WHERE, then applies HAVING 
-- to return only those with more than one offense charged.
-- ---------------------------------------------------------------
SELECT i.incident_id,
       i.cr_number,
       l.city,
       COUNT(io.offense_code) AS num_offenses
FROM incidents i
JOIN incident_offenses io ON io.incident_id = i.incident_id
JOIN locations l          ON l.location_id = i.location_id
WHERE l.city = 'SILVER SPRING'
GROUP BY i.incident_id, i.cr_number, l.city
HAVING COUNT(io.offense_code) > 1;



-- Q7 – Can multiple crimes happen at the same time?
-- Returns incidents that have more than one offense recorded, listing all crimes charged using GROUP_CONCAT
-- ---------------------------------------------------------------
SELECT i.incident_id,
       i.cr_number,
       COUNT(io.offense_code) AS num_offenses,
       GROUP_CONCAT(o.crime_name3 ORDER BY o.crime_name3 SEPARATOR ' | ') AS crimes
FROM incidents i
JOIN incident_offenses io ON io.incident_id = i.incident_id
JOIN offenses o           ON o.offense_code = io.offense_code
GROUP BY i.incident_id, i.cr_number
HAVING COUNT(io.offense_code) > 1
ORDER BY num_offenses DESC;
