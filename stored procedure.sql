-- get student marks
create procedure GetStudentMarks
   @StudentID int
as
begin
   select SubjectName, Marks
   from Examinations
   where StudentID = @StudentID;
end;

-- get students by department
create procedure GetStudentsByDepartment
   @DepartmentID int
as
begin
  select * 
  from Students 
  where DepartmentID = @DepartmentID
end;

-- student attendance report
create procedure GetStudentAttendance
   @StudentID int
as
begin
  select s.StudentName, a.AttendanceDate, a.Status
  from Students s
  join Attendance a
  on s.StudentID = a.StudentID
  where a.StudentID = @StudentID
end;

-- get Students by Department name
create procedure GetDepartmentStudents
   @DepartmentName varchar(50)
as
begin
  select s.StudentName
  from Students s
  join Departments d
  on d.DepartmentID = s.DepartmentID
  where d.DepartmentName = @DepartmentName
end;




