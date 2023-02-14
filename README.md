# Hotel-Booking-Analysis-PowerBI

Link of Dataset: https://absentdata.com/hotel_revenue_historical_full/

Period of time: 2018-2020

DataSet: Hotel Booking Information Analysis

Stakeholders' three questions to answer:

1. "Is our hotel's revenue growing by year?"  -- Segement revenue by 2 types of hotel
2. "Should we increase our parking lot size?" -- Trend that customer get here with personal cars
3. "What trends can we see in the data?"  -- Focus on average daily rate and guests to explore seasonality

Data Preparation in MySQL:

Join 2018,2019,2020 tables together and left join market_segment & meal_cost tables to gather all information for further visualization in PowerBI

’‘’
With hotels AS(
SELECT * FROM Hotel_Booking.`2018`
UNION
SELECT * FROM Hotel_Booking.`2019`
UNION
SELECT * FROM Hotel_Booking.`2020`)

SELECT 
    *
FROM hotels h
LEFT JOIN Hotel_Booking.market_segment m
ON h.market_segment = m.market_segment
LEFT JOIN Hotel_Booking.meal_cost c 
ON h.meal = c.meal;
‘’‘


Data Transformation in Power Query:

Add New Column "Revenue" : ([stays_in_week_nights]+[stays_in_weekend_nights])*[adr]*(1-[discount])

Visulization of Dataset:

New New Measure: Parking Percentage = SUM([required_car_parking_spaces])/[Total_Nights]

Summary Sheet:

           breakout revenue by hotel types,date,car park
           
           hotel revenue growing from 2018 to 2019 but falls in 2020,city hotels generate a bit higher revenue

           resort hotel has steady 3% of customers use parking spaces which is  doubling than city hotel, but no significance evidence to verify relationship between parking lot size and the number of customers
           
           The revenue of both types of hotels grows rapidly during July to September on yearly basis
           
           charts using (Card,Line Chart,Doghnut)

