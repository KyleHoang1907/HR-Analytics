# HR-Analytics
Analyze data about employees to encourage healthy lifestyles, Use SQL Server to query and analyze databases. Then use the data visualization tool PowerBI to create a table to help HR understand the situation of employees absent from the workplace.

## Introduction  
![HR introduction](https://github.com/KyleHoang1907/HR-Analytics/assets/149188377/2f68f32c-485b-4876-9f05-3c93bcf2695a)

## Summary
 ### 1. To find the list of healthy employees
Set query as below:
select * from Absenteeism_at_work where Social_drinker = 0 and Social_smoker = 0 and Body_mass_index < 25 and Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work) Or
select id,Social_drinker,Social_smoker,Body_mass_index,Absenteeism_time_in_hours, (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work) as average from Absenteeism_at_work where Social_drinker = 0 and Social_smoker = 0 and Body_mass_index < 25 and Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work);

 Total we have 111 healthy employees eligible for healthy bonus:
 Therefore, each employees entitled for $9 USD bonus for the budget of $1000 USD

  ### 2. To find the wage increase for non smoker employees
Set query as below:
select count (*) as nonsmokers from Absenteeism_at_work where Social_smoker =0;
#### This query found out there are 686 non smoker employees eligible for insurance budget of $983,221 USD. assuming 5 working days with 8 working hour and 52 weeks, per employee entitle for an additional $0.68 wage raise per hour.
