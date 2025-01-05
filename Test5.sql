SELECT t.Guardian_ID, t.ICD_10_PCS_code, o.Patient_ID
FROM	  TREATMENT as t, OFFICIAL_HEALTH_RECORD as o
WHERE  o.Form_ID = t.Form_ID
AND    t.Guardian_ID IS NOT NULL
