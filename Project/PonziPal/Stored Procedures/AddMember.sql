CREATE PROCEDURE [pnz].[AddMember]
	@ChainNumber int = 0,
	@MemberName varchar(100)
AS

	-- the new member cannot be in the bottom 10 of the parent chain.
	if exists (
		select 1
		from (
			select top 10 
				v.MemberName
			from pnz.AllDataView v
			where v.ChainNumber = @ChainNumber
			order by v.MemberNumber desc
		) a
		where a.MemberName = @MemberName

	) return;

	-- Create a new chain	
	insert into pnz.Chain(CreateTime)
	select getdate();

	declare @NewChainNumber int = @@Identity;
	
	-- add the new member if not exists
	insert into pnz.Member (MemberName, Clicks)
	select @MemberName, 0
	where @MemberName not in (
		select m.MemberName
		from pnz.Member m
		where m.MemberName = @MemberName
	)

	-- get the member number
	declare @MemberNumber int = (
		select m.MemberNumber
		from pnz.Member m
		where m.MemberName = @MemberName
	)

	-- now add this member to the chain
	insert into pnz.ChainMember(ChainNumber, MemberNumber)
	select @NewChainNumber, @MemberNumber

	-- and the members of the old chain
	union all
	select @NewChainNumber, cm.MemberNumber
	from pnz.ChainMember cm
	where cm.ChainNumber = @ChainNumber

	-- finally return the top 7
	exec pnz.GetMembers @NewChainNumber;

	return 0;
