CREATE PROCEDURE [ss].[WebsiteUser_Login]
	@FacebookID varchar(50),
	@FacebookName varchar(50),
	@FacebookEmail varchar(100)
AS

if (@FacebookEmail is not null) begin

	MERGE INTO ss.WebsiteUser as wu
	USING (select FacebookID = @FacebookID, FacebookName = @FacebookName, FacebookEmail = @FacebookEmail) p
	ON p.FacebookID = wu.FacebookID
	WHEN MATCHED THEN
		UPDATE SET
		  wu.FacebookName = p.FacebookName
		  ,wu.FacebookEmail = p.FacebookEmail
	WHEN NOT MATCHED THEN 
		  INSERT (
			 FacebookID
			,FacebookName
			,FacebookEmail
			)
		  VALUES (
			 @FacebookID
			,@FacebookName
			,@FacebookEmail
		)
		  ;

end
else begin

	MERGE INTO ss.WebsiteUser as wu
	USING (select FacebookID = @FacebookID, FacebookName = @FacebookName, FacebookEmail = @FacebookEmail) p
	ON p.FacebookID = wu.FacebookID
	WHEN MATCHED THEN
		UPDATE SET
		  wu.FacebookName = p.FacebookName
	WHEN NOT MATCHED THEN 
		  INSERT (
			 FacebookID
			,FacebookName
			)
		  VALUES (
			 @FacebookID
			,@FacebookName
		)
		  ;

end

	
SELECT [FacebookID]
      ,[FacebookName]
      ,[FacebookEmail]
	  ,[DancerIDFilter]
	  ,[JudgeIDFilter]

	from ss.WebsiteUser wu
	where wu.FacebookID = @FacebookID

RETURN 0
