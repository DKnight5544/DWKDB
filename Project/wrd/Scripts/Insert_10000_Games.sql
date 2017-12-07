declare @GameCount int;


select @GameCount = count(*) from wrd.Game g;

while @GameCount < 10000 begin

	exec wrd.InsertGameRow;

	select @GameCount = count(*) from wrd.Game g;

end