-- Cyclistic Bike-Share Analysis | Google Data Analytics Capstone
-- Author: Nick Khurshid | April 2026
-- Tool:   Google BigQuery
-- Step:   01 – Data Consolidation
-- ============================================================
-- Combines 12 monthly CSV files (uploaded to Google Cloud Storage)
-- into a single unified table for analysis.
-- Source path: gs://cyclistic-data-nickkhurshid/*.csv
-- ============================================================

CREATE OR REPLACE TABLE `capstoneprojectbiketrips.cyclistic_data.all_rides` AS

SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_01`
UNION ALL
SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_02`
UNION ALL
SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_03`
UNION ALL
SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_04`
UNION ALL
SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_05`
UNION ALL
SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_06`
UNION ALL
SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_07`
UNION ALL
SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_08`
UNION ALL
SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_09`
UNION ALL
SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_10`
UNION ALL
SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_11`
UNION ALL
SELECT * FROM `capstoneprojectbiketrips.cyclistic_data.tripdata_2023_12`;
