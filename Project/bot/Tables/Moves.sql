CREATE TABLE [bot].[Moves] (
    [Value] SMALLINT NOT NULL,
    [Move]  SMALLINT NOT NULL,
    CONSTRAINT [PK_Moves] PRIMARY KEY CLUSTERED ([Value] ASC, [Move] DESC)
);

