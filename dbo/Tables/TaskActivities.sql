CREATE TABLE [dbo].[TaskActivities] (
    [Id]               INT              IDENTITY (1, 1) NOT NULL,
    [TaskGroupId]      INT              NOT NULL,
    [TaskDayId]        INT              NOT NULL,
    [Sequence]         INT              NOT NULL,
    [TaskWeekId]       INT              NOT NULL,
    [StatusId]         INT              DEFAULT ((1)) NOT NULL,
    [TaskDefinitionId] INT              NOT NULL,
    [DaySequence]      INT              NOT NULL,
    [UserIdentifier]   UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TaskActivities_ToActivityStatus] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[ActivityStatus] ([Id]),
    CONSTRAINT [FK_TaskActivities_ToTaskDays] FOREIGN KEY ([TaskDayId]) REFERENCES [dbo].[TaskDays] ([Id]),
    CONSTRAINT [FK_TaskActivities_ToTaskDefinitions (Id)] FOREIGN KEY ([TaskDefinitionId]) REFERENCES [dbo].[TaskDefinitions] ([Id]),
    CONSTRAINT [FK_TaskActivities_ToTaskGroups] FOREIGN KEY ([TaskGroupId]) REFERENCES [dbo].[TaskGroups] ([Id]),
    CONSTRAINT [FK_TaskActivities_ToTaskWeeks] FOREIGN KEY ([TaskWeekId]) REFERENCES [dbo].[TaskWeeks] ([Id])
);

