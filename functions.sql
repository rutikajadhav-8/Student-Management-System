-- function to calculate grade
create function CalculateGrade (@Marks int)
returns varchar(2)
as
begin

  declare @Grade varchar(2);

  if @Marks >= 90
     set @Grade = 'A';

  else if @Marks >= 80
     set @Grade = 'B';

  else if @Marks >= 70
     set @Grade = 'C';

  else 
     set @Grade = 'D';

  return @Grade;

end;
-- verify:
select StudentID, SubjectName, Marks,
  dbo.CalculateGrade(Marks) as Grade
from Examinations;


-- function to ckeck whether a student has passed or failed
create function IsPass(@Marks int)
returns varchar(7)
as
begin 

   declare @Status varchar(7)

   if @Marks >= 40
     set @Status = 'Pass';
  
  else if @Marks < 40 
     set @Status = 'Fail';

  return @Status;

end;

-- verify:
select StudentID, SubjectName, Marks,
  dbo.IsPass(Marks) as Status
from Examinations;


-- function to get the performance level of a student
create function GetPerformanceLevel (@Marks int)
returns varchar(10)
as
begin
  
  declare @Performance varchar(10)

  if @Marks >= 90
    set @Performance = 'Excellent';

  else if @Marks between 80 and 89
    set @Performance = 'Good';

  else if @Marks between 70 and 79
    set @Performance = 'Average';
  
  else if @Marks < 70
    set @Performance = 'Poor';

  return @Performance;

end;

-- verify: 
select SubjectName, Marks,
dbo.GetPerformanceLevel(Marks) as Performance
from Examinations;


-- function to calculate the attendance status of a student
create function CalculateAttendanceStatus(@AttendancePercentage decimal(5,2))
returns varchar(15)
as
begin 
   declare @Eligibility varchar(15); 

  if @AttendancePercentage >= 75
    set @Eligibility = 'Eligible';

 else if @AttendancePercentage < 75
    set @Eligibility = 'Not Eligible';

  return @Eligibility;

end;

--verify: 
select dbo.CalculateAttendanceStatus(60);


-- function to get average marks of students
create function GetAverageMarks(@StudentID int)
returns decimal(5,2)
as
begin
     
     declare @AvgMarks decimal(5,2);

     select @AvgMarks = avg(cast (Marks as decimal(5,2)))
     from Examinations
     where StudentID = @StudentID;

     return @AvgMarks;

end;

-- verify:
select dbo.GetAverageMarks(1) ;