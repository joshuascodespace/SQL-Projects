INSERT INTO OFFICIAL_HEALTH_RECORD
VALUES (20007, "05222022", "8:25", 30002);
		
INSERT INTO TRANSCRIBED_NOTES
VALUES (20007, "Still old. Still suffering.", 00002);


INSERT INTO INTAKE
VALUES (20007, "9:00", 1100, 00003);
		
INSERT INTO PROVIDER_ASSESSMENT
VALUES (20007, 5500000000000004, 456, "09/24", "Bones are degrading. Muscles are degrading. Brain is degrading. I’m so glad doctors die early. I never want to be this old.", 00005);


 
INSERT INTO INITIAL_ASSESSMENT
VALUES (20007, 142, 51, 36.2, "125/75", 00002);




INSERT INTO MEDICATION
VALUES (20007, "Metformin 850mg"),
		(20007, "Lisinopril 10mg"),
		(20007, "Ibuprofen 200mg"),
		(20007, "Omeprazole 20mg"),
		(20007, "Atorvastatin 40mg"),
		(20007, "Albuterol Inhaler 90mcg"),
		(20007, "Curexel 50mg"),
		(20007, "Somnuvex 70mg");




INSERT INTO MEDICAL_CONDITION_DESCRIPTION
VALUES (20007, "Everything still hurts, I feel tired when I lay down, and everything still is painful even when I am laying down. I need help.");


INSERT INTO DIAGNOSIS
VALUES (20007, "M81.0", "Age-related osteoporosis without current pathological fracture"),
		(20007, "M79.7", "Fibromyalgia");




INSERT INTO TREATMENT
VALUES (20007, "M81.0", 50007, "3E0U3GC", "Introduction of Zoledronic Acid into Peripheral Vein, Percutaneous Approach", 9000, NULL, NULL, NULL),
		(20007, "M79.7", 50008, "8E0ZXY1", "Physical therapy, general", 1500, NULL, NULL, NULL);




INSERT INTO TEST_PROCEDURES
VALUES (20007, "M79.7", 60007, "F008ZZZ", "Sleep study", 900, NULL, NULL, NULL),
		(20007, "M81.0", 60008, "BP3LZZZ", "Magnetic Resonance Imaging (MRI) of Brain To evaluate potential neurological decline indicated by “brain is degrading.”", 6000, NULL, NULL, NULL),
		(20007, "M81.0", 60009, "BPJLYZZ", "Dual-Energy X-Ray Absorptiometry (DXA) To confirm and measure the extent of osteoporosis and bone degradation.", 9000, NULL, NULL, NULL),
		(20007, "M81.0", 60010, "B215YZZ", "Plain Radiography of Spine To assess any potential fractures or structural issues contributing to pain.", 6000, NULL, NULL, NULL),
		(20007, "M81.0", 60011, "4A00X4Z", "Measurement of Blood Chemistry To evaluate levels of calcium, vitamin D, and other markers that affect bone health.", 1200, NULL, NULL, NULL),
		(20007, "M81.0", 60012, "5A1D70Z", "Monitoring of Cardiac Rhythm, External Approach Given the patient’s fatigue and pain while lying down, there may be an underlying cardiac or systemic issue needing investigation.", 4800, NULL, NULL, NULL);
        
-- INSERT INTO TEST_PROCEDURES
-- VALUES (20007, "M81.0", 60012, "5A1D70Z", "Monitoring of Cardiac Rhythm, External Approach Given the patient’s fatigue and pain while lying down, there may be an underlying cardiac or systemic issue needing investigation.", 4800, NULL, NULL, NULL);
