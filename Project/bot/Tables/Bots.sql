CREATE TABLE [bot].[Bots] (
    [BotID]    INT          IDENTITY (1, 1) NOT NULL,
    [BotName]  VARCHAR (15) NOT NULL,
    [Wins]     INT          NOT NULL,
    [Losses]   INT          NOT NULL,
    [CashIn]   INT          CONSTRAINT [DF_Bots_CashIn] DEFAULT ((0)) NOT NULL,
    [PayPalID] CHAR (13)    NULL,
    CONSTRAINT [PK_Bots] PRIMARY KEY CLUSTERED ([BotName] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Bots_BotID]
    ON [bot].[Bots]([BotID] ASC);

