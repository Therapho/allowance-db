﻿/*
Deployment script for Allowance

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Allowance"
:setvar DefaultFilePrefix "Allowance"
:setvar DefaultDataPath "C:\Users\carlor\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"
:setvar DefaultLogPath "C:\Users\carlor\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367)) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Creating [dbo].[Accounts]...';


GO
CREATE TABLE [dbo].[Accounts] (
    [Id]             INT              IDENTITY (1, 1) NOT NULL,
    [Username]       NVARCHAR (50)    NOT NULL,
    [RoleId]         INT              NOT NULL,
    [Name]           NVARCHAR (50)    NOT NULL,
    [Balance]        MONEY            NOT NULL,
    [UserIdentifier] UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ActivityStatus]...';


GO
CREATE TABLE [dbo].[ActivityStatus] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Roles]...';


GO
CREATE TABLE [dbo].[Roles] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Status]...';


GO
CREATE TABLE [dbo].[Status] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TaskActivities]...';


GO
CREATE TABLE [dbo].[TaskActivities] (
    [Id]               INT              IDENTITY (1, 1) NOT NULL,
    [TaskGroupId]      INT              NOT NULL,
    [TaskDayId]        INT              NOT NULL,
    [Sequence]         INT              NOT NULL,
    [TaskWeekId]       INT              NOT NULL,
    [StatusId]         INT              NOT NULL,
    [TaskDefinitionId] INT              NOT NULL,
    [DaySequence]      INT              NOT NULL,
    [UserIdentifier]   UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TaskDays]...';


GO
CREATE TABLE [dbo].[TaskDays] (
    [Id]             INT              IDENTITY (1, 1) NOT NULL,
    [Date]           DATE             NOT NULL,
    [StatusId]       INT              NOT NULL,
    [TaskWeekId]     INT              NOT NULL,
    [Value]          MONEY            NOT NULL,
    [UserIdentifier] UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TaskDefinitions]...';


GO
CREATE TABLE [dbo].[TaskDefinitions] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [TaskGroupId] INT           NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    [Value]       MONEY         NOT NULL,
    [Sequence]    INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TaskGroups]...';


GO
CREATE TABLE [dbo].[TaskGroups] (
    [Id]     INT           IDENTITY (1, 1) NOT NULL,
    [Name]   NVARCHAR (50) NOT NULL,
    [Weekly] BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TaskWeeks]...';


GO
CREATE TABLE [dbo].[TaskWeeks] (
    [Id]             INT              IDENTITY (1, 1) NOT NULL,
    [WeekStartDate]  DATE             NOT NULL,
    [StatusId]       INT              NOT NULL,
    [Value]          MONEY            NOT NULL,
    [UserIdentifier] UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TransactionCategories]...';


GO
CREATE TABLE [dbo].[TransactionCategories] (
    [Id]   INT        IDENTITY (1, 1) NOT NULL,
    [Name] NCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TransactionLog]...';


GO
CREATE TABLE [dbo].[TransactionLog] (
    [Id]             INT              IDENTITY (1, 1) NOT NULL,
    [Date]           DATETIME         NOT NULL,
    [Description]    NVARCHAR (50)    NOT NULL,
    [CategoryId]     INT              NOT NULL,
    [Amount]         MONEY            NOT NULL,
    [UserIdentifier] UNIQUEIDENTIFIER NOT NULL,
    [AccountId]      INT              NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating unnamed constraint on [dbo].[Accounts]...';


GO
ALTER TABLE [dbo].[Accounts]
    ADD DEFAULT ((0)) FOR [Balance];


GO
PRINT N'Creating unnamed constraint on [dbo].[TaskActivities]...';


GO
ALTER TABLE [dbo].[TaskActivities]
    ADD DEFAULT ((1)) FOR [StatusId];


GO
PRINT N'Creating unnamed constraint on [dbo].[TaskGroups]...';


GO
ALTER TABLE [dbo].[TaskGroups]
    ADD DEFAULT ((0)) FOR [Weekly];


GO
PRINT N'Creating unnamed constraint on [dbo].[TransactionLog]...';


GO
ALTER TABLE [dbo].[TransactionLog]
    ADD DEFAULT (getdate()) FOR [Date];


GO
PRINT N'Creating [dbo].[FK_Accounts_ToRoles]...';


GO
ALTER TABLE [dbo].[Accounts] WITH NOCHECK
    ADD CONSTRAINT [FK_Accounts_ToRoles] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskActivities_ToActivityStatus]...';


GO
ALTER TABLE [dbo].[TaskActivities] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskActivities_ToActivityStatus] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[ActivityStatus] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskActivities_ToTaskDays]...';


GO
ALTER TABLE [dbo].[TaskActivities] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskActivities_ToTaskDays] FOREIGN KEY ([TaskDayId]) REFERENCES [dbo].[TaskDays] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskActivities_ToTaskDefinitions (Id)]...';


GO
ALTER TABLE [dbo].[TaskActivities] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskActivities_ToTaskDefinitions (Id)] FOREIGN KEY ([TaskDefinitionId]) REFERENCES [dbo].[TaskDefinitions] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskActivities_ToTaskGroups]...';


GO
ALTER TABLE [dbo].[TaskActivities] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskActivities_ToTaskGroups] FOREIGN KEY ([TaskGroupId]) REFERENCES [dbo].[TaskGroups] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskActivities_ToTaskWeeks]...';


GO
ALTER TABLE [dbo].[TaskActivities] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskActivities_ToTaskWeeks] FOREIGN KEY ([TaskWeekId]) REFERENCES [dbo].[TaskWeeks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskDays_ToStatus]...';


GO
ALTER TABLE [dbo].[TaskDays] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskDays_ToStatus] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[Status] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskDays_ToTaskWeeks]...';


GO
ALTER TABLE [dbo].[TaskDays] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskDays_ToTaskWeeks] FOREIGN KEY ([TaskWeekId]) REFERENCES [dbo].[TaskWeeks] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskDefinition_ToTaskGroups]...';


GO
ALTER TABLE [dbo].[TaskDefinitions] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskDefinition_ToTaskGroups] FOREIGN KEY ([TaskGroupId]) REFERENCES [dbo].[TaskGroups] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TaskWeeks_ToStatus]...';


GO
ALTER TABLE [dbo].[TaskWeeks] WITH NOCHECK
    ADD CONSTRAINT [FK_TaskWeeks_ToStatus] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[Status] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TransactionLog_ToAccounts]...';


GO
ALTER TABLE [dbo].[TransactionLog] WITH NOCHECK
    ADD CONSTRAINT [FK_TransactionLog_ToAccounts] FOREIGN KEY ([AccountId]) REFERENCES [dbo].[Accounts] ([Id]);


GO
PRINT N'Creating [dbo].[FK_TransactionLog_ToTransactionCategory]...';


GO
ALTER TABLE [dbo].[TransactionLog] WITH NOCHECK
    ADD CONSTRAINT [FK_TransactionLog_ToTransactionCategory] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[TransactionCategories] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Accounts] WITH CHECK CHECK CONSTRAINT [FK_Accounts_ToRoles];

ALTER TABLE [dbo].[TaskActivities] WITH CHECK CHECK CONSTRAINT [FK_TaskActivities_ToActivityStatus];

ALTER TABLE [dbo].[TaskActivities] WITH CHECK CHECK CONSTRAINT [FK_TaskActivities_ToTaskDays];

ALTER TABLE [dbo].[TaskActivities] WITH CHECK CHECK CONSTRAINT [FK_TaskActivities_ToTaskDefinitions (Id)];

ALTER TABLE [dbo].[TaskActivities] WITH CHECK CHECK CONSTRAINT [FK_TaskActivities_ToTaskGroups];

ALTER TABLE [dbo].[TaskActivities] WITH CHECK CHECK CONSTRAINT [FK_TaskActivities_ToTaskWeeks];

ALTER TABLE [dbo].[TaskDays] WITH CHECK CHECK CONSTRAINT [FK_TaskDays_ToStatus];

ALTER TABLE [dbo].[TaskDays] WITH CHECK CHECK CONSTRAINT [FK_TaskDays_ToTaskWeeks];

ALTER TABLE [dbo].[TaskDefinitions] WITH CHECK CHECK CONSTRAINT [FK_TaskDefinition_ToTaskGroups];

ALTER TABLE [dbo].[TaskWeeks] WITH CHECK CHECK CONSTRAINT [FK_TaskWeeks_ToStatus];

ALTER TABLE [dbo].[TransactionLog] WITH CHECK CHECK CONSTRAINT [FK_TransactionLog_ToAccounts];

ALTER TABLE [dbo].[TransactionLog] WITH CHECK CHECK CONSTRAINT [FK_TransactionLog_ToTransactionCategory];


GO
PRINT N'Update complete.';


GO
