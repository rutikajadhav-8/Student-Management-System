-- student with department name
select s.StudentName, d.DepartmentName
from Students s
join Departments d
on s.DepartmentID = d.DepartmentID;

-- Students and their courses
select s.StudentName, c.CourseName
from Students s
join Enrollment e
on e.StudentID = s.StudentID
join Courses c
on e.CourseID = c. CourseID;

-- number of courses per student
select s.StudentName, count(e.CourseID) as Total_Courses
from Students s
join Enrollment e
on e.StudentID = s.StudentID
group by s.StudentName;

-- average marks per student
select s.StudentName, avg(e.Marks) as AverageMarks
from Students s
join Examinations e
on s.StudentID = e.StudentID
group by s.StudentName;

-- top performing student
select top 1
s.StudentName, avg(e.Marks) as AverageMarks
from Students s
join Examinations e
on e.StudentID = s.StudentID
group by s.StudentName
order by AverageMarks desc;

-- attendance percentage
select StudentID, 
     100.0 * sum(case when Status = 'Present'
     then 1 else 0 end) / count(*) as AttendancePercentage
from Attendance
group by StudentID;

-- department wise student count
select d.DepartmentName, count(s.StudentID) as TotalStudents
from Departments d
join Students s
on d.DepartmentID = s.DepartmentID
group by d.DepartmentName;

-- students with marks above 80
select s.StudentName,e.SubjectName, e.Marks
from Students s
join Examinations e
on s.StudentID = e.StudentID
where e.Marks > 80;

-- course enrollment count
select c.CourseName, count(e.StudentID) as TotalStudents
from Courses c
join Enrollment e
on c.CourseID = e.CourseID
group by c.CourseName;

-- highest marks obtained
select StudentID, SubjectName, Marks
from Examinations
where Marks = (
   select max(Marks) from Examinations
 );

-- students in computer science
select s.StudentName, d.DepartmentName
from Students s
join Departments d
on s.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Computer Science';

-- students enrolled in DBMS
select s.StudentName, c.CourseName
from Students s
join Enrollment e
on e.StudentID = s.StudentID
join Courses c
on c.CourseID = e.CourseID
where c.CourseName = 'Database Management System';

-- student enrolled in maximum number of courses
select top 1
s.StudentName, count(e.CourseID) as MaxCourses
from Students s
join Enrollment e
on s.StudentID = e.StudentID
group by s.StudentName
order by MaxCourses desc;

-- department having more than 1 student
select d.DepartmentName , count(s.StudentID) as TotalStudents
from Departments d
join Students s
on s.DepartmentID = d.DepartmentID
group by d.DepartmentName
having count(s.StudentID) > 1;

-- subjects where average marks are greater than 80
select SubjectName, avg(Marks) as AverageMarks
from Examinations
group by SubjectName
having avg(Marks) > 80;

-- final student academic Report 
select s.StudentID, s.StudentName, d.DepartmentName, e.SubjectName, e.Marks,
    dbo.CalculateGrade(e.Marks) as Grade,
    dbo.GetAverageMarks(s.StudentID) as AverageMarks
from Students s
join Departments d
on d.DepartmentID = s.DepartmentID
join Examinations e
on e.StudentID = s.StudentID
order by s.StudentName;

-- department summary report
select d.DepartmentName,
     count(distinct s.StudentID) as TotalStudents,
     avg(e.Marks) as DepartmentAverageMarks
from Departments d
join Students s
on s.DepartmentID = d.DepartmentID
join Examinations e
on e.StudentID = s.StudentID
group by d.DepartmentName
order by DepartmentAverageMarks desc;
