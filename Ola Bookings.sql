create database Ola;
use Ola;

SELECT * FROM ola.bookings;

# 1. Retrieve all successful bookings:
select * from bookings where Booking_Status='Success';

-- Creating View So that we can use it later(Easy Retrival)
create view SuccessfulBookings as
select * from bookings where Booking_Status='Success';

select * from SuccessfulBookings;


# 2. Find the average ride distance for each vehicle type:
select Vehicle_Type, avg(Ride_Distance) as Avg_Distance from bookings group by Vehicle_Type;

-- View
create view average_ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as Avg_Distance from bookings group by Vehicle_Type;

select * from average_ride_distance_for_each_vehicle;


# 3. Get the total number of cancelled rides by customers:
select count(*) as cancelled_by_customers from bookings where Booking_Status='Canceled by Customer';

-- View
create view cancelled_rides_by_customer as
select count(*) as cancelled_by_customers from bookings where Booking_Status='Canceled by Customer';

select * from cancelled_rides_by_customer;


# 4. List the top 5 customers who booked the highest number of rides:
select Customer_ID, count(Booking_ID) as total_rides from bookings group by Customer_ID order by total_rides desc limit 5;

-- View
create view top_5_customers as
select Customer_ID, count(Booking_ID) as total_rides from bookings group by Customer_ID order by total_rides desc limit 5;

select * from top_5_customers;


# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*) as cancelled_by_drivers_due_to_personal_and_car_related from bookings where Canceled_Rides_by_Driver='Personal & Car related issue';

-- View
create view cancelled_by_dri_due_to_per_and_car as 
select count(*) as cancelled_by_drivers_due_to_personal_and_car_related from bookings where Canceled_Rides_by_Driver='Personal & Car related issue';

select * from cancelled_by_dri_due_to_per_and_car;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(Driver_Ratings) as Max_Rating,min(Driver_Ratings) as Min_Rating from bookings where Vehicle_Type="Prime Sedan";

-- View
create view Max_Min_Rating_Prime_Sedan as
select max(Driver_Ratings) as Max_Rating,min(Driver_Ratings) as Min_Rating from bookings where Vehicle_Type="Prime Sedan";

select * from Max_Min_Rating_Prime_Sedan;


# 7. Retrieve all rides where payment was made using UPI:
select * from bookings where Payment_Method="UPI";

-- View
create view Payment_UPI as
select * from bookings where Payment_Method="UPI";

select * from Payment_UPI;


# 8. Find the average customer rating per vehicle type:
select Vehicle_Type, avg(Customer_Rating) as Avg_Customer_Rating from bookings group by Vehicle_Type;

-- View
create view average_customer_rating_per_vehicle_type as
select Vehicle_Type, avg(Customer_Rating) as Avg_Customer_Rating from bookings group by Vehicle_Type;

select * from average_customer_rating_per_vehicle_type;


# 9. Calculate the total booking value of rides completed successfully:
select sum(Booking_Value) as total_successful_value from bookings where Booking_Status="Success";

-- View
create view total_successful_booking_value as
select sum(Booking_Value) as total_successful_value from bookings where Booking_Status="Success";

select * from total_successful_booking_value;


# 10. List all incomplete rides along with the reason:
select Booking_ID,Incomplete_Rides_Reason from bookings where Incomplete_Rides="Yes";

-- View
create view incomplete_rides_with_reason as
select Booking_ID,Incomplete_Rides_Reason from bookings where Incomplete_Rides="Yes";

select * from incomplete_rides_with_reason;


# 11. Find the most popular pickup and drop locations based on the number of rides.
-- Most Popular Pickup Locations
select Pickup_Location,count(*) as Ride_Count from bookings group by Pickup_Location order by Ride_Count Desc limit 5;

-- View
create view MostPopularPickupLocations as
select Pickup_Location,count(*) as Ride_Count from bookings group by Pickup_Location order by Ride_Count Desc limit 5;

select * from MostPopularPickupLocations;


-- Most Popular Drop Locations
select Drop_Location,count(*) as Ride_Count from bookings group by Drop_Location order by Ride_Count Desc limit 5;

-- View
create view MostPopularDropLocations as
select Drop_Location,count(*) as Ride_Count from bookings group by Drop_Location order by Ride_Count Desc limit 5;

select * from MostPopularDropLocations;


# 12. Get the percentage of successful bookings for each vehicle type.
-- just for checking
select count(Booking_ID) as Total_Bookings from bookings;
select count(*) from bookings where Booking_Status='Success';
select count(case when Booking_Status='Success' then 1 end) as Successful_Bookings from bookings; -- (GPT)

-- percentage of successful bookings for each vehicle type (By the help of GPT)
select Vehicle_Type,count(case when Booking_Status='Success' then 1 end)/count(Booking_ID)*100 as Success_Percentage  from bookings group by Vehicle_Type order by Success_Percentage desc;

-- View
create view SuccessfulBookingsPercentage as
select Vehicle_Type,count(case when Booking_Status='Success' then 1 end)/count(Booking_ID)*100 as Success_Percentage  from bookings group by Vehicle_Type order by Success_Percentage desc;

select * from SuccessfulBookingsPercentage;


# 13. Retrieve the total number of bookings made for each day of the week.
-- By the help of GPT
SELECT 
    DAYNAME(STR_TO_DATE(Date, '%Y-%m-%d')) AS Day_of_Week, 
    COUNT(*) AS Total_Bookings
FROM bookings
GROUP BY Day_of_Week
ORDER BY FIELD(Day_of_Week, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

-- View
create view TotalBookingsMadeEachDay as 
SELECT 
    DAYNAME(STR_TO_DATE(Date, '%Y-%m-%d')) AS Day_of_Week, 
    COUNT(*) AS Total_Bookings
FROM bookings
GROUP BY Day_of_Week
ORDER BY FIELD(Day_of_Week, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

select * from TotalBookingsMadeEachDay;



-- ------------------------------------ --
-- Retrieve All Answers (View)

# 1. Retrieve all successful bookings:
	select * from SuccessfulBookings;

# 2. Find the average ride distance for each vehicle type:
	select * from average_ride_distance_for_each_vehicle;

# 3. Get the total number of cancelled rides by customers:
	select * from cancelled_rides_by_customer;

# 4. List the top 5 customers who booked the highest number of rides:
	select * from top_5_customers;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
	select * from cancelled_by_dri_due_to_per_and_car;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
	select * from Max_Min_Rating_Prime_Sedan;

# 7. Retrieve all rides where payment was made using UPI:
	select * from Payment_UPI;

# 8. Find the average customer rating per vehicle type:
	select * from average_customer_rating_per_vehicle_type;

# 9. Calculate the total booking value of rides completed successfully:
	select * from total_successful_booking_value;

# 10. List all incomplete rides along with the reason:
	select * from incomplete_rides_with_reason;

# 11. Find the most popular pickup and drop locations based on the number of rides.
	-- Most Popular Pickup Locations
	select * from MostPopularPickupLocations;
	-- Most Popular Drop Locations
	select * from MostPopularDropLocations;

# 12. Get the percentage of successful bookings for each vehicle type.
	select * from SuccessfulBookingsPercentage;

# 13. Retrieve the total number of bookings made for each day of the week.
	select * from TotalBookingsMadeEachDay;

