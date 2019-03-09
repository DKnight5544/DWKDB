CREATE PROCEDURE [GBZ].[AddUpdateBot]
	@URL varchar(1000),
	@PaymentInfo varchar(1000),
	@BotName varchar(20)
AS

update GBZ.Bot SET
	PaymentInfo = @PaymentInfo
	, BotName = @BotName
where [URL] = @URL
;



insert into GBZ.Bot
select 
	@URL
	, @PaymentInfo
	, @BotName
where not exists(
	select 1
	from GBZ.Bot
	where [URL] = @URL
)

