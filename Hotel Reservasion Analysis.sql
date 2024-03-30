create database hotal;
select * from `hotel reservation dataset`;

###QUESTION#####

#1. What is the total number of reservations in the dataset?
select count(distinct(Booking_ID)) as total_number_of_reservations from `hotel reservation dataset`;

#2. Which meal plan is the most popular among guests?
select * from `hotel reservation dataset`;
select type_of_meal_plan,count(type_of_meal_plan) as meal_plan from `hotel reservation dataset` 
group by type_of_meal_plan order by meal_plan desc  limit 1;

#3. What is the average price per room for reservations involving children?
select round(avg(avg_price_per_room),3) avg_price from `hotel reservation dataset` where no_of_children>0; 

#4. How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT COUNT(*) AS Total_Reservations FROM `hotel reservation dataset`
WHERE YEAR(arrival_date) = 2018;

#5. What is the most commonly booked room type?
select * from `hotel reservation dataset`;
select room_type_reserved,count(room_type_reserved) as count_most_booked_room from `hotel reservation dataset` 
group by room_type_reserved order by count_most_booked_room desc limit 1;

#6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select * from `hotel reservation dataset`;
select count(*) weekend_reservation from `hotel reservation dataset` where no_of_weekend_nights>0;

#7. What is the highest and lowest lead time for reservations?
select max(lead_time) as  max_lead from `hotel reservation dataset`;
select min(lead_time) as  min_lead from `hotel reservation dataset`;
select max(lead_time) as  max_lead,min(lead_time) as  min_lead from `hotel reservation dataset`;

#8. What is the most common market segment type for reservations?
select * from `hotel reservation dataset`;
select market_segment_type,count(*) as most_comman_segment from `hotel reservation dataset` 
group by market_segment_type order by most_comman_segment desc limit 1;

#9. How many reservations have a booking status of "Confirmed"?
select * from `hotel reservation dataset`;
select distinct(booking_status) from `hotel reservation dataset`;
select booking_status,count(*) as confiremed_booking_status from `hotel reservation dataset` where booking_status="not_canceled";

#10. What is the total number of adults and children across all reservations?
select * from `hotel reservation dataset`;
select sum(no_of_adults) as total_no_adults,sum(no_of_children) as total_no_childern from `hotel reservation dataset`;

#11. What is the average number of weekend nights for reservations involving children?
select no_of_children,avg(no_of_weekend_nights) as avg_weekned from `hotel reservation dataset` 
where no_of_children > 0 group by no_of_children ;

#13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved,avg(no_of_weekend_nights) as avg_weekend,avg(no_of_week_nights) as avg_weekday from `hotel reservation dataset` 
group by room_type_reserved order by room_type_reserved asc;

#14. For reservations involving children, what is the most common room type, and what is the average  price for that room type?
select * from `hotel reservation dataset` where room_type_reserved="room_type 7" and no_of_children > 0;
select room_type_reserved,count(room_type_reserved),avg(avg_price_per_room) as no_of_counts
from `hotel reservation dataset` where no_of_children > 0 group by room_type_reserved order by room_type_reserved desc ;

#15. Find the market segment type that generates the highest average price per room
select market_segment_type,avg(avg_price_per_room) as avg_price from `hotel reservation dataset`
group by market_segment_type order by avg_price desc limit 1 ;
