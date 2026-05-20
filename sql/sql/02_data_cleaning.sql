-- Cyclistic Bike-Share Analysis | Google Data Analytics Capstone
-- Author: Nick Khurshid | April 2026
-- Tool:   Google BigQuery
-- Step:   02 – Data Cleaning & Feature Engineering
-- ============================================================
-- Cleaning steps applied:
--   1. Remove duplicate ride_ids
--   2. Filter out trips < 1 minute or > 24 hours
--   3. Handle NULL station names
--   4. Filter invalid member_casual values
--   5. Feature engineering: ride_length, day_of_week, hour, month
-- ============================================================


-- ------------------------------------------------------------
-- STEP 1: Check for duplicate ride_ids
-- Expected result: 0 rows (no duplicates found)
-- ------------------------------------------------------------
SELECT
  ride_id,
  COUNT(*) AS count
FROM `capstoneprojectbiketrips.cyclistic_data.all_rides`
GROUP BY ride_id
HAVING count > 1;


-- ------------------------------------------------------------
-- STEP 2: Check for invalid member_casual values
-- Expected values: 'member' or 'casual' only
-- ------------------------------------------------------------
SELECT
  member_casual,
  COUNT(*) AS count
FROM `capstoneprojectbiketrips.cyclistic_data.all_rides`
GROUP BY member_casual;


-- ------------------------------------------------------------
-- STEP 3: Create cleaned table with all transformations
-- Output: capstoneprojectbiketrips.cyclistic_data.cleaned_rides
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE `capstoneprojectbiketrips.cyclistic_data.cleaned_rides` AS

SELECT
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  COALESCE(start_station_name, 'Unknown') AS start_station_name,
  COALESCE(start_station_id,   'Unknown') AS start_station_id,
  COALESCE(end_station_name,   'Unknown') AS end_station_name,
  COALESCE(end_station_id,     'Unknown') AS end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual,

  -- Feature Engineering
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE)   AS ride_length,
  EXTRACT(DAYOFWEEK FROM started_at)              AS day_of_week,   -- 1=Sun, 7=Sat
  EXTRACT(HOUR      FROM started_at)              AS hour,
  EXTRACT(MONTH     FROM started_at)              AS month

FROM `capstoneprojectbiketrips.cyclistic_data.all_rides`

WHERE
  -- Remove trips under 1 minute or over 24 hours (system errors / maintenance)
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 60
  AND TIMESTAMP_DIFF(ended_at, started_at, HOUR) < 24

  -- Keep only valid user types
  AND member_casual IN ('member', 'casual')

  -- Require start station name (removes records without meaningful location data)
  AND start_station_name IS NOT NULL;


-- ------------------------------------------------------------
-- STEP 4: Verify row count after cleaning
-- ------------------------------------------------------------
SELECT
  COUNT(*) AS total_cleaned_rows
FROM `capstoneprojectbiketrips.cyclistic_data.cleaned_rides`;
