SELECT 
  MYTBL.CODE,
  CASE MYTBL.CODE
    WHEN 'A' THEN 'ALL'
    WHEN 'M' THEN 'MOST'  
    WHEN 'N' THEN 'NOTHING'      
    ELSE 'UNKNOWN CODE'
  END                                                  
FROM MYTABLE MYTBL