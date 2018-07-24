CREATE PROCEDURE [gift].[GetGiverByShareCode]
	@ShareCode char(5)
AS

	select *
	from gift.Giver g
	where g.ShareCode = @ShareCode;

RETURN 0
