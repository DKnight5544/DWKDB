CREATE PROCEDURE [FP].[Setting_SelectByKey]
	@Key varchar(20)
AS

select [Value] from FP.Setting where [Key] = @Key;


RETURN 0
