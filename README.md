# Hospitality-Analysis-Projects

*About Excel Dashboard

I started with different datasets – booking transactions, aggregated booking details, hotel information, room categories, and dates. 
I cleaned the data, standardized formats, and connected all the tables using common fields like property ID, room type, and check-in date. 
Next, I defined key metrics such as occupancy rate, revenue generated versus realized, booking status, and customer ratings. 
These KPIs helped me measure both financial and operational performance. Then, I built pivot tables and pivot charts, and added slicers so users can filter by city, hotel type, booking platform, or time period. Finally, I combined everything into a single interactive dashboard. This dashboard helps us quickly identify which hotels and cities generate the most revenue, how occupancy changes between weekdays and weekends, the impact of cancellations, and how customer ratings link to business performance.
In short, this project turns raw booking data into actionable insights for better decision-making.

*Strengths
Comprehensive KPI Tracking – Captures key metrics like Total Revenue, Profit, 
Occupancy Rate, Cancellation Rate, and Growth Rate in one view.

Trend & Comparative Analysis – Shows revenue growth, occupancy vs. capacity, and 
cancellation impact over time.

Segmentation Insights – Breaks down performance by city, hotel, room class, and booking type
 for deeper analysis.

User-Friendly Visualization – Interactive pivot charts and graphs make data easy to
 understand for decision-makers.

Actionable Insights – Supports management in identifying high-performing properties,
 optimizing resources, and improving profitability.

*Key Points

Tracks Total Revenue, Profit, Occupancy, and Growth Rate effectively.

Provides trend analysis for bookings, revenue, and cancellations.

Breaks down data by city, hotel, and room class for insights.

Uses interactive visuals for quick and clear decision-making.

Helps managers take actionable steps to boost efficiency and profit.

*About PowerBI Dashboard

The top KPIs show Total Revenue ₹536.85M, Occupancy Rate 57.6%, RevPAR ₹6.25K, 
and ADR ₹11.32K.

Cancellation Rate is 24.9%, No Show Bookings are 2,387 with a 5% No Show Rate, 
and Realization Rate is 70.04%.

Average Guest Rating is 3.6, reflecting overall customer satisfaction.

These KPIs help quickly assess financial performance, room utilization, and service quality.

On the left, a tree map shows bookings by platform; MakeYourTrip leads, helping identify 
effective channels.

On the right, a combo chart shows weekly revenue and week-over-week % change, 
highlighting trends and seasonal patterns.

Note:

 Button slicers have sync limitations in Power BI; using traditional slicers or bookmarks 
can help maintain interactivity.

8. Top left line chart tracks weekly ADR and RevPAR, showing pricing vs. revenue efficiency.
9. Key metrics: Daily Utilized Rooms 361, Daily Sellable Rooms 934, Daily Booked Rooms 515 – for capacity and booking insights.
10. Filters allow month selection and room category (Elite, Premium, Presidential, Standard).
11. Bottom left pie chart shows city-wise revenue: Mumbai 41.5%, followed by Bangalore, Delhi,
 and Hyderabad.
12. Bottom right area chart displays weekly occupancy trends, fluctuating between 50%–63%.
13. These visuals highlight peak weeks, seasonal dips, and city-level revenue contribution. 
14. Room-level filters provide detailed insights by category.
15. Together, both pages give a complete view of financial, operational, and customer performance.
16. Managers can track bookings, revenue efficiency, occupancy, and customer satisfaction easily.
17. The dashboard supports informed decisions on pricing, marketing spend, and operational improvements.

*Strengths
Real-time analytics with dynamic filters
- KPI cards for quick tracking (Revenue, Profit, Growth)
- Strong integration with other business apps
- Drill-through for property-level analysis
- Suitable for management reporting

*Key Points
Tracks Total Revenue, Profit, Occupancy, and Growth Rate effectively.

Provides trend analysis for bookings, revenue, and cancellations.

Breaks down data by city, hotel, and room class for insights.

Uses interactive visuals for quick and clear decision-making.

Helps managers take actionable steps to boost efficiency and profit.

*About Tableau Dashboard

Let me quickly walk you through how I built this Hospitality Analytics Dashboard in Tableau
This dashboard gives us a clear overview of the hospitality business performance across key metrics.
First, I started with different datasets – booking transactions, aggregated booking details, hotel information, room categories, and dates. 
I cleaned the data, standardized formats, and connected all the tables using common fields like property ID, room type, and check-in date.
At the top, we see the main KPIs — total revenue of ₹2 billion, 135,000 bookings, a cancellation rate of 24.78%, and an occupancy rate of around 57.87%. 
It also shows the total utilized capacity, which is over 232,000 room nights.
On the left, we have Revenue by Room Class — Elite rooms generate the highest revenue, followed by Premium and Presidential. 
This shows that higher-end rooms are our most profitable.
Next, we look at Revenue by Platform — most revenue is coming from third-party platforms like MakeMyTrip, Log Trip, and others. 
This highlights our dependency on online travel agencies.
On the right, the Total Booking by City chart shows Mumbai, Hyderabad, and Bangalore as our top-performing cities.
Below, we have Revenue by Day Type, where weekdays clearly outperform weekends. This likely reflects strong demand from business travelers.
The Weekly Trend line shows revenue performance over time, peaking around Week 27 and dropping afterward — which could suggest seasonality or data delay.
Finally, we can also view booking status distribution, helping us track how many bookings were canceled, no-shows, or checked in.
Overall, his dashboard helps us quickly identify which hotels and cities generate the most revenue, how occupancy changes between weekdays and weekends, the impact of cancellations, and how customer ratings link to business performance.
In short, this project turns raw booking data into actionable insights for better decision-making.”

*Strengths

Interactive Visualization – Filters, drilldowns, and slicers allow dynamic exploration of data.

Geographical Insights – City-wise and state-wise heatmaps highlight top-performing locations.

Category & Class Analysis – Breaks revenue by room class, booking type, and property category.

Time-Based Trends – Weekday vs. weekend revenue and booking comparisons.

*SQL Summary

SQL forms the backbone of the Hospitality Analytics project by extracting and structuring raw data into meaningful KPIs. 
It enables analysis of revenue, occupancy, cancellations, and trends across cities and room classes. 
These queries ensure accurate, reliable, and scalable insights, which are further visualized in Excel, Tableau, and Power BI for business decision-making.

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


















