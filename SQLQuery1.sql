-- Create View to Explore Data 

Create View Hotels_V AS
select *from [Hotel DB].[dbo].[2018]
union all
select *from [Hotel DB].[dbo].[2019]
union all
select *from [Hotel DB].[dbo].[2020]


-- Check if there Null Values

select * from Hotels_V
where hotel IS NULL OR market_segment IS NULL;
 


-- Check if there is Duplicate Rows

select Distinct Count(*) from Hotels_V;

select  Count(*) from Hotels_V;


-- Calculate Revenue per Year by Hotel Type

select 
		hotel,
		arrival_date_year,
		Round(SUM(((stays_in_week_nights + stays_in_weekend_nights)*adr)),2) AS Revenue
 from Hotels_V
 group by arrival_date_year,hotel;


 -- Guests With Personal Cars

 Select Customer_type , SUM(required_car_parking_spaces) AS Total_Cars from Hotels_V
 group by customer_type


 --Combine Tables

select 
  * 
from 
  Hotels_V H 
  left join market_segment M ON H.market_segment = M.market_segment 
  left Join meal_cost MC ON H.meal = MC.meal
