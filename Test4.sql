SELECT i.Intaker_ID, o.Patient_ID, o.Form_ID
FROM   INTAKE as i, OFFICIAL_HEALTH_RECORD as o
WHERE  i.Form_ID = o.Form_ID
AND    (i.Intaker_ID, o.Patient_ID) IN (	SELECT   i1.Intaker_ID, o1.Patient_ID
										FROM	    OFFICIAL_HEALTH_RECORD as o1, INTAKE as i1
										WHERE    i1.Form_ID = o1.Form_ID
										GROUP BY o1.Patient_ID, i1.Intaker_ID
										HAVING   COUNT(o1.Form_ID) > 1)
