-- commit 
begin transaction;

update Students 
set StudentName = 'Priya Updated'
where StudentID = 2;

commit;

-- rollback
begin transaction;

update Students
set StudentName = 'Priya wrong'
where StudentID = 2;

rollback;

-- savepoint
begin transaction;

update Students
set StudentName = ' Test 1'
where StudentID = 2;

save transaction mySavepoint;

update Students
set StudentName = ' Test 2'
where StudentID = 2;

rollback transaction mySavepoint;

update Students
set StudentName = ' Priya Patil'
where StudentID = 2;

commit;





