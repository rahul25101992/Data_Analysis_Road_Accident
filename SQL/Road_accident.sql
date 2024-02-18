create database accident;
use accident;
select * from road_accident;



#What is total number of Casualties?

select sum(number_of_casualties) cy_casualties from road_accident1;

# What is cy_casualties?
select sum(number_of_casualties) cy_casualties from road_accident1
where Year(accident_date)= 2022;

# What is cy casualties when road surface is dry?

select sum(number_of_casualties) cy_casualties from road_accident1 
where year(accident_date) = 2022 and road_surface_conditions = 'Dry' ;


# What are current Year accident?

select  count(distinct(accident_index)) cy_accident from road_accident1 ra
where year(accident_date) = 2022;

# What is cy casualties when accident severity is fatal?

select  sum(number_of_casualties) cy_casualties_fatal from road_accident1 ra 
where year(accident_date) = 2022 and accident_severity = "fatal";

# what is total cusualties when accident severity is fatal?

select sum(number_of_casualties) cy_casualties_fatal from road_accident1 ra 
where accident_severity = "fatal";

# what is total cusualties when accident severity is Serious?

select sum(number_of_casualties) casualties_serious from road_accident1 ra 
where accident_severity = 'Serious';

# what is Cy cusualties when accident severity is Serious?

select  sum(number_of_casualties) cy_casualties_serious from road_accident1 ra 
where year(accident_date) = 2022 and accident_severity = 'Serious';

# what is total cusualties when accident severity is Slight?

select sum(number_of_casualties) Total_casualties_slight from road_accident1 ra 
where accident_severity = 'Slight';

# what is Cy cusualties when accident severity is Slight?
select  sum(number_of_casualties) cy_casualties_slight from road_accident1 ra 
where year(accident_date) = 2022 and accident_severity = 'Slight';

# what is the percentage of slight casualties?

select (sum(number_of_casualties) *100)/(select sum(number_of_casualties)from road_accident1 ra) percentage_slight
from road_accident1 ra 
where accident_severity  = 'slight';

# what is the percentage of fatal casualties?

select (sum(number_of_casualties) *100)/(select sum(number_of_casualties)from road_accident1 ra) percentage_slight
from road_accident1 ra 
where accident_severity  = 'fatal';

# what is the percentage of fatal casualties?
select (sum(number_of_casualties) *100)/(select sum(number_of_casualties)from road_accident1 ra) percantage_slight
from road_accident1 ra 
where accident_severity  = 'serious';



# Current year casualties by Vehicle types
select 
		case 
			when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
			when vehicle_type in ('car','Taxi/Private hire car') then 'car'
			when vehicle_type in ('Motorcycle 125cc and under','Motorcycle over 500cc',
			'Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Pedal cycle')
			then 'Bike'
			when vehicle_type in ('Van / Goods 3.5 tonnes mgw or under','Goods over 3.5t. and under 7.5t',
			'Goods 7.5 tonnes mgw and over') then 'Van'
			when vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)')
			then 'Bus'
			else "Other"
		end as Vehicle_group,
		  sum(number_of_casualties) as cy_casualties
		from road_accident1 ra 
		where year(accident_date)= 2022
		group by 
				case
					when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
			when vehicle_type in ('car','Taxi/Private hire car') then 'car'
			when vehicle_type in ('Motorcycle 125cc and under','Motorcycle over 500cc',
			'Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Pedal cycle')
			then 'Bike'
			when vehicle_type in ('Van / Goods 3.5 tonnes mgw or under','Goods over 3.5t. and under 7.5t',
			'Goods 7.5 tonnes mgw and over') then 'Van'
			when vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)')
			then 'Bus'
			else "Other"
					end;
				
		

# Total casualties by Vehicle types

select 
		case 
			when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
			when vehicle_type in ('car','Taxi/Private hire car') then 'car'
			when vehicle_type in ('Motorcycle 125cc and under','Motorcycle over 500cc',
			'Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Pedal cycle')
			then 'Bike'
			when vehicle_type in ('Van / Goods 3.5 tonnes mgw or under','Goods over 3.5t. and under 7.5t',
			'Goods 7.5 tonnes mgw and over') then 'Van'
			when vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)')
			then 'Bus'
			else "Other"
		end as Vehicle_group,
		  sum(number_of_casualties) as Total_casualties
		from road_accident1 ra 
		group by 
				case
					when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
			when vehicle_type in ('car','Taxi/Private hire car') then 'car'
			when vehicle_type in ('Motorcycle 125cc and under','Motorcycle over 500cc',
			'Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Pedal cycle')
			then 'Bike'
			when vehicle_type in ('Van / Goods 3.5 tonnes mgw or under','Goods over 3.5t. and under 7.5t',
			'Goods 7.5 tonnes mgw and over') then 'Van'
			when vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)')
			then 'Bus'
			else "Other"
					end;

# Current year casualties monthly trend

select monthname(accident_date)  as month_name,sum(number_of_casualties) cy_casualties
from road_accident1 ra 
where year(accident_date) = 2022
group by month_name;
				
# Previous year casualties monthly trend				

select monthname(accident_date)  as month_name,sum(number_of_casualties) Py_casualties
from road_accident1 ra 
where year(accident_date) = 2021
group by month_name;

# Current year casualties by road Type

select road_type, sum(number_of_casualties) Cy_casualties from road_accident1 ra 
where year(accident_date) = 2022
group by road_type;


# find number of current year casualties by urban and rural area in percentages.

select urban_or_rural_area, round((sum(number_of_casualties)*100)/(select sum(number_of_casualties)
from road_accident1 ra 
 where year(accident_date)=2022),2) pr_urban_rural
from road_accident1 ra2 
where year(accident_date)= 2022
group by urban_or_rural_area;

# Find number of total cusualties by urban and rural area in percantages
select urban_or_rural_area,sum(number_of_casualties) total_casualties, round((sum(number_of_casualties)*100)/(select sum(number_of_casualties)
from road_accident1 ra),2) pr_urban_rural
from road_accident1 ra2 
group by urban_or_rural_area;



select * from road_accident1 ra ;

# find current year casualties by light condition in percentages
select 
		case 
			when light_conditions in ('Darkness - lights lit','Darkness - lighting unknown',
			     'Darkness - lights unlit','Darkness - no lighting') then 'Night'
			when light_conditions in ('Daylight') then 'Day'
		end as light_condition,
		sum(number_of_casualties) cy_casulties,
		round((sum(number_of_casualties)*100)/(select sum(number_of_casualties) from road_accident1 ra where year(accident_date)=2022),2) 
		 percentages_light_conditions from road_accident1 ra where year(accident_date)=2022
	group by
	case 
			when light_conditions in ('Darkness - lights lit','Darkness - lighting unknown',
			'Darkness - lights unlit','Darkness - no lighting') then 'Night'
			when light_conditions in ('Daylight') then 'Day'
		end;
	
# find top 10 locations by casualties

select local_authority, sum(number_of_casualties) total_casualties from road_accident1 ra 
group by local_authority
order by total_casualties desc limit 10;

		




