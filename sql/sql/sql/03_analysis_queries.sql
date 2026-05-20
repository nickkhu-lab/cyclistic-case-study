-- Cyclistic Bike-Share Analysis | Google Data Analytics Capstone
-- Author: Nick Khurshid | April 2026
-- Tool:   Google BigQuery
-- Step:   03 – Analysis Queries
-- ============================================================
-- All queries run on: cleaned_rides table
-- Covers the 5 key insights from the analysis:
--   1. Average Ride Duration
--   2. Rides by Day of Week
--   3. Rides by Hour of Day
--   4. Monthly / Seasonal Patterns
--   5. Top Start Stations
-- ============================================================


-- ------------------------------------------------------------
-- INSIGHT 1: Average Ride Duration by User Type
-- Casual riders have significantly longer average durations
-- → suggests recreational/leisure use
-- ------------------------------------------------------------
SELECT
  member_casual,
  ROUND(AVG(ride_length), 2)  AS avg_ride_length_minutes,
  ROUND(MIN(ride_length), 2)  AS min_ride_length_minutes,
  ROUND(MAX(ride_length), 2)  AS max_ride_length_minutes
FROM `capstoneprojectbiketrips.cyclistic_data.cleaned_rides`
GROUP BY member_casual
ORDER BY avg_ride_length_minutes DESC;


-- ------------------------------------------------------------
-- INSIGHT 2: Ride Volume by Day of Week
-- Casual: peaks on weekends | Members: peaks on weekdays
-- day_of_week: 1=Sunday, 2=Monday, ..., 7=Saturday
-- ------------------------------------------------------------
SELECT
  member_casual,
  day_of_week,
  CASE day_of_week
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    WHEN 7 THEN 'Saturday'
  END AS day_name,
  COUNT(*) AS total_rides
FROM `capstoneprojectbiketrips.cyclistic_data.cleaned_rides`
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week;


-- ------------------------------------------------------------
-- INSIGHT 3: Ride Volume by Hour of Day
-- Casual: afternoon peak | Members: 08:00 & 17:00 commute peaks
-- ------------------------------------------------------------
SELECT
  member_casual,
  hour,
  COUNT(*) AS total_rides
FROM `capstoneprojectbiketrips.cyclistic_data.cleaned_rides`
GROUP BY member_casual, hour
ORDER BY member_casual, hour;


-- ------------------------------------------------------------
-- INSIGHT 4: Monthly / Seasonal Ride Volume
-- Casual: sharp drop in winter | Members: more stable year-round
-- ------------------------------------------------------------
SELECT
  member_casual,
  month,
  CASE month
    WHEN 1  THEN 'January'
    WHEN 2  THEN 'February'
    WHEN 3  THEN 'March'
    WHEN 4  THEN 'April'
    WHEN 5  THEN 'May'
    WHEN 6  THEN 'June'
    WHEN 7  THEN 'July'
    WHEN 8  THEN 'August'
    WHEN 9  THEN 'September'
    WHEN 10 THEN 'October'
    WHEN 11 THEN 'November'
    WHEN 12 THEN 'December'
  END AS month_name,
  COUNT(*) AS total_rides
FROM `capstoneprojectbiketrips.cyclistic_data.cleaned_rides`
GROUP BY member_casual, month
ORDER BY member_casual, month;


-- ------------------------------------------------------------
-- INSIGHT 5: Top 10 Start Stations by User Type
-- Casual: parks, lakefront, tourist spots
-- Members: offices, transit hubs, residential areas
-- ------------------------------------------------------------
SELECT
  member_casual,
  start_station_name,
  COUNT(*) AS total_rides
FROM `capstoneprojectbiketrips.cyclistic_data.cleaned_rides`
WHERE start_station_name != 'Unknown'
GROUP BY member_casual, start_station_name
ORDER BY member_casual, total_rides DESC
LIMIT 20;


-- ------------------------------------------------------------
-- BONUS: Bike Type Preference by User Type
-- ------------------------------------------------------------
SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_rides,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY member_casual), 2) AS pct_of_user_type
FROM `capstoneprojectbiketrips.cyclistic_data.cleaned_rides`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_rides DESC;

