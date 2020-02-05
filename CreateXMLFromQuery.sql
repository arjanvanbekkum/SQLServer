
  SELECT 1                AS TAG
  ,      NULL             AS PARENT
  ,      NULL             AS [CARTYPES!1!DUMMY!HIDE]
  ,      NULL             AS [CARTYPE!2!CODE!ELEMENT]
  ,      NULL             AS [CARTYPE!2!DESCRIPTION!ELEMENT]
  UNION ALL
  SELECT 2                -- TAG
  ,      1                -- PARENT
  ,      NULL             -- [CARTYPES!1!DUMMY!HIDE]
  ,      MTBL.CODE        -- [CARTYPE!2!CODE!ELEMENT]
  ,      MTBL.DESCRIPTION -- [CARTYPE!2!DESCRIPTION!ELEMENT]
  FROM   MYTABLE MTBL
  ORDER BY
         [CARTYPES!1!DUMMY!HIDE]
  ,      [CARTYPE!2!CODE!ELEMENT]
  FOR XML EXPLICIT


