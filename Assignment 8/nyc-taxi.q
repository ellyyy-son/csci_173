
# create table
DROP TABLE IF EXISTS nyctaxi;
CREATE EXTERNAL TABLE nyctaxi (
  vendor_id                 STRING,
  pickup_at                 TIMESTAMP,
  dropoff_at                TIMESTAMP,
  passenger_count           INT,
  trip_distance             FLOAT,
  pickup_longitude          FLOAT,
  pickup_latitude           FLOAT,
  rate_code_id              STRING,
  store_and_fwd_flag        STRING,
  dropoff_longitude         FLOAT,
  dropoff_latitude          FLOAT,
  payment_type              STRING,
  fare_amount               FLOAT,
  extra                     FLOAT,
  mta_tax                   FLOAT,
  tip_amount                FLOAT,
  tolls_amount              FLOAT,
  total_amount              FLOAT,
  improvement_surcharge     FLOAT,
  pickup_location_id        INT,
  dropoff_location_id       INT,
  congestion_surcharge      FLOAT
) PARTITIONED BY (year string, month string)
STORED AS PARQUET
LOCATION 'gs://csci273-taxi-partitioned/';

MSCK REPAIR TABLE nyctaxi;

SELECT 
  year, 
  count(vendor_id) as count
FROM nyctaxi 
GROUP BY year
ORDER BY count DESC LIMIT 10;

SELECT year, dropoff_location_id, trip_count FROM
(SELECT 
  year,
  dropoff_location_id, 
  count(dropoff_location_id) as trip_count,
  row_number() over (partition by year order by count(*) desc) as row_number
FROM nyctaxi 
WHERE year in ('2017', '2018')
GROUP BY year, dropoff_location_id)
WHERE row_number <= 10
ORDER BY year, trip_count



