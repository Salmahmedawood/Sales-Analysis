-- Exploring the data -- 
SELECT * from sales;


--- Total Number of invoices --- 
SELECT count(DISTINCT ordernumber) as Total_Number_of_Invoices
from sales;
-- 307 invoices --


--- Unique Customers ---
SELECT COUNT(DISTINCT customername) as Unique_Customers
from sales;
-- 92 Unique Customers -- 


--- Total # of product categories ---
SELECT count(DISTINCT productline) as Product_Categories
from sales;
-- 7 Product Categories -- 


--- Total sales amount --- 
select ROUND(sum(sales),0) as Total_Sales
from sales;
-- total sales = 10032629 --


--- Average order value ---
select CAST(avg(sales)AS INT) as Average_OrderValue
from sales;
-- average order value = 3553


--- most frequent purchased category ---
SELECT productline, count(*) as total_purchased
from sales
group by productline
order by total_purchased DESC
limit 1;
-- Classical Cars Category with 967 purchased products ---


--- total sales made in each country - to the nearest whole number ---
SELECT country, cast(sum(sales) as INT) as TOTAL_SALES
from sales
GROUP by country
order by TOTAL_SALES DESC;


--- number of sales made by each city ---
SELECT city, COUNT(sales) as TOTAL_SALES
from sales
GROUP by city
order by TOTAL_SALES asc;


--- total sales made each year ---
SELECT year_id, round(sum(sales),0) as TOTAL_SALES
from sales
GROUP by year_id
order by year_id;
/* 2003 generated 3516980 from sales 
2004 generated 4724163 from sales 
2003 generated 1791487 from sales */

--- total sales generated each quarter of every year ---
SELECT year_id, qtr_id, cast(sum(sales)as INT) as TOTAL_SALES
from sales
group by year_id, qtr_id
order by year_id;


--- Explanation of the status of the orders --- 
SELECT status, count(*) as Number_of_times_occured
from sales
group by status
order by Number_of_times_occured asc;
/* Status --- # of times occured
Disputed --- 14 times
In Process --- 41 times 
On Hold --- 44 times
Resolved --- 47 times 
Cancelled --- 60 times 
Shipped --- 2617 times */


