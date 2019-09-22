CREATE TABLE [dbo].[TaskWeeks] (
    [Id]             INT              IDENTITY (1, 1) NOT NULL,
    [WeekStartDate]  DATE             NOT NULL,
    [StatusId]       INT              NOT NULL,
    [Value]          MONEY            NOT NULL,
    [UserIdentifier] UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TaskWeeks_ToStatus] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[Status] ([Id])
);

