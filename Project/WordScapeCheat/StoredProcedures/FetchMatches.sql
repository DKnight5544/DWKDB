CREATE PROCEDURE [WordScapeCheat].[FetchMatches]
	@Letters varchar(10),
	@Filter varchar(10)
AS


--declare @Letters varchar(10) = 'KILNUE';

if exists (select 1 from WordScapeCheat.ValidWords w where w.BaseWord = @Letters) begin
	select
		w.Word,
		WordLength = len(w.Word)
	from WordScapeCheat.ValidWords w 
	where w.BaseWord = @Letters
	and w.Word like @Filter
	order by 2, 1;
	return;
end

declare @LettersLength int = len(@Letters);

declare @SQL varchar(max) = '

declare @Letters varchar(10) = ''{{LETTERS}}'';
declare @LettersLength int = len(@Letters);
declare @Index int = 1;
declare @LettersTable table (idx int);
declare @AllWordsTable table (Word varchar(10));

while(@Index <= @LettersLength) begin
	insert into @LettersTable select @Index;
	select @Index += 1;
end

insert into @AllWordsTable (Word)
select
	Word = substring(@Letters,t1.idx,1)
		 + substring(@Letters,t2.idx,1)
		 + substring(@Letters,t3.idx,1)
'

select @SQL += ' + substring(@Letters,t4.idx,1)'  where @LettersLength >= 4
select @SQL += ' + substring(@Letters,t5.idx,1)'  where @LettersLength >= 5
select @SQL += ' + substring(@Letters,t6.idx,1)'  where @LettersLength >= 6
select @SQL += ' + substring(@Letters,t7.idx,1)'  where @LettersLength >= 7
select @SQL += ' + substring(@Letters,t8.idx,1)'  where @LettersLength >= 8
select @SQL += ' + substring(@Letters,t9.idx,1)'  where @LettersLength >= 9
select @SQL += ' + substring(@Letters,t10.idx,1)'  where @LettersLength >= 10

select @SQL += 
'
from @LettersTable t1
cross join @LettersTable t2
cross join @LettersTable t3'

select @SQL += ' cross join @LettersTable t4 '  where @LettersLength >= 4
select @SQL += ' cross join @LettersTable t5 '  where @LettersLength >= 5
select @SQL += ' cross join @LettersTable t6 '  where @LettersLength >= 6
select @SQL += ' cross join @LettersTable t7 '  where @LettersLength >= 7
select @SQL += ' cross join @LettersTable t8 '  where @LettersLength >= 8
select @SQL += ' cross join @LettersTable t9 '  where @LettersLength >= 9
select @SQL += ' cross join @LettersTable t10 '  where @LettersLength >= 10

select @SQL += 
'
where t2.idx <> t1.idx
and t3.idx <> t2.idx and t3.idx <> t1.idx
'

select @SQL += ' and t4.idx <> t3.idx and t4.idx <> t2.idx and t4.idx <> t1.idx'  where @LettersLength >= 4
select @SQL += ' and t5.idx <> t4.idx and t5.idx <> t3.idx and t5.idx <> t2.idx and t5.idx <> t1.idx'  where @LettersLength >= 5
select @SQL += ' and t6.idx <> t5.idx and t6.idx <> t4.idx and t6.idx <> t3.idx and t6.idx <> t2.idx and t6.idx <> t1.idx'  where @LettersLength >= 6
select @SQL += ' and t7.idx <> t6.idx and t7.idx <> t5.idx and t7.idx <> t4.idx and t7.idx <> t3.idx and t7.idx <> t2.idx and t7.idx <> t1.idx'  where @LettersLength >= 7
select @SQL += ' and t8.idx <> t7.idx and t8.idx <> t6.idx and t8.idx <> t5.idx and t8.idx <> t4.idx and t8.idx <> t3.idx and t8.idx <> t2.idx and t8.idx <> t1.idx'  where @LettersLength >= 8
select @SQL += ' and t9.idx <> t8.idx and t9.idx <> t7.idx and t9.idx <> t6.idx and t9.idx <> t5.idx and t9.idx <> t4.idx and t9.idx <> t3.idx and t9.idx <> t2.idx and t9.idx <> t1.idx'  where @LettersLength >= 9
select @SQL += ' and t10.idx <> t9.idx and t10.idx <> t8.idx and t10.idx <> t7.idx and t10.idx <> t6.idx and t10.idx <> t5.idx and t10.idx <> t4.idx and t10.idx <> t3.idx and t10.idx <> t2.idx and t10.idx <> t1.idx'  where @LettersLength >= 10

select @SQL += 
'
insert into WordScapeCheat.ValidWords (Word, BaseWord)
select distinct a.Word, @Letters
from (
	      select distinct Word = substring(Word,1,3) from @AllWordsTable
	union select distinct Word = substring(Word,1,4) from @AllWordsTable where @LettersLength >= 4 
	union select distinct Word = substring(Word,1,5) from @AllWordsTable where @LettersLength >= 5
	union select distinct Word = substring(Word,1,6) from @AllWordsTable where @LettersLength >= 6 
	union select distinct Word = substring(Word,1,7) from @AllWordsTable where @LettersLength >= 7 
	union select distinct Word = substring(Word,1,8) from @AllWordsTable where @LettersLength >= 8 
	union select distinct Word = substring(Word,1,9) from @AllWordsTable where @LettersLength >= 9 
	union select distinct Word = substring(Word,1,10) from @AllWordsTable where @LettersLength >= 10 
) a
join WordScapeCheat.ValidWords b
on b.Word = a.Word
and b.BaseWord = ''ORG'' 
where not exists (
	select 1
	from WordScapeCheat.ValidWords x
	where x.Word = a.Word
	and x.BaseWord = @Letters
)

'

select @SQL = replace(@SQL,'{{LETTERS}}', @Letters);
exec (@SQL);

select
	w.Word,
	WordLength = len(w.Word)
from WordScapeCheat.ValidWords w
where w.BaseWord = @Letters
and w.Word like @Filter
order by 2, 1

;

