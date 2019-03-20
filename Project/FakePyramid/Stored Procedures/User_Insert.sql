CREATE PROCEDURE [FP].[User_Insert]
	  @PayeeID varchar(15)
	, @NewUserID varchar(15)
	, @UserName varchar(30)
AS



 -- Payee Must Exist
 if not exists (select 1 from FP.[User] u where u.UserID = @PayeeID) set @PayeeID = 'SF5J7FCW8LHQC'

 -- NewUserID Must NOT Exist
 if not exists (select 1 from FP.[User] u where u.UserID = @NewUserID) begin

 
-- Insert New User
insert into FP.[User] (UserID, PayeeID)
select @NewUserID, @PayeeID
;

-- Update Transaction Count
update FP.[User]
set TransactionCount += 1
where UserName = @UserName
;

end

exec FP.User_Select @NewUserID;

return 0;


