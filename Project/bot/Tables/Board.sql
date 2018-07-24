CREATE TABLE [bot].[Board] (
    [Value]  SMALLINT NOT NULL,
    [Layout] CHAR (5) NOT NULL,
    CONSTRAINT [PK_Board] PRIMARY KEY CLUSTERED ([Value] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Board_Layout]
    ON [bot].[Board]([Layout] ASC);

