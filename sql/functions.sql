-- =====================================================
-- Employee Salary Analytics - Analysis Queries
-- =====================================================

-- 1. Total headcount
SELECT COUNT(*) AS total_employees
FROM employees;

-- 2. Total payroll aur average salary
SELECT
    SUM(annual_salary_usd) AS total_payroll,
    ROUND(AVG(annual_salary_usd), 2) AS avg_salary
FROM employees;

-- 3. Department ke hisaab se headcount
SELECT d.department_name, COUNT(*) AS headcount
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.department_name
ORDER BY headcount DESC;

-- 4. Department ke hisaab se total payroll
SELECT d.department_name,
       SUM(e.annual_salary_usd) AS total_payroll
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.department_name
ORDER BY total_payroll DESC;

-- 5. Country ke hisaab se headcount
SELECT l.country, COUNT(*) AS headcount
FROM employees e
JOIN locations l ON e.loc_id = l.loc_id
GROUP BY l.country
ORDER BY headcount DESC;

-- 6. Salary band ke hisaab se headcount (function use karke)
SELECT get_salary_band(annual_salary_usd) AS salary_band,
       COUNT(*) AS headcount
FROM employees
GROUP BY salary_band
ORDER BY headcount DESC;

-- 7. Har employee ki tenure (function use karke)
SELECT full_name,
       hire_date,
       get_tenure_years(hire_date) AS tenure_years
FROM employees
ORDER BY tenure_years DESC;

-- 8. Hire year ke hisaab se headcount
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year,
       COUNT(*) AS headcount
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

-- 9. Top 5 highest paid employees
SELECT full_name, annual_salary_usd
FROM employees
ORDER BY annual_salary_usd DESC
LIMIT 5;
