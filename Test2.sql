SELECT o.Patient_ID, o.Form_ID, t.ICD_10_PCS_code
FROM OFFICIAL_HEALTH_RECORD as o, TREATMENT as t
WHERE 	o.Form_ID = t.Form_ID
AND		(o.Patient_ID, t.ICD_10_PCS_code) IN (	SELECT   o1.Patient_ID, t1.ICD_10_PCS_code
											FROM     TREATMENT as t1, OFFICIAL_HEALTH_RECORD as o1
											WHERE    t1.Form_ID = o1.Form_ID
											GROUP BY t1.ICD_10_PCS_code, o1.Patient_ID
											HAVING COUNT(o1.Form_ID) > 1)
