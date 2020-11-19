USE msdb;  
GO  

EXEC dbo.sp_add_job  
   @job_name = N'DailyMaintenance',   
   @enabled = 1,   
   @description = N'Execute maintenance of the  database' ;   
GO  

EXEC dbo.sp_add_jobstep  
    @job_name = N'DailyMaintenance',   
    @step_name = N'execute daily maintenance',   
    @subsystem = N'TSQL',   
    @command = N'USE [wcs]  
                 GO  

EXECUTE [dbo].[sp_FrameworkDatabaseMaintenance]; 
GO  
',   
    @retry_attempts = 5,   
    @retry_interval = 5 ;   
GO  

EXEC dbo.sp_add_schedule  
    @schedule_name = N'DailyMaintenance_wcs',   
    @freq_type = 4,   
    @freq_interval = 1,   
    @active_start_time = 071500 ;   
GO  

EXEC sp_attach_schedule  
   @job_name = N'DailyMaintenance',  
   @schedule_name = N'DailyMaintenance_wcs' ;   
GO

EXEC sp_add_jobserver 
	@job_name = N'DailyMaintenance'
GO

/* weekly maintenance job */

USE msdb;  
GO  

EXEC dbo.sp_add_job  
   @job_name = N'WeeklyMaintenance',   
   @enabled = 1,   
   @description = N'Execute Weekly maintenance of the  database' ;   
GO  

EXEC dbo.sp_add_jobstep  
    @job_name = N'WeeklyMaintenance',   
    @step_name = N'execute Weekly maintenance',   
    @subsystem = N'TSQL',   
    @command = N'USE [wcs]  
                 GO  

EXECUTE  [dbo].[sp_FrameworkDatabaseMaintenance] @updateusage=1,@rebuildallindexesoffline=1,@updatestats=1,@dropautostats=1,@updateallstats=1
GO  
',   
    @retry_attempts = 5,   
    @retry_interval = 5 ;   
GO  

EXEC dbo.sp_add_schedule  
    @schedule_name = N'WeeklyMaintenance_wcs',   
    @freq_type = 4,   
    @freq_interval = 1,   
    @active_start_time = 071500 ;   
GO  

EXEC sp_attach_schedule  
   @job_name = N'WeeklyMaintenance',  
   @schedule_name = N'WeeklyMaintenance_wcs' ;   
GO

EXEC sp_add_jobserver 
	@job_name = N'WeeklyMaintenance'
GO