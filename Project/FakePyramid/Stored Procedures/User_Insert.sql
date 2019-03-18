CREATE PROCEDURE [FP].[User_Insert]
	  @TransID varchar(20)
	, @ParentName varchar(30)
	, @PayeeName varchar(30)
AS


select @ParentName = lower(@ParentName);

 -- Parent Must Exist
 if not exists (select 1 from FP.[User] u where u.UserName = @ParentName) set @ParentName = 'wigiwiz'

 
-- Insert New User
insert into FP.[User] (TransID, ParentName, PayeeName)
select @TransID, @ParentName, @PayeeName
where not exists(
	select 1 from FP.[User] u 
	where u.TransID = @TransID
)
;

exec FP.User_SelectByUserName @TransID;

return 0;


