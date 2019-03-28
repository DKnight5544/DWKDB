CREATE PROCEDURE [User_Insert]
	  @PayeeID varchar(15)
	, @NewUserID varchar(15)
	, @UserName varchar(30)
AS



 -- Payee Must Exist
 if not exists (select 1 from [User] u where u.UserID = @PayeeID) set @PayeeID = 'SF5J7FCW8LHQC'

 -- NewUserID Must NOT Exist
 if not exists (select 1 from [User] u where u.UserID = @NewUserID) begin

 
-- Insert New User
insert into [User] (UserID, PayeeID)
select @NewUserID, @PayeeID
;

-- Update Transaction Count
update [User]
set TransactionCount += 1
where UserName = @UserName
;

end

exec User_Select @NewUserID;

return 0;


