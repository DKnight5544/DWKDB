CREATE TABLE [bot].[Games] (
    [GameNum] INT       IDENTITY (1, 1) NOT NULL,
    [BotID]   INT       NOT NULL,
    [Expires] DATETIME  NOT NULL,
    [GameKey] CHAR (36) NOT NULL,
    CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED ([GameNum] ASC),
    CONSTRAINT [FK_Games_Bots] FOREIGN KEY ([BotID]) REFERENCES [bot].[Bots] ([BotID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Games_GameKey]
    ON [bot].[Games]([GameKey] ASC);

