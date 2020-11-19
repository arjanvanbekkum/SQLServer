USE MASTER
GO

ALTER DATABASE tempdb MODIFY FILE (NAME = [tempdev] ,FILENAME = 'T:\Data\tempdev.mdf');
ALTER DATABASE tempdb MODIFY FILE (NAME = [temp2] ,FILENAME = 'T:\Data\temp2.mdf');
ALTER DATABASE tempdb MODIFY FILE (NAME = [templog] ,FILENAME = 'T:\Data\templog.ldf');
