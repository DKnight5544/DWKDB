CREATE PROCEDURE [wrd].[AddPlayer]
	@Moniker varchar(20)
AS

	declare @PlayerGuid uniqueidentifier;
	declare @PlayerGuidChar char(36);


	if not exists(select 1 from wrd.Player p where p.Moniker = @Moniker) begin	

		select @PlayerGuid = newid();
		select @PlayerGuidChar = convert(char(36), @PlayerGuid);
	
		insert into wrd.Player (
			PlayerGuid
			, Moniker
			)

		select 
			PlayerGuid = @PlayerGuidChar
			, Moniker = @Moniker
			;

	end

	else begin

		select @PlayerGuidChar = '*TAKEN';

	end

	select PlayerGuid = @PlayerGuidChar;

RETURN 0
