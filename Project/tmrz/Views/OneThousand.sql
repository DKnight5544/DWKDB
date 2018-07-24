CREATE VIEW [tmrz].[OneThousand]
	AS 

	select Val = (a.d * 100) + (b.d * 10) + c.d
	from (values (0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) a(d)
	cross join (select d from (values (0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) a(d)) b
	cross join (select d from (values (0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) a(d)) c
GO