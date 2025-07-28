drop database students;
create database students;
use students;
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    GPA DECIMAL(4,2),
    Enrollment_Date DATE,
    Enrollment_Time TIME,
    Major VARCHAR(50)
);
INSERT INTO Students (Student_ID, First_Name, Last_Name, GPA, Enrollment_Date, Enrollment_Time, Major) VALUES
(201, 'Shivansh', 'Mahajan', 8.79, '2021-09-01', '09:30:00', 'CSE'),
(202, 'Umesh', 'Sharma', 8.44, '2021-09-01', '08:30:00', 'Math'),
(203, 'Rakesh', 'Kumar', 5.6, '2021-09-01', '10:00:00', 'Biology'),
(204, 'Radha', 'Sharma', 9.2, '2021-09-01', '12:45:00', 'Chemistry'),
(205, 'Kush' , 'Kumar' , 7.85, '2021-09-01', '08:30:00', 'Physics'),
(206, 'Prem', 'Chopra', 9.56, '2021-09-01', '09:24:00', 'History'),
(207, 'Pankaj', 'Vats', 9.78, '2021-09-01', '02:30:00', 'English'),
(208, 'Navleen', 'Kaur', 7, '2021-09-01', '06:30:00', 'Math');
select * from students;

CREATE TABLE Programs (
    Student_ID INT,
    Program_Name VARCHAR(50),
    Program_Start_Date DATETIME,
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
);

INSERT INTO Programs (Student_ID, Program_Name, Program_Start_Date) VALUES
(201, 'CSE', '2021-09-01 00:00:00'),
(202, 'Math', '2021-09-01 00:00:00'),
(208, 'Math', '2021-09-01 00:00:00'),
(205, 'Physics', '2021-09-01 00:00:00'),
(204, 'Chemistry', '2021-09-01 00:00:00'),
(207, 'Psychology', '2021-09-01 00:00:00'),
(206, 'History', '2021-09-01 00:00:00'),
(203, 'Biology', '2021-09-01 00:00:00');
select * from programs;
CREATE TABLE Scholarships (
    Student_Ref_ID INT,
    Scholarship_Amount INT,
    Scholarship_Date DATETIME,
    FOREIGN KEY (Student_Ref_ID) REFERENCES Students(Student_ID)
);
INSERT INTO Scholarships (Student_Ref_ID, Scholarship_Amount, Scholarship_Date) VALUES
(201, 5000, '2021-10-15 00:00:00'),
(202, 4500, '2022-08-18 00:00:00'),
(203, 3000, '2022-01-25 00:00:00'),
(204, 4000, '2021-10-15 00:00:00');
Select * From Scholarships;
select upper(first_name) as student_name from student;
select distinct major from student;
select substring(first_name,1,3) from student;
select instr(lower(first_name),'a') from student where first_name = 'shivansh';
select distinct major,length(major) from student;
select replace(first_name,'a','A') from student;
SELECT CONCAT(first_name, ' ', last_name) AS complete_name FROM student;
select * from student order by first_name , Major desc;
select * from student where first_name in ('prem','shivansh');
select * from student where first_name not in ('prem', 'shivansh');
select * from student where first_name like '%a';
select * from student where first_name like '______a';
select * from student where GPA between 9.00 and 9.99;
select major, count(*) as total_count from student where major = 'CSE';
select concat(first_name,'',last_name) as full_name from student where GPA between 8.5 and 9.5;
select major,count(major) from student group by major order by count(major) desc;
SELECT
  student.first_name,
  student.last_name,
  scholarship.scholarship_amount,
  scholarship.scholarship_date
FROM
  student
INNER JOIN
  scholarship ON student.student_id = scholarship.student_ref_id;
  select * from student where Student_ID % 2 != 0;
   select * from student where Student_ID % 2 = 0;
select student.First_Name, student.Last_Name,
scholarship.Scholarship_Amount,
scholarship.scholarship_date from student left join
scholarship on student.Student_ID =
scholarship.Student_Ref_ID;
select * from student order by GPA DESC limit 5;
select * from student order by GPA DESC limit 4,1;
select * 
from student s1
where 4 = (
     select count(distinct(s2.GPA))
     from student s2
     where s2.GPA >= s1.GPA
     );
select s1.*
from student s1, student s2
where s1.GPA = s2.GPA
and s1.student_id != s2.student_id;
select max(GPA) from student
where GPA not in(select max(GPA) from student);
select * from student
union all
select * from student order by student_id;
select student_id from student
where Student_ID not in (select student_ref_id from scholarship);
select * from student
limit (select floor(count(*)/2) from student);
select major, count(major) as all_major from student group by major;
select * from student where Student_ID = (select max(student_id) from student);
select * from student where Student_ID = (select min(student_id) from student);
select *
from (
    select *
    from student
    order by student_id desc
    limit 5 )
as subquery
order by Student_ID;
select distinct GPA from student s1
where 3 >= (select count(distinct GPA) from student s2 where s1.GPA <= s2.GPA)
order by s1.GPA desc;
select distinct GPA 
from student s1
where 3 >= (
select count(distinct GPA)
from student s2
where s1.GPA >= s2.GPA
)
order by s1.GPA;
select distinct GPA 
from student s1
where 3 = (
    select count(distinct GPA)
	from student s2
    where s1.GPA <= s2.GPA
)
order by s1.GPA desc;
select major,max(GPA) as MAXGPA from student group by major;
select first_name, GPA
from student
where GPA = (select max(GPA) from student);
select curdate(); -- to get the current date
select now(); -- to get the current date and time
create table clonetable as select * from student;
update student set GPA = 7.5 where major = 'CSE';
select major,avg(GPA) as average_GPA from student group by major;
select * from student order by GPA desc limit 3;
select major,count(student_id) as high_GPA_count from student
where GPA > 7.5
group by major;
select * from student 
where GPA = (
select GPA from student
where student_id = 201
);


 
					
     
  
  
  
  
  
  


