
create proc bot.CreateNewBot 
	@BotName varchar(15)

as

if not exists(select 1 from [bot].[Bots] where BotName = @BotName) begin

	insert into bot.Bots
	select 
		 @BotName
		,Wins = 0
		,Losses = 0
		,CashIn = 0
		,PayPalID = ''

end