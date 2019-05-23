/*
   Thursday, May 23, 201912:27:31 AM
   User: sa
   Server: DESKTOP-L5BRUUB\SQLEXPRESS
   Database: OnlineStoreDB
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
EXECUTE sp_rename N'dbo.UserAddress.UserId', N'Tmp_CustomerId', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.UserAddress.Tmp_CustomerId', N'CustomerId', 'COLUMN' 
GO
ALTER TABLE dbo.UserAddress SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
