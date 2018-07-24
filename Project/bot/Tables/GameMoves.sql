CREATE TABLE [bot].[GameMoves] (
    [GameNum]    INT      NOT NULL,
    [BoardValue] SMALLINT NOT NULL,
    [PlayerCode] CHAR (1) NOT NULL,
    CONSTRAINT [PK_GameMoves] PRIMARY KEY CLUSTERED ([GameNum] ASC, [BoardValue] ASC),
    CONSTRAINT [FK_GameMoves_Games] FOREIGN KEY ([GameNum]) REFERENCES [bot].[Games] ([GameNum]) ON DELETE CASCADE
);

