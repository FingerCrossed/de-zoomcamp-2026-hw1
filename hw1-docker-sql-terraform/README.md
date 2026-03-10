# de-zoomcamp-2026-hw1

## Question 1

Run:

docker run -it --entrypoint=bash python:3.13

Then inside container:

pip --version

Answer:

25.3


## Question 2

Hostname:

db

Port:

5432

Answer:

db:5432


## Question 3

SELECT COUNT(*)
FROM green_taxi_trips
WHERE lpep_pickup_datetime >= '2025-11-01'
AND lpep_pickup_datetime < '2025-12-01'
AND trip_distance <= 1;


count
------
8007


## Question 4

SELECT DATE(lpep_pickup_datetime) AS pickup_day
FROM green_taxi_trips
WHERE trip_distance < 100
ORDER BY trip_distance DESC
LIMIT 1;

pickup_day
------
2025-11-14


## Question 5

SELECT
    z."Zone",
    SUM(g.total_amount) AS total_amount
FROM green_taxi_trips g
JOIN zones z
ON g."PULocationID" = z."LocationID"
WHERE DATE(g.lpep_pickup_datetime) = '2025-11-18'
GROUP BY z."Zone"
ORDER BY total_amount DESC
LIMIT 1;

Zone              | total_amount
------------------|------------------
East Harlem North | 9281.920000000004


## Question 6

SELECT
    zdo."Zone",
    MAX(g.tip_amount) AS max_tip
FROM green_taxi_trips g
JOIN zones zpu
ON g."PULocationID" = zpu."LocationID"
JOIN zones zdo
ON g."DOLocationID" = zdo."LocationID"
WHERE zpu."Zone" = 'East Harlem North'
AND g.lpep_pickup_datetime >= '2025-11-01'
AND g.lpep_pickup_datetime < '2025-12-01'
GROUP BY zdo."Zone"
ORDER BY max_tip DESC
LIMIT 1;

Zone           |max_tip
---------------|------
Yorkville West | 81.89

## Question 7
terraform init, terraform apply -auto-approve, terraform destroy