-- create departments table
create table Departments(
    DepartmentID int identity(1,1) primary key,
    DepartmentName varchar(100) not null
 );

 -- create students table
 create table Students (
    StudentID int identity(1,1) primary key,
    StudentName varchar(50) not null,
    Email varchar(50) unique,
    DepartmentID int,

    foreign key (DepartmentID)
    references Departments (DepartmentID)
 );

 -- create courses table
 create table Courses (
    CourseID int identity(1,1) primary key,
    CourseName varchar(50) not null,
    Credits int
 );

 -- create enrollment table
 create table Enrollment(
  EnrollmentID int identity(1,1) primary key,
  StudentID int,
  CourseID int,

  foreign key(StudentID)
  references Students(StudentID),

  foreign key(CourseID)
  references Courses(CourseID)
 );

 -- create attendance table
 create table Attendance(
    AttendanceID int identity(1,1) primary key,
    StudentID int,
    AttendanceDate date,
    Status varchar(20),

    foreign key(StudentID)
    references Students(StudentID)
 );

 -- create examination table
 create table Examinations (
    ExamID int identity(1,1) primary key,
    StudentID int,
    SubjectName varchar(50),
    Marks int,

    foreign key(StudentID)
    references Students(StudentID)
 );

