/* 1.Total Revenue*/
select sum(revenue_realized) as TotalRevenue from fact_bookings;

/* 2.Occupancy Rate*/
select (sum(successful_bookings)/sum(capacity) *100) as occupancy_rate from fact_aggregated_bookings;

/* 3. Cancellation Rate*/
select
(sum(case when booking_status="cancelled" then 1 else 0 end)/count(*))*100
as cancellation_rate
from fact_bookings;

/* 4. Total Booking*/
select count(booking_id) as Total_Bookings
from fact_bookings;

 /*5. Utilized capacity */
select sum(capacity) as UtilizeCapacity
from fact_aggregated_bookings;

/*6.Trend Analysis */
select dim_hotels.city,sum(fact_bookings.revenue_generated) as RevenueGenerated,
sum(fact_bookings.revenue_realized) as RevenueRealized
from dim_hotels join fact_bookings
on dim_hotels.property_id=fact_bookings.property_id
group by dim_hotels.city;

/*7. Weekday & Weekend Revenue and Booking */
select
dim_date.day_type,
sum(fact_bookings.revenue_realized) AS TotalRevenue,
count(fact_bookings.booking_id) AS TotalBookings
from dim_date join
fact_bookings on fact_bookings.check_in_date
group by dim_date.day_type;

/*8. Revenue by State & hotel */
select h.city,h.property_name,sum(fb.revenue_realized) as total_revenue
from dim_hotels h
join fact_bookings fb on h.property_id=fb.property_id 
group by h.city,h.property_name order by h.city,h.property_name;

/*9.Class Wise Revenue*/
select r.room_class,sum(fb.revenue_realized) as total_revenue from dim_rooms r join
fact_bookings fb on r.room_id=fb.room_category group by r.room_class;

/*10.Checked out cancel No show*/
select
booking_status, count(*) as BookingStatusCount
from fact_bookings
where booking_status in ('Checked Out', 'Cancelled', 'No Show')
group by booking_status;

/*11.REVENUE BY CATEGORY*/
select
category,
sum(revenue_generated)
 from dim_hotels
  join fact_bookings
 on dim_hotels.property_id = fact_bookings.property_id  group by category;

