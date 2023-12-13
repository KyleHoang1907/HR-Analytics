--create a join table 
Select * 
From Absenteeism_at_work as a
Left join compensation as b
On a.ID = b.ID
Left join Reasons as r
On a.Reason_for_absence = r.Number;

--find the healthiest employees for the bonus
Select * 
From Absenteeism_at_work
Where Social_drinker = 0 
  and Social_smoker = 0 
  and Body_mass_index < 25 
  and Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)

--compensation rate increase for non-smokers/ budget $983,221 so $0.68 increase per hour/ $1,414.4 per year
select count(*) as non_smokers 
From Absenteeism_at_work
where Social_smoker = 0
  
--optimze this query 
Select a.ID, 
       r.Reason,
       Month_of_absence,
       Body_mass_index,
CASE when Body_mass_index < 18.5 then 'Underweight'
     when Body_mass_index between 18.5 and 25 then 'Healthy weight'
     when Body_mass_index between 25 and 30 then 'Overweight'
     when Body_mass_index > 18.5 then 'Obese'
     ELSE 'Unknow' end as BMI_Category,
CASE when Month_of_absence IN (12,1,2) Then 'Winter'
     when Month_of_absence IN (3,4,5) Then 'Spring'
     when Month_of_absence IN (6,7,8) Then 'Summer'
     when Month_of_absence IN (9,10,11) Then 'Fall'
     ELSE 'Unknow' END as Season_Names,
	Month_of_absence,
	Day_of_the_week,
	Transportation_expense,
	Education,
	Son,
	Social_drinker,
	Social_smoker,
	Pet,
	Disciplinary_failure,
	Age,
	Work_load_Average_day,
	Absenteeism_time_in_hours
From Absenteeism_at_work as a
Left join compensation as b
On a.ID = b.ID
Left join Reasons as r
On a.Reason_for_absence = r.Number;