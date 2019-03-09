CREATE PROCEDURE [FP].[User_Insert]
	@UserID varchar(30),
	@NewUserID varchar(30)
AS


select
	@UserID = lower(@UserID)
	,@NewUserID = lower(@NewUserID)
;

 -- UserID Must Exist
 if not exists (select 1 from FP.[User] u where u.UserID = @UserID) return -1

 -- NewUserID must NOT exist
 if exists (select 1 from FP.[User] u where u.UserID = @NewUserID) begin
  return 0
 end


 -- Calculate PayeeID
declare @PayeeID varchar(30) = null
	, @ParentID varchar(30) = null
;

select @PayeeID =  case when U1.UserID = 'wigiwiz' then 'joleneknight'
						when U2.UserID = 'wigiwiz' then 'wigiwiz'
						when U3.UserID = 'wigiwiz' then 'dougraley'
						when U4.UserID = 'wigiwiz' then 'joleneknight'
						else U5.UserID end
from      [FP].[User] U1
left join [FP].[User] U2 on U2.UserID = U1.ParentID
left join [FP].[User] U3 on U3.UserID = U2.ParentID
left join [FP].[User] U4 on U4.UserID = U3.ParentID
left join [FP].[User] U5 on U5.UserID = U4.ParentID
where U1.UserID = @UserID
;

 -- Insert New User
 insert into FP.[User] (UserID, ParentID, PayeeID)
 select @NewUserID, @UserID, @PayeeID
;

select @ParentID = @UserID;

update FP.[User] set L1 += 1 where UserID = @ParentID;
if(@ParentID = 'WIGIWIZ') return 11;

select @ParentID = u.ParentID from FP.[User] u where u.UserID = @ParentID and u.UserID <> 'WIGIWIZ';

update FP.[User] set L2 += 1 where UserID = @ParentID;
if(@ParentID = 'WIGIWIZ') return 12;

select @ParentID = u.ParentID from FP.[User] u where u.UserID = @ParentID and u.UserID <> 'WIGIWIZ';

update FP.[User] set L3 += 1 where UserID = @ParentID;
if(@ParentID = 'WIGIWIZ') return 13;

select @ParentID = u.ParentID from FP.[User] u where u.UserID = @ParentID and u.UserID <> 'WIGIWIZ';

update FP.[User] set L4 += 1 where UserID = @ParentID;
if(@ParentID = 'WIGIWIZ') return 14;

select @ParentID = u.ParentID from FP.[User] u where u.UserID = @ParentID and u.UserID <> 'WIGIWIZ';
update FP.[User] set L5 += 1 where UserID = @ParentID;
return 15