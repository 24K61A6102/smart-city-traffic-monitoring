traffic =LOAD '/traffic/input/pig_input.csv'
USING PigStorage(',')
AS (
    traffic_date:chararray,
    traffic_time:chararray,
    location:chararray,
    vehicle_count:int,
    avg_speed_kmph:int,
    traffic_density:chararray,
    traffic_light:chararray,
    weather:chararray,
    accident:chararray,
    congestion_level:chararray
);

data = FILTER traffic BY traffic_date != 'Date';
sample_data = LIMIT data 10;
DUMP simple_data; 
