SELECT o.Patient_ID, o.Form_ID, d.ICD_10_CM_code
FROM OFFICIAL_HEALTH_RECORD as o, DIAGNOSIS as d
WHERE 	o.Form_ID = d.Form_ID
AND		(o.Patient_ID, d.ICD_10_CM_code) IN (	SELECT   o1.Patient_ID, d1.ICD_10_CM_code
										FROM     DIAGNOSIS as d1, OFFICIAL_HEALTH_RECORD as o1
										WHERE    d1.Form_ID = o1.Form_ID
										GROUP BY d1.ICD_10_CM_code, o1.Patient_ID
										HAVING COUNT(*) > 1)
