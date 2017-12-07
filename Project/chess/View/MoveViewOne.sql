CREATE VIEW [chess].[MoveViewOne]
	AS 

with cte as (

select m.*
	, g.WebID
	, MoveNum = ROW_NUMBER() over(partition by GameID order by MoveID)
from chess.[Move] m
join chess.[Game] g on g.ID = m.GameID

)

select *
	, Color = convert(char(1), case when MoveNum % 2 = 1 then 'W' else 'B' end)
from cte
;