CREATE PROCEDURE [ss].[WebsiteUser_UpdateDancerIDFilter]
	@FacebookID varchar(50),
	@DancerIDFilter int
AS

update ss.WebsiteUser 
set DancerIDFilter = nullif(@DancerIDFilter, 0)
where FacebookID = @FacebookID
and DancerIDFilter <> @DancerIDFilter;

