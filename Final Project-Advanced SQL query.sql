select * from [dbo].[chicago_crime]
go
select * from [dbo].[chicago_public_schools]
go
select * from [dbo].[chicago_socioeconomic_data]


<-Exercise 1: Using Joins ->
<-Question 1->

Select a.NAME_OF_SCHOOL , b.COMMUNITY_AREA_NAME 
from chicago_socioeconomic_data b , chicago_public_schools a 
where  a.COMMUNITY_AREA_NUMBER = b.COMMUNITY_AREA_NUMBER
and  b.HARDSHIP_INDEX = 98
go

<-Question 2->

Select a.CASE_NUMBER ,a.PRIMARY_TYPE, a. location_description , b.COMMUNITY_AREA_NUMBER as b_CANum, b.COMMUNITY_AREA_NAME 
from  chicago_socioeconomic_data  b ,  chicago_crime a
     where a.COMMUNITY_AREA_NUMBER = b.COMMUNITY_AREA_NUMBER and b.COMMUNITY_AREA_NUMBER is not null
and  a.LOCATION_DESCRIPTION like '%School%';
go

<- Exercise 2: Creating a View _->

<- Question 1 ->
 Create view vw_school_list as
  Select NAME_OF_SCHOOL	School_Name ,
         Safety_Icon	as Safety_Rating,
         Family_Involvement_Icon as	Family_Rating,
         Environment_Icon as 	Environment_Rating,
         Instruction_Icon	as Instruction_Rating,
         Leaders_Icon as	Leaders_Rating

from chicago_public_schools;
go
select * from vw_school_list;
go

select school_name, Leaders_Rating from vw_school_list;

<- Question 2 -->
