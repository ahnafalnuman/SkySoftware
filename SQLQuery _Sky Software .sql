-- Create the database
CREATE DATABASE SkySoftware;
GO

USE SkySoftware;
GO

-- Create Departments table
CREATE TABLE Departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    department_name NVARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
	hire_date DATE NOT NULL DEFAULT GETDATE() ,
    department_id INT FOREIGN KEY REFERENCES Departments(department_id)
    
);

-- Create Salaries table
CREATE TABLE Salaries (
    salary_id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT FOREIGN KEY REFERENCES Employees(employee_id),
    salary DECIMAL(10, 2) NOT NULL DEFAULT 500.00,
    start_date DATE NOT NULL,
    end_date DATE NULL
);


-- Insert data  into Departments
Insert  into Departments (department_name) VALUES
('Software Development'),
('Quality Assurance'),
('Project Management'),
('Human Resources'),
('Sales'),
('Finance'),
('Technical Support');

INSERT INTO Employees (first_name, last_name, department_id, hire_date) VALUES
('Ahnaf', 'Alnuman', 1, '2021-02-01'),
('Laila', 'Ahmad', 1, '2020-06-15'),
('Omar', 'Ahmad', 2, '2022-03-20'),
('Noor', 'Khalid', 2, '2021-09-05'),
('Sara', 'Ali', 3, '2019-11-12'),
('Fadi', 'Samir', 3, '2020-07-25'),
('Rana', 'Majed', 4, '2018-05-30'),
('Hani', 'Ziad', 5, '2022-01-18'),
('Aya', 'Salem', 5, '2021-04-10'),
('Khaled', 'Mahmoud', 6, '2020-08-15'),
('Amira', 'Tariq', 6, '2019-03-22'),
('Bassem', 'Adnan', 7, '2021-10-05'),
('Rami', 'Ibrahim', 7, '2020-12-01'),
('Lina', 'Fares', 1, '2023-01-10'),
('Tareq', 'Othman', 2, '2022-06-18'),
('Mona', 'Saad', 3, '2021-02-14'),
('Yara', 'Ali', 4, '2020-09-28'),
('Nour', 'Jamal', 5, '2023-03-19'),
('Sami', 'Walid', 6, '2022-11-05'),
('Leen', 'Hatem', 7, '2021-07-21');



-- Insert data into Salaries
insert into Salaries (employee_id, salary, start_date, end_date) VALUES
(1, 5500.00, '2021-02-01', NULL),
(2, 6000.00, '2020-06-15', NULL),
(3, 1800.00, '2022-03-20', NULL),
(4, 1900.00, '2021-09-05', NULL),
(5, 3000.00, '2019-11-12', NULL),
(6, 3100.00, '2020-07-25', NULL),
(7, 1500.00, '2018-05-30', NULL),
(8, 2200.00, '2022-01-18', NULL),
(9, 2300.00, '2021-04-10', NULL),
(10, 2800.00, '2020-08-15', NULL),
(11, 2700.00, '2019-03-22', NULL),
(12, 1600.00, '2021-10-05', NULL),
(13, 1700.00, '2020-12-01', NULL);

-- Q1 
select e.first_name , e.last_name ,e.hire_date ,d.department_name
from Employees e
join Departments d 
on e.department_id = d.department_id ;

--Q2
select  d.department_name,  e.first_name,  e.last_name
from Departments d
left join Employees e on d.department_id = e.department_id;

--Q3
select d.department_name, count(e.employee_id) AS "total employees"
from Departments d
join Employees e on d.department_id = e.department_id
group by d.department_name
having count (e.employee_id) > 1;

--Q4
select  d.department_name, avg (s.salary) AS average_salary
from Departments d
JOIN Employees e on d.department_id = e.department_id
JOIN Salaries s on e.employee_id = s.employee_id
group by d.department_name
having avg(s.salary) > 1000;

--Q5
select d.department_name,  count(s.employee_id) AS high_salary_count
from Departments d
join Employees e on d.department_id = e.department_id
join Salaries s on e.employee_id = s.employee_id
where s.salary > 5000
group by d.department_name
having count(s.employee_id) > 1;

--Q6 
select max(s.salary) AS highest_salary
from Salaries s;

