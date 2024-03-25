create database HR_ANALYSIS_1;
use hr_analysis_1;
desc employee_attrition1;
select * from employee_attrition1;

## ------------------------------------------- INSIGHTS FROM HR ANALYSIS ----------------------------------------------##

#1 Write an SQL Query to find the details of employees under attrition having 5+ experience in between the age group 27-35
select * from employee_attrition1 
where employee_age between 27 and 35
and totalworkingyears>5;

#2 Fetch the details of employees having maximum and minimum salary working in different departments who received less than 13% salary hike
select department,max(monthlyincome) Highest_Salary,min(monthlyincome) Lowest_Salary
from employee_attrition1
where percentsalaryhike<13
group by department
order by highest_salary desc;

#3 Calculate the average monthly income of all the employees who worked more than 3 years whose education background is medical
select avg(monthlyincome) Average_Income
from employee_attrition1 
where yearsatcompany > 3
and educationfield ="Medical"
group by educationfield;

#4 Identify the total no of male and female employees under attrition whose marital status is married and haven't received promotion in the last 5 years
select gender,count(employeeid) from employee_attrition1
where maritalstatus="married"
and yearssincelastpromotion=5
and attrition="Yes"
group by gender;

#5 Employees with max performance rating but no promotion for 4 years and above 
select * from employee_attrition1
where performanceRating =(select max(performancerating) from employee_attrition1)
and yearssincelastpromotion>=4;

#6 Who max and Min percentage salary hike
select yearsatcompany,performancerating,yearssincelastpromotion,max(percentsalaryhike),min(percentsalaryhike)
from employee_attrition1
group by yearsatcompany,performancerating,yearssincelastpromotion
order by max(percentsalaryhike) desc,min(percentsalaryhike) asc;

##7 Find Distinct Department
select distinct(department) from employee_attrition1;

#8 Employees working overtime but given min salary hike and are more than 5 years with company
select * from employee_attrition1
where overtime="yes"
and percentsalaryhike=(select min(percentsalaryhike) from employee_attrition1)
and yearsatcompany>5;

#9 Employees working overtime but given max salary hike and are less than 5 years with company
select * from employee_attrition1
where overtime="yes"
and percentsalaryhike=(select max(percentsalaryhike) from employee_attrition1)
and yearsatcompany<5;

#10 Employees are not working overtime but given max salary hike and are less than 5 years with company
select * from employee_attrition1
where overtime="No"
and percentsalaryhike=(select max(percentsalaryhike) from employee_attrition1)
and yearsatcompany<5;

#11 Employees are not working overtime but given min salary hike and are more than 5 years with company
select * from employee_attrition1
where overtime="No"
and percentsalaryhike=(select min(percentsalaryhike) from employee_attrition1)
and yearsatcompany>5;

#12 MaritalStatus wise Maximum Relationshipsatisfaction and Minimum Relationshipsatisfaction
select maritalstatus,max(relationshipsatisfaction),min(relationshipsatisfaction)
from employee_attrition1
group by maritalstatus;

#13 Findout Number of employees who joining after 2007 and that employee will be a "Developer" or "Human Resources" or "Manager"
select count(employeeid) Number_Of_Employee
from employee_attrition1
where yearofjoining >2007
and jobrole in ("Developer","Human Resources","Manager");

#14 Findout Number of Employees who are working "Software","Human Resources","Sales","support"
select count(employeeid)
from employee_attrition1
where department IN ("software","Human Resources","sales","support");

#15 Findout the Number of employee whose businessTravel is "Non-Travel" and those employee are working in "Software" Department
select count(businesstravel) ,department
from employee_attrition1
where businesstravel="Non-Travel" and department="software"
group by department;