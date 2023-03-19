/*
Inner Joins , /Full/Left/Right Outer joins
*/

Select*
From SQL_Turtorial.dbo.EmpolyeeDemographics

Select *
From SQL_Turtorial.dbo.EmployeeSalary

----------------------------Combines the Empoylee IDs that overlap between both tables
Select *
From SQL_Turtorial.dbo.EmpolyeeDemographics
Inner Join SQL_Turtorial.dbo.EmployeeSalary
	ON EmpolyeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select *
From SQL_Turtorial.dbo.EmpolyeeDemographics
Full Outer Join SQL_Turtorial.dbo.EmployeeSalary
	ON EmpolyeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select *
From SQL_Turtorial.dbo.EmpolyeeDemographics
Left Outer Join SQL_Turtorial.dbo.EmployeeSalary
	ON EmpolyeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-----------------------------Provides Overlapping inforamtion with Employee ID from EmployeeDemographics table

Select EmpolyeeDemographics.EmployeeID,Firstname, Lastnmae, JobTitle, Salary
From SQL_Turtorial.dbo.EmpolyeeDemographics
Inner Join SQL_Turtorial.dbo.EmployeeSalary
	ON EmpolyeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-----------------------------------------Shows higest paid employee that isn't Michael
Select *
From SQL_Turtorial.dbo.EmpolyeeDemographics
Inner Join SQL_Turtorial.dbo.EmployeeSalary
	ON EmpolyeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Where Firstname <> 'Michael'
Order by Salary DESC

-------------------------------------Provides Average Salary of a Salesman
Select JobTitle, AVG(Salary) AS Average_Salary
From SQL_Turtorial.dbo.EmpolyeeDemographics
Inner Join SQL_Turtorial.dbo.EmployeeSalary
	ON EmpolyeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Where JobTitle = 'Salesman'
Group By JobTitle

/*
Case Statement
*/
-----------------------------Shows CASE staement of age over 30 being old and anything under is young
Select FirstName, Lastnmae, Age,
Case
	WHEN age > 30 Then 'Old'
	ELSE 'Young'
END
From SQL_Turtorial.dbo.EmpolyeeDemographics
Where age is not null
Order by age

-------------------------------------Shows Salary and the raise they get in respect to their job title

Select Firstname, Lastnmae, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary *.05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary *.000001)
	ELSE Salary + (Salary * .03)
END AS Salary_After_Raise
From SQL_Turtorial.dbo.EmpolyeeDemographics
JOIN SQL_Turtorial.dbo.EmployeeSalary
	On EmpolyeeDemographics.EmployeeID = EmployeeSalary.EmployeeID



/*
Having Clause
*/

---------------------------Provides Job count of jobs that have more than one employee
Select JobTitle, COUNT(JobTitle)
FROM SQL_Turtorial.dbo.EmpolyeeDemographics
JOIN SQL_Turtorial.dbo.EmployeeSalary
	ON EmpolyeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

------------------Groups job title by average salary
Select JobTitle, AVG(Salary) AS Average_Salary
FROM SQL_Turtorial.dbo.EmpolyeeDemographics
JOIN SQL_Turtorial.dbo.EmployeeSalary
	ON EmpolyeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Group by JobTitle
HAVING AVG(Salary) > 45000 
Order BY AVG(Salary)

/*
Updating/deleting data
*/

Select *
From SQL_Turtorial.dbo.EmpolyeeDemographics

Update SQL_Turtorial.dbo.EmpolyeeDemographics
SET EmployeeID = 1012
WHERE Firstname = 'Toby' AND Lastnmae = 'Flenderson'

DELETE FROM SQL_Turtorial.dbo.EmpolyeeDemographics
WHERE EmployeeID = 1006


/*
Aliasing
*/

--------------------------Combines columns together to create a full name
Select FirstName + ' ' + Lastnmae AS Full_Name
From SQL_Turtorial.dbo.EmpolyeeDemographics

------------------Provides average age at the office

Select AVG(age) AS Average_age
From SQL_Turtorial.dbo.EmpolyeeDemographics

/*
Partition By
*/
----------------------------Allows us to isolate the COUNT GENDER to perform a function and add other columns 
SELECT Firstname, Lastnmae, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) as Total_Gender
FROM SQL_Turtorial..EmpolyeeDemographics dem
JOIN SQL_Turtorial..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID


