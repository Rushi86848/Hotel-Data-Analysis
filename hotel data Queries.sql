

-- created a new table to execuate a collection of select statements

with hotels as (
select * from hotel_data.dbo.[2018]
union
select * from hotel_data.dbo.[2019]
union
select * from hotel_data.dbo.[2020])


-- joinig the other two tables dbo.market_segment$ and dbo.meal_cost$ with the above hotels table

select * from hotel_data.dbo.market_segment$

select * from hotel_data.dbo.meal_cost$


select * from hotels 
left join hotel_data.dbo.market_segment$
on hotels.market_segment=hotel_data.dbo.market_segment$.market_segment
left join hotel_data.dbo.meal_cost$
on hotels.meal=hotel_data.dbo.meal_cost$.meal



-- finding that is the hotel revenue is growing by year

select arrival_date_year,
hotel,
sum((stays_in_week_nights+stays_in_weekend_nights)*adr) as revenue
from hotels 
group by arrival_date_year



-- also finding a revenue by hotel type

select arrival_date_year,
hotel,
round(sum(stays_in_week_nights+stays_in_weekend_nights)*adr),2) as revenue
from hotels 
group by arrival_date_year,hotel