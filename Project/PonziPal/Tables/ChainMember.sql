CREATE TABLE [pnz].[ChainMember]
(
	 [ChainNumber] INT NOT NULL
	,[MemberNumber] INT NOT NULL
	,[PositionNumber] INT NOT NULL identity(1,1)
    ,CONSTRAINT PK_ChainMember PRIMARY KEY CLUSTERED ([ChainNumber] asc, [MemberNumber] asc) 
    ,CONSTRAINT [FK_ChainMember_Chain] FOREIGN KEY (ChainNumber) REFERENCES pnz.Chain(ChainNumber)
    ,CONSTRAINT [FK_ChainMember_Member] FOREIGN KEY (MemberNumber) REFERENCES pnz.Member(MemberNumber)
)


