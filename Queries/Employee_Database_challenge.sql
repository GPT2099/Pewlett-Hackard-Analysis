--Retirment Titles (Deliverable 1)
Select e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO retirment_titles
FROM employees as e 
LEFT JOIN titles as ti 
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (ri.emp_no) ri.emp_no, ri.first_name, ri.last_name, ri.title
INTO unique_titles
FROM retirment_titles as ri 
ORDER BY ri.emp_no, ri.to_date DESC;

--Sort and Group BY retiring titles (Deliverable 1)
SELECT COUNT(u.title), u.title
INTO retiring_titles
FROM unique_titles as u  
GROUP BY u.title
ORDER BY count DESC

--Mentorship Eligibility (Deliverable 2)
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibility 
FROM employees as e
INNER JOIN dept_employees as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti 
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND de.to_date = '9999-01-01'
ORDER BY e.emp_no

--Creating a Mentorship Titles table (Deliverable 3)
SELECT COUNT(m.title), m.title
INTO mentorship_titles
FROM mentorship_eligibility as m  
GROUP BY m.title
ORDER BY count DESC


--Mentorship by departments (Deliverable 3)
SELECT COUNT (de.dept_name), de.dept_name
INTO mentorship_by_department
FROM dept_employees as d, mentorship_eligibility as m, departments as de
WHERE d.emp_no = m.emp_no and d.dept_no = de.dept_no
GROUP BY de.dept_name
ORDER BY count DESC


