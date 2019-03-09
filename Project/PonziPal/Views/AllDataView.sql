CREATE VIEW [pnz].[AllDataView] AS


select 
	  cm.ChainNumber
	, cm.MemberNumber
	, cm.PositionNumber
	, m.MemberName
	, m.Clicks
	, c.CreateTime

from pnz.Chain c
join pnz.ChainMember cm on cm.ChainNumber = c.ChainNumber
join pnz.Member m on m.MemberNumber = cm.MemberNumber
