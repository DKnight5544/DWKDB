CREATE PROC SS.[WebsiteUser_SelectByFBID]
	@FacebookID varchar(50)
AS
	
SELECT [FacebookID]
      ,[FacebookName]
      ,[FacebookEmail]
	  ,[DancerIDFilter]
	  ,[JudgeIDFilter]
	  ,SelectedDancerFullName = d.FullName
	  ,SelectedDancerWSDC = d.WSDC
	  ,SelectedJudgeName = j.JudgeName

	from ss.WebsiteUser wu
	left join ss.Dancer d on d.DancerID = wu.DancerIDFilter
	left join ss.Judge j on j.JudgeID = wu.JudgeIDFilter
	where wu.FacebookID = @FacebookID