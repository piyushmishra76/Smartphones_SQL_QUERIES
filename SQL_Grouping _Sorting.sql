select * from campus_x.smartphones_cleaned_v6 ;
-- renaming the column to brand
ALTER TABLE smartphones_cleaned_v6
CHANGE ï»¿brand_name brand VARCHAR(50);
-- WE WILL USE ORDER BY FOR SORTING 
-- ORDER BY COLUMN_NAME DESC/ASC LIMIT (NUM)
-- LIMIT IS USED TO DISPLAY UPTO WHICH NUMBER OF ROW WE WANT
-- find the top 5 samsung phones with biggest screen size
select brand,model,screen_size from smartphones_cleaned_v6 where brand='samsung'
order by screen_size desc limit 5;

-- 2. SORT ALL THE PHONES WITHIN DESCENDING ORDER OF TOTAL NUMBER OF CAMERAS
SELECT *,num_front_cameras+num_rear_cameras as 'total_camera' from smartphones_cleaned_v6
order by total_camera desc;
-- 3  SORT DATA ON THE BASIS OF PPI IN DESCENDING ORDER
SELECT model,round(sqrt(resolution_width*resolution_width + resolution_height* resolution_height)/screen_size) as 'PPI' from campus_x.smartphones_cleaned_v6
order by PPI desc ;
-- 4 find the phone with second largest battery
-- basically means the second most having largest abttery capacity
select model,battery_capacity from smartphones_cleaned_v6
order by battery_capacity desc limit 1 offset 1; -- offset will remove the first row or n rows 

-- find the name,rating of the worst rated apple phone
select model,rating from smartphones_cleaned_v6 where brand='apple'
order by rating asc limit 1 -- limit 1 is because there asks the worst one
;

-- 6. sort phones alphabetically and then on the basis of rating in desc order 
-- here we have to sort the brand column for the alphabetically and then on the basic of rating means sorting based on two columns
select  * from smartphones_cleaned_v6
order by brand asc , rating asc;

-- GROUPING DATA GROUP BY QUERY
-- 1. GROUP SMARTPHONE BY BRAND AND GET THE COUNT,AVG PRICE,MAX RATING,AVG SCRREN_SIZE AND AVG BATTERY CAPACITY
	select brand, count(*) as 'number_of_phones', -- jab groupby apply hoga to har brand ke alag table bnenge uske baad count(*) uske number of rows count karke return krega
    avg(price),-- will give avg price of each brand
    max(rating/10),round(avg(screen_size)),avg(battery_capacity)
    from smartphones_cleaned_v6
    group by brand
    order by avg(price) desc limit 5;
    
    -- 2 GROUP SMARTPHONES BY WHETHER THEY HAVE AN 5g AND GET THE AVERAGE PRICE AND RATING
    SELECT has_5g,avg(price) as 'avg price', avg(rating/10) from smartphones_cleaned_v6
    group by has_5g;
    
    -- 3 GROUP THE SMARTPHONES BY THE EXTENDED MEMORY AVAILABLE AND GET THE AVG PRICE
    SELECT extended_memory_available ,avg(price) as 'avg price ' from smartphones_cleaned_v6
    group by extended_memory_available;
    
    -- 4 GROUP SMARTPHONES BY THE BRAND AND PROCESSOR BRAND AND GET THE COUNT OF MODEL AND THE AVERAGE PRIMARY CAMERA RESOLUTION(REAR)
    SELECT brand,processor_brand, count(*) as 'num_phones',
    avg(primary_camera_rear) as 'avg  camera resolution'
    from smartphones_cleaned_v6
    group by brand,processor_brand;
    -- find top 5 most costlybrands
    select brand,round(avg(price)) from smartphones_cleaned_v6
    group by brand
    order by avg(price) desc limit 5;
    
    -- 6 which brand makes the smallest screen smartphones
    select brand,min(screen_size )from smartphones_cleaned_v6
    group by brand
    order by min(screen_size);
    -- average price of 5g phones vs non 5g phones
    select has_5g,avg(price) from smartphones_cleaned_v6-- hamesha group by aggreagte term ke saath hi kaam krega 
    group by has_5g