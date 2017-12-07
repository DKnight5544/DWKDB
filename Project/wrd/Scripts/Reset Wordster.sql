	ALTER TABLE [wrd].[LetterData] DROP CONSTRAINT [FK_LetterData_Game]
	GO

	TRUNCATE TABLE wrd.LetterData
	GO

	TRUNCATE TABLE wrd.Game
	GO


	ALTER TABLE [wrd].[LetterData]  WITH CHECK ADD  CONSTRAINT [FK_LetterData_Game] FOREIGN KEY([GameID])
	REFERENCES [wrd].[Game] ([GameID])
	ON DELETE CASCADE
	GO

	ALTER TABLE [wrd].[LetterData] CHECK CONSTRAINT [FK_LetterData_Game]
	GO