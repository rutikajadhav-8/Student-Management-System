-- Students with department
create view StudentDepartmentView
as
select s.StudentID, s.StudentName, d.DepartmentName
from Students s
join Departments d
on s.DepartmentID = d.DepartmentID;

-- students with marks report
create view StudentMarksView
as
select s.StudentName, e.SubjectName, e.Marks
from Students s
join Examinations e
on e.StudentID = s.StudentID;

-- course enrollment report
create view CourseEnrollmentView
as
select c.CourseName, s.StudentName, d.DepartmentName
from Courses c
join Enrollment e
on c.CourseID = e.CourseID
join Students s 
on s.StudentID = e.StudentID
join Departments d
on d.DepartmentID = s.DepartmentID;

select * from CourseEnrollmentView;