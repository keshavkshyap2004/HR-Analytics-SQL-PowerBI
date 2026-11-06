CREATE DATABASE hr_analytics;
USE hr_analytics;

-- 1. Total employees
SELECT COUNT(*) AS total_employees
FROM hr;

-- 2. Total employees who left
SELECT COUNT(*) AS attrition_count
FROM hr
WHERE Attrition = 'Yes';

-- 3. Overall attrition rate
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS attrition_count,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr;

-- 4. Attrition by department
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY Department
ORDER BY attrition_rate_percentage DESC;

-- 5. Active Employees

SELECT COUNT(*) AS Active_Employees
FROM hr
WHERE Attrition = 'No';

-- 6. Job Role-wise Attrition

SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left
FROM hr
GROUP BY JobRole
ORDER BY Employees_Left DESC;

-- 7. Average Monthly Salary

SELECT
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income

-- 8: Employee Distribution by Gender

SELECT
      Gender,COUNT(*) AS Total_Employees
FROM hr  
GROUP BY Gender;

-- 9: Attrition by Gender

SELECT Gender,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY Gender;

-- 10: Attrition by Age Group

SELECT AgeGroup,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY AgeGroup;

-- 11: Attrition by Overtime

SELECT OverTime,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY OverTime;

-- 12: Attrition by Job Satisfaction

SELECT JobSatisfaction,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction ASC;

-- 13: Attrition by Business Travel
SELECT BusinessTravel,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY BusinessTravel
ORDER BY attrition_rate_percentage DESC;

-- 14: Attrition by Department and Gender
SELECT Department,Gender,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY Department,Gender
ORDER BY attrition_rate_percentage DESC;

-- 15: Find the Top 5 Job Roles by Attrition Rate

SELECT JobRole,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY JobRole
ORDER BY attrition_rate_percentage DESC
LIMIT 5;

-- 16: Attrition by Salary Slab

SELECT SalarySlab,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY SalarySlab
ORDER BY attrition_rate_percentage DESC;

-- 17: Attrition by Years at Company

SELECT YearsAtCompany,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany  DESC;

-- 18: Attrition by Number of Companies Worked

SELECT NumCompaniesWorked,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY NumCompaniesWorked
ORDER BY NumCompaniesWorked  DESC;

-- 19: Attrition by Years in Current Role

SELECT YearsInCurrentRole,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY YearsInCurrentRole
ORDER BY YearsInCurrentRole  DESC;

-- 20: Attrition by Job Involvement

SELECT JobInvolvement,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY JobInvolvement
ORDER BY JobInvolvement ASC;

-- 21: Attrition by Work-Life Balance

SELECT WorkLifeBalance,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance ASC;

-- 22: Attrition by Years Since Last Promotion

SELECT YearsSinceLastPromotion,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion ASC;

-- 23: : Attrition by Job Level

SELECT JobLevel,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY JobLevel
ORDER BY JobLevel ASC;

-- 24:: Attrition by Performance RatinG

 SELECT PerformanceRating,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY PerformanceRating
ORDER BY PerformanceRating ASC;

-- 25: Attrition by Marital Status

 SELECT MaritalStatus,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY MaritalStatus
ORDER BY attrition_rate_percentage DESC;

-- 26: Advanced SQL — Department Attrition Using a Subquery

SELECT Department,COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,
	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate_percentage
FROM hr
GROUP BY Department
HAVING  attrition_rate_percentage > (SELECT 	ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    )
FROM hr)
ORDER BY attrition_rate_percentage DESC;

-- 27: Rank Departments Using a Window Function
WITH DepartmentAttrition AS (
    SELECT
        Department,
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
            AS Employees_Left
    FROM hr
    GROUP BY Department
)
SELECT
    Department,
    Employees_Left,
    RANK() OVER (ORDER BY Employees_Left DESC) AS Department_Rank
FROM DepartmentAttrition;

-- 28: Find Each Department's Share of Total Attrition

WITH DepartmentAttrition AS (
    SELECT
        Department,
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) AS Employees_Left
    FROM hr
    GROUP BY Department
)
SELECT
    Department,
    Employees_Left,
    ROUND(
        100.0 * Employees_Left /
        NULLIF(SUM(Employees_Left) OVER (), 0),
        2
    ) AS Percentage_of_Total_Attrition
FROM DepartmentAttrition
ORDER BY Percentage_of_Total_Attrition DESC;

-- 29:Find Employees Earning Above Their Department's Average

SELECT
    e.EmployeeNumber,
    e.Department,
    e.MonthlyIncome
FROM hr AS e
WHERE e.MonthlyIncome > (
    SELECT AVG(d.MonthlyIncome)
    FROM hr AS d
    WHERE d.Department = e.Department
)
ORDER BY
    e.Department ASC,
    e.MonthlyIncome DESC;
    
    
-- 30 Find the top 5 job roles with the highest attrition rates.


SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS Employees_Left,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS Attrition_Rate_Percentage
FROM hr
GROUP BY JobRole
ORDER BY Attrition_Rate_Percentage DESC
LIMIT 5;