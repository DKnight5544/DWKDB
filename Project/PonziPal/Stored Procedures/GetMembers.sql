CREATE PROCEDURE [pnz].[GetMembers]
	@ChainNumber int
AS

	select *
	from pnz.AllDataView v
	where v.ChainNumber = @ChainNumber
	order by v.MemberNumber

;
RETURN 0
