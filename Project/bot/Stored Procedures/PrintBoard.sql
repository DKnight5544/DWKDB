
create procedure bot.PrintBoard
	@Value smallint

AS

declare @Layout char(5) = (select Layout from bot.Board where value = @Value)
	,	@Splats char(5) = 'XXXXX'
	,	@Dashes char(5) = '-----'
	,	@Mid tinyint = 0
	,	@Row tinyint = 0
;

select	@Row = 1
select	@Mid  = convert(tinyint, substring(@Layout,@Row,1))
Print left(@Splats,@Mid) + right(@Dashes,5-@Mid)

select	@Row = 2
select	@Mid  = convert(tinyint, substring(@Layout,@Row,1))
Print left(@Splats,@Mid) + right(@Dashes,4-@Mid)

select	@Row = 3
select	@Mid  = convert(tinyint, substring(@Layout,@Row,1))
Print left(@Splats,@Mid) + right(@Dashes,3-@Mid)

select	@Row = 4
select	@Mid  = convert(tinyint, substring(@Layout,@Row,1))
Print left(@Splats,@Mid) + right(@Dashes,2-@Mid)

select	@Row = 5
select	@Mid  = convert(tinyint, substring(@Layout,@Row,1))
Print left(@Splats,@Mid) + right(@Dashes,1-@Mid)