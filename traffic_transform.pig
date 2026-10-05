traffic = LOAD '/home/hdp/Downloads/smart_city_traffic_monitoring_5kb.csv'
USING PigStorage(',')
AS (
    date_col:chararray,
    time_col:chararray,
    Location:chararray,
    Vehicle_Count:int,
    Avg_Speed_kmph:float,
    Traffic_Density:chararray,
    Traffic_Light:chararray,
    Weather:chararray,
    Accident:chararray,
    Congestion_Level:chararray
);

clean_data = FILTER traffic BY date_col != 'Date';

location_group = GROUP clean_data BY Location;

transformed = FOREACH location_group GENERATE
  group AS Location,
  COUNT(clean_data) AS Total_Records,
  SUM(clean_data.Vehicle_Count) AS Total_Vehicles,
  AVG(clean_data.Avg_Speed_kmph) AS Average_Speed;

DUMP transformed;
