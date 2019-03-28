CREATE PROCEDURE [Setting_SelectByKey]
	@Key varchar(20)
AS

select [Value] from Setting where [Key] = @Key;


RETURN 0
