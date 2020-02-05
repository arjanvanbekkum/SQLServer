SELECT P. NAME, S .LAST_EXECUTION_TIME, S.EXECUTION_COUNT AS TOTAL_EXECUTION_COUNT
FROM SYS.PROCEDURES AS P
LEFT OUTER JOIN SYS.DM_EXEC_PROCEDURE_STATS AS S ON P. [OBJECT_ID] = S.[OBJECT_ID]
ORDER BY S.LAST_EXECUTION_TIME , P. NAME;

