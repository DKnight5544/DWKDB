

declare @GameGuidChar char(36) = 'CFB3AAB9-BB4F-498F-AC98-970FFD36DEA1'
	  , @playernum int = 1
	;

declare @B char(1) = ' '
	, @GameID int = (select g.GameID from wrd.Game g where g.GameGuid = convert(uniqueidentifier, @GameGuidChar))
	;
	
declare @Step1 table (
	  R int not null 
	, C int not null
	, Letter char(1) not null
	, Primary Key(R,C)
);

insert into @Step1

select 
	  R = convert(int, substring(ld.Location,2,2))
	, C = convert(int, substring(ld.Location,5,2))
	, ld.Letter
from wrd.LetterData ld
where ld.GameID = @GameID
and ld.PlayerNum = @PlayerNum
and left(ld.Location,1) = 'R'
order by 1,2;

with cte_normal as (

	select *
	from @step1
	pivot ( min(letter) for c in (
			   [00],[01],[02],[03],[04],[05],[06],[07],[08],[09]
			  ,[10],[11],[12],[13],[14],[15],[16],[17],[18],[19]
			  ,[20],[21],[22],[23],[24],[25],[26],[27],[28],[29]
			  ,[30],[31],[32],[33],[34],[35],[36],[37],[38],[39]
			  ,[40],[41],[42],[43],[44],[45],[46],[47],[48],[49]
			  ,[50],[51],[52],[53],[54],[55],[56],[57],[58],[59]
			  ,[60],[61],[62],[63],[64],[65],[66],[67],[68],[69]
			  ,[70],[71],[72],[73],[74],[75],[76],[77],[78],[79]
			  ,[80],[81],[82],[83],[84],[85],[86],[87],[88],[89]
			  ,[90],[91],[92],[93],[94],[95],[96],[97],[98],[99]
		)) as X

)

,cte_rotated as (

	select *
	from @step1
	pivot ( min(letter) for r in (
			   [00],[01],[02],[03],[04],[05],[06],[07],[08],[09]
			  ,[10],[11],[12],[13],[14],[15],[16],[17],[18],[19]
			  ,[20],[21],[22],[23],[24],[25],[26],[27],[28],[29]
			  ,[30],[31],[32],[33],[34],[35],[36],[37],[38],[39]
			  ,[40],[41],[42],[43],[44],[45],[46],[47],[48],[49]
			  ,[50],[51],[52],[53],[54],[55],[56],[57],[58],[59]
			  ,[60],[61],[62],[63],[64],[65],[66],[67],[68],[69]
			  ,[70],[71],[72],[73],[74],[75],[76],[77],[78],[79]
			  ,[80],[81],[82],[83],[84],[85],[86],[87],[88],[89]
			  ,[90],[91],[92],[93],[94],[95],[96],[97],[98],[99]
		)) as X

)

, cte_Unioned as (
	select * from cte_normal union all
	select * from cte_rotated
)

, cte_words as (

select 
	words = ltrim(rtrim(concat(		
			   isnull([00],@B),isnull([01],@B),isnull([02],@B),isnull([03],@B),isnull([04],@B),isnull([05],@B),isnull([06],@B),isnull([07],@B),isnull([08],@B),isnull([09],@B)
			  ,isnull([10],@B),isnull([11],@B),isnull([12],@B),isnull([13],@B),isnull([14],@B),isnull([15],@B),isnull([16],@B),isnull([17],@B),isnull([18],@B),isnull([19],@B)
			  ,isnull([20],@B),isnull([21],@B),isnull([22],@B),isnull([23],@B),isnull([24],@B),isnull([25],@B),isnull([26],@B),isnull([27],@B),isnull([28],@B),isnull([29],@B)
			  ,isnull([30],@B),isnull([31],@B),isnull([32],@B),isnull([33],@B),isnull([34],@B),isnull([35],@B),isnull([36],@B),isnull([37],@B),isnull([38],@B),isnull([39],@B)
			  ,isnull([40],@B),isnull([41],@B),isnull([42],@B),isnull([43],@B),isnull([44],@B),isnull([45],@B),isnull([46],@B),isnull([47],@B),isnull([48],@B),isnull([49],@B)
			  ,isnull([50],@B),isnull([51],@B),isnull([52],@B),isnull([53],@B),isnull([54],@B),isnull([55],@B),isnull([56],@B),isnull([57],@B),isnull([58],@B),isnull([59],@B)
			  ,isnull([60],@B),isnull([61],@B),isnull([62],@B),isnull([63],@B),isnull([64],@B),isnull([65],@B),isnull([66],@B),isnull([67],@B),isnull([68],@B),isnull([69],@B)
			  ,isnull([70],@B),isnull([71],@B),isnull([72],@B),isnull([73],@B),isnull([74],@B),isnull([75],@B),isnull([76],@B),isnull([77],@B),isnull([78],@B),isnull([79],@B)
			  ,isnull([80],@B),isnull([81],@B),isnull([82],@B),isnull([83],@B),isnull([84],@B),isnull([85],@B),isnull([86],@B),isnull([87],@B),isnull([88],@B),isnull([89],@B)
			  ,isnull([90],@B),isnull([91],@B),isnull([92],@B),isnull([93],@B),isnull([94],@B),isnull([95],@B),isnull([96],@B),isnull([97],@B),isnull([98],@B),isnull([99],@B)
			)))
				
from cte_Unioned x

)


select Word = w.value
from cte_Words t
cross apply string_split(t.words,' ') w
where len(w.value) > 1
and w.value not in (
	select Word from wrd.LegalWords
)
