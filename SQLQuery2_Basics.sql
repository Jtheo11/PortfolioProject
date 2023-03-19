/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmployeeID]
      ,[Firstname]
      ,[Lastnmae]
      ,[age]
      ,[Gender]
  FROM [SQL_Turtorial].[dbo].[EmpolyeeDemographics]


  ---------------- Shows Average Salary
  select AVG(Salary)
  From EmployeeSalary

  -------------------Shows Max Salary
  select MAX(Salary)
  From EmployeeSalary

  -----------------------Shows Min Salary

  Select Min(Salary)
  From EmployeeSalary
  
  -----------------------Provides IDs only once
  select Distinct(EmployeeID)
  From EmpolyeeDemographics

  Select *
  From SQL_Turtorial.dbo.EmployeeSalary

  -------------------------Shows table without Jim
  Select *
  From EmpolyeeDemographics
  Where Firstname <> 'Jim'

  --------------------------Displays anyone who's 32 or younger and is a male
  Select *
  From EmpolyeeDemographics
  Where age	<= 32 and Gender = 'Male'

  -------------------Shows anyones Lastname that starts with an S (Wildcard Statement)
  Select *
  From EmpolyeeDemographics
  Where Lastnmae LIKE 'S%'

  -------------------Shows anyones firstname with an I in it
  Select *
  From EmpolyeeDemographics
  Where Firstname LIKE '%i%'

  ---------------------- Shows following firstnames
  Select *
  From EmpolyeeDemographics
  Where Firstname In ('Jim', 'Michael','Pam') 


---------------------------------Provides number of Genders
  Select Gender, COUNT(Gender) AS NumberofGenders
  From EmpolyeeDemographics
  Group by Gender

  ---------------------Provides gender and age of an Employee
  Select Gender, age 
  From EmpolyeeDemographics
  Group by Gender, age


  ---------------------Provides count of gender in largest to smallest order
  Select Gender, COUNT(Gender) AS CountGender
  From EmpolyeeDemographics
  Group by Gender
  Order by CountGender DESC

  ----------------------Provides first 4 rows in desc order
  Select *
  From EmpolyeeDemographics
  Order BY 4 DESC
