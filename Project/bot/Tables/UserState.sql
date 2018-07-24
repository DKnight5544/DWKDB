CREATE TABLE [bot].[UserState] (
    [UserId]     VARCHAR (20) NOT NULL,
    [GameKey]    CHAR (36)    NOT NULL,
    [BoardValue] INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC)
);

