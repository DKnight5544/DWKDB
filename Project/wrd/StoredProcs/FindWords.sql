CREATE PROCEDURE [wrd].[FindWords]
	@Board xml
AS

--declare @Board xml = '<Board><LetLoc><Let>E</Let><Loc>R02C10</Loc></LetLoc><LetLoc><Let>M</Let><Loc>R02C04</Loc></LetLoc><LetLoc><Let>O</Let><Loc>R02C05</Loc></LetLoc><LetLoc><Let>S</Let><Loc>R02C03</Loc></LetLoc><LetLoc><Let>O</Let><Loc>R02C06</Loc></LetLoc><LetLoc><Let>T</Let><Loc>R02C07</Loc></LetLoc><LetLoc><Let>H</Let><Loc>R02C08</Loc></LetLoc><LetLoc><Let>I</Let><Loc>R02C09</Loc></LetLoc></Board>';

declare @B char(1) = ' ';


with cteStep1 as (
	select 
		 Loc = X.value('(Loc)[1]', 'char(6)')
		,Let = X.value('(Let)[1]', 'char(1)')
	from @Board.nodes('/Board/LetLoc') as a(X)
)

--select * from cteBoard order by 1;

, cteStep2 as (

	select 
		  R = convert(int, substring(s1.Loc,2,2))
		, C = convert(int, substring(s1.Loc,5,2))
		, Letter = s1.Let
	from cteStep1 s1

)

--select * from cteStep2 order by r, c


, cte_normal as (

	select *
	from cteStep2
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
	from cteStep2
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

/* Requires SQL 2016, Compatibility Level = 130 */
select Word = w.value
from cte_Words t
cross apply string_split(t.words,' ') w
where len(w.value) > 1
and w.value not in (
	select Word from wrd.LegalWords
);


RETURN 0
