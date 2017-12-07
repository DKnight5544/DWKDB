CREATE PROCEDURE [wrd].[RepositionWords]
	@GamePlayerID int
AS	

declare @RowOffset tinyint
	  , @ColOffset tinyint
	;

declare @LocationTable table (
	R tinyint not null,
	C tinyint not null,
	L char(6) not null
);

insert into @LocationTable(R,C,L)
select 
	  R = convert(int, substring(s1.Loc,2,2))
	, C = convert(int, substring(s1.Loc,5,2))
	, L = s1.Loc
from [wrd].[GamePlayerLetter] s1
where s1.[GamePlayerID] = @GamePlayerID
order by 1,2
;

--select * from @LocationTable;

select @RowOffset = min(R) - 1
	 , @ColOffset = min(C) - 1
from @LocationTable

--select @RowOffset, @ColOffset;

update lt set
--select 
	R = R - @RowOffset
	, C = C - @ColOffset
from @LocationTable lt

update gpl set
-- select
	Loc = 'R' + right('00' + convert(varchar, lt.R), 2) 
		+ 'C' + right('00' + convert(varchar, lt.C), 2)
from @LocationTable lt
join [wrd].[GamePlayerLetter] gpl
on gpl.[Loc] = lt.L
and gpl.[GamePlayerID] = @GamePlayerID
;

RETURN 0
