With hotels AS(
SELECT * FROM Hotel_Booking.`2018`
UNION
SELECT * FROM Hotel_Booking.`2019`
UNION
SELECT * FROM Hotel_Booking.`2020`)

# Calculate yearly total revenue for Resort Hotel & City Hotel respectively

SELECT 
    arrival_date_year,
    hotel,
    ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr),2) AS revenue
FROM hotels
GROUP BY arrival_date_year,hotel;

# Join tables together to extend discount and meal information for further visualization in PowerBI
SELECT 
    *
FROM hotels h
LEFT JOIN Hotel_Booking.market_segment m
ON h.market_segment = m.market_segment
LEFT JOIN Hotel_Booking.meal_cost c 
ON h.meal = c.meal;
