SELECT p.Provider_ID, t.Form_ID, t.ICD_10_CM_code, t.ICD_10_PCS_code
FROM	  TREATMENT as t, PROVIDER_ASSESSMENT as p
WHERE  t.Form_ID = p.Form_ID
