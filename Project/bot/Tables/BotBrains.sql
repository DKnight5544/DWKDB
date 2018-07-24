CREATE TABLE [bot].[BotBrains] (
    [BotID]  INT      NOT NULL,
    [Value]  SMALLINT NOT NULL,
    [Impact] INT      CONSTRAINT [DF_BotBrains_Impact] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_BotBrains] PRIMARY KEY CLUSTERED ([BotID] ASC, [Value] ASC),
    CONSTRAINT [FK_BotBrains_BotID] FOREIGN KEY ([BotID]) REFERENCES [bot].[Bots] ([BotID]) ON DELETE CASCADE
);

