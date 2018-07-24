CREATE PROCEDURE [gift].[AddGiver]
	@InviterShareCode char(5)
AS

declare @GiverID char(36) = convert(char(36),newid());

while exists (select 1 from gift.Giver g where g.GiverID = @GiverID)
begin
	select @GiverID = convert(char(36),newid());
end

declare @InviterID char(36) = (
	select GiverID 
	from gift.Giver g 
	where g.ShareCode = @InviterShareCode
)

declare @NewShareCode char(5);


with letters as
(
	SELECT letter FROM (VALUES 
		('A'),('B'),('C'),('D'),('D'),('F'),('G'),
		('H'),('I'),('J'),('K'),('L'),('M'),('N'),
		('O'),('P'),('Q'),('R'),('S'),('T'),('U'),
		('V'),('W'),('X'),('Y'),('Z')
	) AS X(letter)	
)

select top 1

	@NewShareCode = a.letter + b.letter + c.letter + d.letter + e.letter
	
from (select top 26 letter from letters order by newid()) a
cross join  (select top 26 letter from letters order by newid()) b
cross join  (select top 26 letter from letters order by newid()) c
cross join  (select top 26 letter from letters order by newid()) d
cross join  (select top 26 letter from letters order by newid()) e

where a.letter + b.letter + c.letter + d.letter + e.letter not in (
	select ShareCode from gift.Giver
);


insert into gift.Giver(GiverID, InviterID, ShareCode)
select @GiverID, @InviterID, @NewShareCode
;

select *
from gift.Giver g
where g.GiverID = @GiverID;

RETURN 0
