USE master
GO
-- Variable Declaration Section: Do NOT change this section
DECLARE @hpc_datapath nvarchar(256);
SET @hpc_datapath = 'D:\Data';
DECLARE @DBNAME nvarchar(256);
DECLARE @SQL_CREATE_DB nvarchar(2000);
DECLARE @exist INT

SET @DBNAME = @hpc_datapath +'\ca.mdf'
exec master.dbo.xp_fileexist @DBNAME, @exist OUTPUT
SET @exist = CAST(@exist AS BIT)
SET @SQL_CREATE_DB = 'CREATE DATABASE ca 
ON 
(
	NAME = ca_data, 
	FILENAME = ''' + @hpc_datapath + '\ca.mdf'', 
	size = 1024MB, 
	FILEGROWTH  = 50% 
) 
LOG ON 
( 
	NAME = ca_log,
	FILENAME = ''' + @hpc_datapath +'\ca.ldf'',
	size = 128MB,	
	FILEGROWTH  = 50% 
)'

IF (@exist = 1)
  SET @SQL_CREATE_DB = @SQL_CREATE_DB + ' FOR ATTACH;'

IF (NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE ([name] = 'ca' ) ) )
IF NULLIF(@hpc_datapath, '') IS NOT NULL
EXECUTE (@SQL_CREATE_DB)

SET @DBNAME = @hpc_datapath +'\wcs.mdf'
exec master.dbo.xp_fileexist @DBNAME, @exist OUTPUT
SET @exist = CAST(@exist AS BIT)
SET @SQL_CREATE_DB = 'CREATE DATABASE wcs 
ON 
(
	NAME = wcs_data, 
	FILENAME = ''' + @hpc_datapath + '\wcs.mdf'', 
	size = 1024MB, 
	FILEGROWTH  = 50% 
) 
LOG ON 
( 
	NAME = wcs_log,
	FILENAME = ''' + @hpc_datapath +'\wcs.ldf'',
	size = 128MB,	
	FILEGROWTH  = 50% 
)'

IF (@exist = 1)
  SET @SQL_CREATE_DB = @SQL_CREATE_DB + ' FOR ATTACH;'

IF (NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE ([name] = 'wcs' ) ) )
IF NULLIF(@hpc_datapath, '') IS NOT NULL
EXECUTE (@SQL_CREATE_DB)