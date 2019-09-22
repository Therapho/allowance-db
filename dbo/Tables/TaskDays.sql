CREATE TABLE [dbo].[TaskDays] (
    [Id]             INT              IDENTITY (1, 1) NOT NULL,
    [Date]           DATE             NOT NULL,
    [StatusId]       INT              NOT NULL,
    [TaskWeekId]     INT              NOT NULL,
    [Value]          MONEY            NOT NULL,
    [UserIdentifier] UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TaskDays_ToStatus] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[Status] ([Id]),
    CONSTRAINT [FK_TaskDays_ToTaskWeeks] FOREIGN KEY ([TaskWeekId]) REFERENCES [dbo].[TaskWeeks] ([Id])
);

