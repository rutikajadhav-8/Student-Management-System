-- insert data into departments table
insert into Departments (DepartmentName) 
values 
('Computer Science'),
('Information Technology'),
('Mechanical Engineering'),
('Civil Engineering');

-- insert data into Students table
insert into Students (StudentName, Email, DepartmentID)
values
('Rahul Sharma', 'rahul@gmail.com', 2),
('Priya Patil', 'priya@gmail.com', 4),
('Ram Chopra', 'ram@gmail.com', 3),
('Vinayak Pande', 'vinayak@gmail.com', 2),
('Neha Gosavi', 'neha@gmail.com', 1);

-- insert data into courses table
insert into Courses (CourseName, Credits)
values 
('Database Management System', 4),
('Operating System', 4),
('Data Structures', 3),
('Computer Networks', 3),
('Software Engineering', 4);

-- insert data into enrollment table
insert into Enrollment(StudentID, CourseID)
values
(1,1),
(1,2),
(1,3),

(2,1),
(2,4),

(3,2),
(3,5),

(4,3),
(4,4),

(5,1);

-- insert data into  attendance table
insert into Attendance(StudentID, AttendanceDate, Status)
values
(1,'2026-10-01', 'Present'),
(1,'2026-10-02', 'Present'),
(1,'2026-10-03', 'Absent'),

(2,'2026-10-01', 'Present'),
(2,'2026-10-02', 'Absent'),

(3,'2026-10-01', 'Present'),
(4,'2026-10-01', 'Present'),
(5,'2026-10-01', 'Absent');

-- insert data into examination table
insert into Examinations (StudentID, SubjectName, Marks)
values
(1, 'DBMS', 85),
(1, 'OS', 90),

(2, 'DBMS', 78),
(2, 'Networks', 82),

(3, 'OS', 88),
(3, 'Software Engineering', 91),

(4, 'Data Structures', 75),

(5, 'DBMS', 80);

