--Retirment Titles (Deliverable 1)
Select e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO retirment_titles
FROM employees as e 
LEFT JOIN titles as ti 
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;
