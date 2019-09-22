CREATE TABLE [dbo].[TransactionLog] (
    [Id]             INT              IDENTITY (1, 1) NOT NULL,
    [Date]           DATETIME         DEFAULT (getdate()) NOT NULL,
    [Description]    NVARCHAR (50)    NOT NULL,
    [CategoryId]     INT              NOT NULL,
    [Amount]         MONEY            NOT NULL,
    [UserIdentifier] UNIQUEIDENTIFIER NOT NULL,
    [AccountId]      INT              NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionLog_ToAccounts] FOREIGN KEY ([AccountId]) REFERENCES [dbo].[Accounts] ([Id]),
    CONSTRAINT [FK_TransactionLog_ToTransactionCategory] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[TransactionCategories] ([Id])
);

