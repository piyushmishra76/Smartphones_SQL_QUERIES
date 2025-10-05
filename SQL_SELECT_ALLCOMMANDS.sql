SELECT * FROM campus_x.smartphones_cleaned_v6;
SELECT model, 
SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size AS 'ppi' -- this will calculate the ppi , ppi jada mobile jada achha ppi kam mobile kam achha
FROM smartphones_cleaned_v6;
SELECT  model, rating/10 FROM smartphones_cleaned_v6;
 -- Filtering rows where clause
 -- Q. find all phones where brand is samsung
 SELECT * FROM smartphones_cleaned_v6
 WHERE ï»¿brand_name='samsung';
 -- find all phone where prie is greaterthan 50000
 SELECT * FROM smartphones_cleaned_v6
 WHERE price>50000;
 
 -- BETWEEN it is used to filter the data within a given range
 -- Q1 find all the phones between 10000 and 20000
 -- 1st approach
 SELECT * FROM smartphones_cleaned_v6 
 WHERE price>10000 AND price <20000;
 -- 2nd approach using between 
 SELECT * FROM smartphones_cleaned_v6
 WHERE price BETWEEN 10000 AND 20000;
 -- find phones with rating >80 and price <25000
 SELECT * FROM smartphones_cleaned_v6
 WHERE rating>80 AND price<25000;
 
-- find all samsung phone with ram> 8 gb
SELECT * FROM smartphones_cleaned_v6
 WHERE ï»¿brand_name='samsung' AND ram_capacity>8 -- 3 phones are there with ram >8 and samsung
;

-- MOST IMP - QUERY EXECUTION ORDER
-- Order of execution of sql queries most important remember for job interview
-- FROM->JOIN-> WHERE-->GROUP BY--> HAVING-->SELECT-->D-->ORDER_BY
-- FIRSTLY THE TABLE WILL BE SELECTED THEN FILTER WILL BE APPLY OF WHERE CLAUSE-THEN SELECTING THE STATEMENT
 
 -- FIND THE BRANDS WHO SELL PHONES WITH PRICE >50000
 SELECT DISTINCT ï»¿brand_name AS 'Costly_phone' FRORM smartphones_cleaned_v6
 where price>50000;
 
 -- UPDATE query : to update the value of row on the basis of condition in the column
 -- syntax : update table name
 -- set column_name= 'value'
 -- where condition
 UPDATE campus_x.smartphones_cleaned_v6
 SET processor_brand='dimensity'
 WHERE processor_brand='mediatek'; -- it will not execute because there is a safe mode in mysql which doesnot allow to ud in a column if there is no primary key so we have to change this in th esettong
 -- now it is updated 
 SELECT  * FROM smartphones_cleaned_v6
 WHERE processor_brand='dimensity';
 
 -- DELETE THE ROW WHERE PRICE >200000
 SELECT* FROM campus_x.smartphones_cleaned_v6
 WHERE price>200000 -- WE HAVE TO DELETE THIS ROW
 ;
 DELETE from  campus_x.smartphones_cleaned_v6
 WHERE price>200000;
 
 -- AGGREGATE FUNCTIONS
 SELECT max(price) FROM campus_x.smartphones_cleaned_v6;
 SELECT min(price) FROM campus_x.smartphones_cleaned_v6;
 -- find the price of the costliest phone  in samsung companny
 SELECT MAX(price) FROM campus_x.smartphones_cleaned_v6
 WHERE ï»¿brand_name='samsung' ;-- verufying it in the next query
 SELECT * FROM campus_x.smartphones_cleaned_v6
 WHERE price=110999 AND ï»¿brand_name='samsung'
 ;
 -- find average rating of the apple phones
 SELECT AVG(rating) FROM campus_x.smartphones_cleaned_v6
 WHERE ï»¿brand_name='apple' ;-- average rating is 79.1905
 -- find the number of oneplus phones 
 SELECT COUNT(*) FROM campus_x.smartphones_cleaned_v6
 WHERE ï»¿brand_name='oneplus' -- 37 one plus phones is in the dataset
 ;
 -- count the number of unique brancs
 SELECT COUNT(DISTINCT(ï»¿brand_name)) FROM campus_x.smartphones_cleaned_v6;
 -- std of the scrren size
 SELECT STD(screen_size) FROM campus_x.smartphones_cleaned_v6;
 SELECT VARIANCE(screen_size) FROM campus_x.smartphones_cleaned_v6
 -- find variance of price of  xiamo phone series
 ;
 SELECT variance(price) FROM campus_x.smartphones_cleaned_v6
 WHERE ï»¿brand_name='xiaomi'