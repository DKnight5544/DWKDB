
CREATE FUNCTION bot.GetLegalMoves
(	
	@Value smallint
)
RETURNS @Moves TABLE 
(
	Value smallint, Move smallint,
	Layout char(5)
)
AS
BEGIN

	declare @Layout char(5)
		,	@PartA char
		,	@ti tinyint 
		,	@Move smallint
	;


	-- Row 1

	select @Layout = (select Layout from bot.Board where Value = @Value)
	select @ti = convert(tinyint, substring(@Layout,1,1));

	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = rtrim(convert(char, @ti)) + substring(@Layout,2,4);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end
	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = rtrim(convert(char, @ti)) + substring(@Layout,2,4);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end
	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = rtrim(convert(char, @ti)) + substring(@Layout,2,4);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end
	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = rtrim(convert(char, @ti)) + substring(@Layout,2,4);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end
	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = rtrim(convert(char, @ti)) + substring(@Layout,2,4);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end


	-- Row 2

	select @Layout = (select Layout from bot.Board where Value = @Value)
	select @ti = convert(tinyint, substring(@Layout,2,1));

	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = substring(@Layout,1,1) + rtrim(convert(char, @ti)) + substring(@Layout,3,3);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end

	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = substring(@Layout,1,1) + rtrim(convert(char, @ti)) + substring(@Layout,3,3);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end

	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = substring(@Layout,1,1) + rtrim(convert(char, @ti)) + substring(@Layout,3,3);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end

	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = substring(@Layout,1,1) + rtrim(convert(char, @ti)) + substring(@Layout,3,3);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end


	-- Row 3

	select @Layout = (select Layout from bot.Board where Value = @Value)
	select @ti = convert(tinyint, substring(@Layout,3,1));

	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = substring(@Layout,1,2) + rtrim(convert(char, @ti)) + substring(@Layout,4,2);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end

	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = substring(@Layout,1,2) + rtrim(convert(char, @ti)) + substring(@Layout,4,2);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end

	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = substring(@Layout,1,2) + rtrim(convert(char, @ti)) + substring(@Layout,4,2);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end


	-- Row 4

	select @Layout = (select Layout from bot.Board where Value = @Value)
	select @ti = convert(tinyint, substring(@Layout,4,1));

	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = substring(@Layout,1,3) + rtrim(convert(char, @ti)) + substring(@Layout,5,1);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end


	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = substring(@Layout,1,3) + rtrim(convert(char, @ti)) + substring(@Layout,5,1);
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end

	-- Row 5

	select @Layout = (select Layout from bot.Board where Value = @Value)
	select @ti = convert(tinyint, substring(@Layout,5,1));

	if(@ti > 0) begin
		select @ti = @ti - 1;
		select @Layout = substring(@Layout,1,4) + rtrim(convert(char, @ti));
		select @Move = (select Value from bot.Board where Layout = @Layout)
		insert into @Moves values(@Value,@Move,@Layout)
	end

	-- 0 is NOT a Legal move

	 delete from @Moves where Move = 0
	
	RETURN 
END