create database Agriculture;
use Agriculture;

create table crops_data(
Region text,
Soil_Type text,
Crop text,
Rainfall_mm double,
Temperature_Celsius double,
Fertilizer text,
Irrigation_Used	text,
Weather_Condition text,
Days_to_Harvest int,
Fertilizer_Usage_Level double
);

SET GLOBAL LOCAL_INFILE=ON;
LOAD DATA LOCAL INFILE 'C:/Users/USER/Downloads/archive/crop_yield.csv' 
INTO TABLE crops_data
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select *from crops_data;

select Region from crops_data where Region ='East';

select max(Rainfall_mm),Region from crops_data group by(Region);

select max(Fertilizer_Usage_Level),Region from crops_data group by(Region);

select Fertilizer from crops_data where Fertilizer='False';

-- these are the count of fertilizers minimized in crops
select count(Fertilizer) as Fertilizer_minimized from crops_data where Fertilizer='False';

select Weather_Condition from crops_data 
group by Weather_Condition 
having(Weather_Condition='Rainy');

select Temperature_Celsius from crops_data where Temperature_Celsius >18.02614225436302;

-- this is the maximum temperatue in the dataset
select max(Temperature_Celsius) from crops_data;

select Crop, Days_to_Harvest from crops_data where Days_to_Harvest between 100 and 150;

select round(Rainfall_mm) from crops_data;

select Region from crops_data order by Region asc;  