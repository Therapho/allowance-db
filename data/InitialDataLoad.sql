/*
This script was created by Visual Studio on 2019-09-19 at 7:52 PM.
Run this script on (localdb)\ProjectsV13.allowance-db (NORTHAMERICA\carlor) to make it the same as allowance.database.windows.net.Allowance-DB (allowanceadmin).
This script performs its actions in the following order:
1. Disable foreign-key constraints.
2. Perform DELETE commands. 
3. Perform UPDATE commands.
4. Perform INSERT commands.
5. Re-enable foreign-key constraints.
Please back up your target database before running this script.
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Pointer used for text / image updates. This might not be needed, but is declared here just in case*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
ALTER TABLE [dbo].[Accounts] DROP CONSTRAINT [FK_Accounts_ToRoles]
ALTER TABLE [dbo].[TaskDefinitions] DROP CONSTRAINT [FK_TaskDefinition_ToTaskGroups]
SET IDENTITY_INSERT [dbo].[TaskDefinitions] ON
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (28, 1, N'Down by 7:30', 0.0500, 1)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (29, 1, N'Brush Teeth', 0.0500, 2)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (31, 1, N'Help with Breakfast', 0.0500, 3)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (32, 1, N'Take Care of Hershey', 0.0500, 4)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (33, 1, N'Breakfast by 8:00', 0.0500, 5)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (34, 1, N'Ready by 8:30', 0.0500, 6)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (35, 2, N'Store Backpack', 0.0500, 1)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (36, 2, N'Clear Foyer', 0.0500, 2)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (37, 2, N'Wash Hands ', 0.0500, 3)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (38, 2, N'Clean Lunchbag', 0.0500, 4)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (39, 3, N'No Fighting or Teasing', 0.1500, 1)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (40, 3, N'Respect', 0.1500, 2)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (41, 3, N'Cleanliness', 0.1500, 3)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (42, 3, N'Politeness', 0.1500, 4)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (43, 4, N'Volunteer Bonus', 1.0000, 1)
INSERT INTO [dbo].[TaskDefinitions] ([Id], [TaskGroupId], [Description], [Value], [Sequence]) VALUES (45, 4, N'Practice', 0.0000, 2)
SET IDENTITY_INSERT [dbo].[TaskDefinitions] OFF
SET IDENTITY_INSERT [dbo].[ActivityStatus] ON
INSERT INTO [dbo].[ActivityStatus] ([Id], [Name]) VALUES (1, N'Incomplete')
INSERT INTO [dbo].[ActivityStatus] ([Id], [Name]) VALUES (2, N'Complete')
INSERT INTO [dbo].[ActivityStatus] ([Id], [Name]) VALUES (3, N'Blocked')
SET IDENTITY_INSERT [dbo].[ActivityStatus] OFF
SET IDENTITY_INSERT [dbo].[TransactionCategories] ON
INSERT INTO [dbo].[TransactionCategories] ([Id], [Name]) VALUES (1, N'Deposit   ')
INSERT INTO [dbo].[TransactionCategories] ([Id], [Name]) VALUES (2, N'Withdrawal')
SET IDENTITY_INSERT [dbo].[TransactionCategories] OFF
SET IDENTITY_INSERT [dbo].[Status] ON
INSERT INTO [dbo].[Status] ([Id], [Name]) VALUES (1, N'Open')
INSERT INTO [dbo].[Status] ([Id], [Name]) VALUES (2, N'Submitted')
INSERT INTO [dbo].[Status] ([Id], [Name]) VALUES (3, N'Accepted')
INSERT INTO [dbo].[Status] ([Id], [Name]) VALUES (4, N'Rejected')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[TaskGroups] ON
INSERT INTO [dbo].[TaskGroups] ([Id], [Name], [Weekly]) VALUES (1, N'Morning Chores', 0)
INSERT INTO [dbo].[TaskGroups] ([Id], [Name], [Weekly]) VALUES (2, N'Afternoon Chores', 0)
INSERT INTO [dbo].[TaskGroups] ([Id], [Name], [Weekly]) VALUES (3, N'Behaviour', 0)
INSERT INTO [dbo].[TaskGroups] ([Id], [Name], [Weekly]) VALUES (4, N'Weekly Goals', 1)
SET IDENTITY_INSERT [dbo].[TaskGroups] OFF
SET IDENTITY_INSERT [dbo].[Accounts] ON
INSERT INTO [dbo].[Accounts] ([Id], [Username], [RoleId], [Name], [Balance], [UserIdentifier]) VALUES (1, N'carlos@rocchetti.ca', 1, N'Carlos', 0.0000, N'd8ea463b-a476-42a3-8f03-162dd848e19f')
INSERT INTO [dbo].[Accounts] ([Id], [Username], [RoleId], [Name], [Balance], [UserIdentifier]) VALUES (2, N'sebastian@rocchetti.ca', 2, N'Sebastian', 32.2800, N'0ad66ff5-fad6-4e7c-a13b-65ddb3cb8476')
INSERT INTO [dbo].[Accounts] ([Id], [Username], [RoleId], [Name], [Balance], [UserIdentifier]) VALUES (3, N'alexandra@rocchetti.ca', 2, N'Alexandra', 38.5600, N'ee23a486-d618-40a7-a467-92edb968ac42')
INSERT INTO [dbo].[Accounts] ([Id], [Username], [RoleId], [Name], [Balance], [UserIdentifier]) VALUES (4, N'debbie@rocchetti.ca', 1, N'Debbie', 0.0000, N'059b2f48-45ba-44cd-aaf9-c0c9d38b49ab')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT INTO [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Parent')
INSERT INTO [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Child')
SET IDENTITY_INSERT [dbo].[Roles] OFF
ALTER TABLE [dbo].[Accounts]
    ADD CONSTRAINT [FK_Accounts_ToRoles] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([Id])
ALTER TABLE [dbo].[TaskDefinitions]
    ADD CONSTRAINT [FK_TaskDefinition_ToTaskGroups] FOREIGN KEY ([TaskGroupId]) REFERENCES [dbo].[TaskGroups] ([Id])
COMMIT TRANSACTION
