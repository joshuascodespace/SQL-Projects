USE C4707F24S001U29;

DROP DATABASE C4707F24S001U29;
CREATE DATABASE C4707F24S001U29;
USE C4707F24S001U29;

CREATE TABLE EMPLOYEE 
(Employee_ID INT NOT NULL,
Employee_Type VARCHAR(10) NOT NULL CHECK (Employee_Type IN ('Hourly', 'Salaried')),
Phone_number CHAR(10) NOT NULL,
Job_title VARCHAR(15) NOT NULL,
Fname VARCHAR(15) NOT NULL,
Minit CHAR(1) NOT NULL,
Lname VARCHAR(15) NOT NULL,
House_number VARCHAR(6) NOT NULL,
City VARCHAR(15) NOT NULL,
State CHAR(2) NOT NULL,
ZIP DECIMAL(5,0) NOT NULL,
Street VARCHAR(15) NOT NULL,
Dept_ID INT NOT NULL,
PRIMARY KEY (Employee_ID)
);

CREATE TABLE HOURLY
(Employee_ID INT NOT NULL,
Hourly_rate INT NOT NULL,
PRIMARY KEY (Employee_ID),
FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);

CREATE TABLE SALARIED
(Employee_ID INT NOT NULL,
Salary INT NOT NULL,
PRIMARY KEY (Employee_ID),
FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID));


CREATE TABLE SERVICE_PROVIDER
(Employee_ID INT NOT NULL,
PRIMARY KEY (Employee_ID),
FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID));

CREATE TABLE DEGREE
(Employee_ID INT NOT NULL,
College VARCHAR(15) NOT NULL,
Dtype VARCHAR(15) NOT NULL,
Dyear YEAR NOT NULL,
Dfield VARCHAR(15) NOT NULL,
PRIMARY KEY (Employee_ID, College, Dtype, Dyear, Dfield),
FOREIGN KEY (Employee_ID) REFERENCES SERVICE_PROVIDER(Employee_ID));

CREATE TABLE NURSE
(Employee_ID INT NOT NULL,
Nurse_ID INT NOT NULL UNIQUE,
PRIMARY KEY (Employee_ID),
FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);

CREATE TABLE LICENSE
(Employee_ID INT NOT NULL,
Expiration_date VARCHAR(15) NOT NULL,
License_type VARCHAR(15) NOT NULL,
Conferral_date VARCHAR(15) NOT NULL,
State CHAR(2) NOT NULL,
PRIMARY KEY (Employee_ID, Expiration_date, License_type, Conferral_date, State),
FOREIGN KEY (Employee_ID) REFERENCES NURSE(Employee_ID)
);

CREATE TABLE INTAKE_CLERK
(Employee_ID INT NOT NULL,
PRIMARY KEY (Employee_ID),
FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);

CREATE TABLE DEPARTMENT
(Dept_ID INT NOT NULL,
Dname VARCHAR(20) NOT NULL,
PRIMARY KEY (Dept_ID));

CREATE TABLE OFFICIAL_HEALTH_RECORD
(Form_ID INT NOT NULL,
Rdate VARCHAR(10) NOT NULL,
Rtime VARCHAR(5) NOT NULL,
Patient_ID INT NOT NULL,
PRIMARY KEY(Form_ID, Patient_ID)
);


ALTER TABLE OFFICIAL_HEALTH_RECORD
ADD CONSTRAINT UNIQUE (Form_ID);

CREATE TABLE TRANSCRIBED_NOTES
(Form_ID INT NOT NULL ,
Notes VARCHAR(200) NOT NULL,
Employee_ID INT NOT NULL,
PRIMARY KEY(Form_ID),
FOREIGN KEY (Employee_ID) REFERENCES NURSE(Employee_ID),
FOREIGN KEY (Form_ID) REFERENCES OFFICIAL_HEALTH_RECORD(Form_ID));

CREATE TABLE INITIAL_ASSESSMENT
(Form_ID INT NOT NULL,
Height INT NOT NULL,
Weight INT NOT NULL,
Body_temperature DECIMAL(3,1) NOT NULL,
Blood_pressure VARCHAR(6) NOT NULL,
Employee_ID INT NOT NULL,
PRIMARY KEY (Form_ID));

CREATE TABLE MEDICATION
(Form_ID INT NOT NULL,
Medication VARCHAR(30) NOT NULL,
PRIMARY KEY (Form_ID, Medication),
FOREIGN KEY (Form_ID) REFERENCES INITIAL_ASSESSMENT(Form_ID)
);

CREATE TABLE MEDICAL_CONDITION_DESCRIPTION
(Form_ID INT NOT NULL,
Medical_condition_description VARCHAR(200) NOT NULL,
PRIMARY KEY (Form_ID, Medical_condition_description), 
FOREIGN KEY (Form_ID) REFERENCES INITIAL_ASSESSMENT(Form_ID)
);

CREATE TABLE INTAKE
(Form_ID INT NOT NULL,
Itime VARCHAR(5) NOT NULL,
Co_pay INT NOT NULL,
Intaker_ID INT NOT NULL,
PRIMARY KEY (Form_ID),
FOREIGN KEY (Form_ID) REFERENCES OFFICIAL_HEALTH_RECORD(Form_ID));

CREATE TABLE PROVIDER_ASSESSMENT
(Form_ID INT NOT NULL,
Card_number DECIMAL(16,0) NOT NULL, 
Card_CVV DECIMAL(3,0) NOT NULL, 
Card_expiration CHAR(5) NOT NULL, 
Notes VARCHAR(200) NOT NULL, 
Provider_ID INT NOT NULL,
PRIMARY KEY (Form_ID),
FOREIGN KEY (Form_ID) REFERENCES OFFICIAL_HEALTH_RECORD(Form_ID)
);



CREATE TABLE DIAGNOSIS 
(Form_ID INT NOT NULL, 
ICD_10_CM_code VARCHAR(7) NOT NULL,
ICD_10_CM_name VARCHAR(80) NOT NULL,
PRIMARY KEY (Form_ID, ICD_10_CM_code));




CREATE TABLE TREATMENT
(Form_ID INT NOT NULL,
ICD_10_CM_code VARCHAR(7) NOT NULL,
Hard_copyID INT NOT NULL,
ICD_10_PCS_code VARCHAR(7) NOT NULL,
ICD_10_PCS_name VARCHAR(200) NOT NULL,
Cost REAL NOT NULL,
Guardian_ID INT,
Is_approved VARCHAR(3),
Signature VARCHAR(30),
PRIMARY KEY (Form_ID, ICD_10_CM_CODE, Hard_copyID),
FOREIGN KEY (Form_ID) REFERENCES DIAGNOSIS(Form_ID)
);

CREATE TABLE TEST_PROCEDURES
(Form_ID INT NOT NULL,
ICD_10_CM_code VARCHAR(7) NOT NULL,
Hard_copyID INT NOT NULL,
ICD_10_PCS_code VARCHAR(7) NOT NULL,
ICD_10_PCS_name VARCHAR(200) NOT NULL,
Cost REAL NOT NULL,
Guardian_ID INT,
Is_approved VARCHAR(3),
Signature VARCHAR(30),
PRIMARY KEY (Form_ID, ICD_10_CM_CODE, Hard_copyID),
FOREIGN KEY (Form_ID) REFERENCES DIAGNOSIS(Form_ID)
);

CREATE TABLE INSURANCE_PLAN
(Member_ID VARCHAR(15) NOT NULL,
Group_number VARCHAR(15) NOT NULL,
Company_name VARCHAR(15) NOT NULL,
Issuer_number VARCHAR(15) NOT NULL,
End_date CHAR(10) NOT NULL,
State CHAR(2) NOT NULL,
Care_type VARCHAR(15) NOT NULL,
Patient_ID INT NOT NULL,
PRIMARY KEY (Member_ID));

CREATE TABLE PATIENT
(Patient_ID INT NOT NULL,
Fname VARCHAR(15) NOT NULL,
Minit CHAR(1) NOT NULL,
Lname VARCHAR(15) NOT NULL,
House_number INT NOT NULL,
Street VARCHAR(30)NOT NULL,
City VARCHAR(15) NOT NULL,
State CHAR(2) NOT NULL,
ZIP DECIMAL(5,0) NOT NULL,
Birth_date VARCHAR(10) NOT NULL,
PRIMARY KEY (Patient_ID));


CREATE TABLE PATIENT_PHONE_NUMBER
(Patient_ID INT NOT NULL,
Phone_number BIGINT NOT NULL,
PRIMARY KEY (Patient_ID, Phone_number),
FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID));

CREATE TABLE GUARDIAN
(Guardian_ID INT NOT NULL,
Relationship VARCHAR(15) NOT NULL,
Phone_number BIGINT NOT NULL,
Email VARCHAR(30) NOT NULL,
Fname VARCHAR(15) NOT NULL,
Minit CHAR(1) NOT NULL,
Lname VARCHAR(15) NOT NULL,
House_number VARCHAR(6) NOT NULL,
Street VARCHAR(30) NOT NULL,
City VARCHAR(15) NOT NULL,
State CHAR(2) NOT NULL,
ZIP CHAR(5) NOT NULL,
PRIMARY KEY (Guardian_ID));

CREATE TABLE UNDER_GUARDIANSHIP
(Patient_ID INT,
Guardian_ID INT,
PRIMARY KEY (Patient_ID, Guardian_ID),
FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID),
FOREIGN KEY (Guardian_ID) REFERENCES GUARDIAN(Guardian_ID));





INSERT INTO EMPLOYEE
VALUES (00001,'Hourly',"1112223333", "Janitor", "John", "H", "Boggler", 42, "Maplewood", "MN", 55432, "Johnny Dr", 4), 
		(00002,'Salaried',"1122233334", "Nurse", "Patrick", "H", "Hodges", 420, "Little Canada", "MN", 55492, "Arnold Dr", 3),
		(00003,'Hourly',"2223334444", "Intake_Clerk", "Eckree", "N", "Poddles", 306, "Freckles Grove", "WI", 42953, "Fairview Corner", 1),
		(00004,'Salaried', "2123234454", "CEO", "Joshua", "M", "O’Neill", 3006, "Secret Avenue", "MN", 55555, "Woodbury", 2),
		(00005,'Salaried',"2723833454", "Doctor", "Melaney", "H", "Cargoship", 52, "Alive Avenue", "MN", 23490, "Lobbydon", 3),
		(00006,'Hourly', "2723833464", "HR Specialist", "Carl", "B", "Carly", 98, "Quintuplet Blvd", "AR", 23490, "Kingston", 5);

INSERT INTO HOURLY 
VALUES (00001,12), 
		(00004, 1000000),
		(00005, 120);

INSERT INTO SALARIED 
VALUES (00002,60000), 
		(00003,80000),
		(00006,45000);

INSERT INTO DEPARTMENT
VALUES (1, "Finance"),
		(2, "Administration"),
		(3, "Medical Care"),
		(4, "Building Upkeep"),
		(5, "Human Resources");

INSERT INTO SERVICE_PROVIDER
VALUES (00005);

INSERT INTO DEGREE
VALUES (00005, "McHamsFord", "Masters", 2012, "Medical"),
		(00005, "McHamsFord", "Bachelors", 2008, "Biology"),
		(00005, "McHamsFord", "Bachelors", 2008, "Chemistry");

INSERT INTO NURSE
VALUES (00002, 10001);

INSERT INTO LICENSE
VALUES (00002,"020922026", "RN", "04/09/2020", "MI");

INSERT INTO INTAKE_CLERK
VALUES (00003);

INSERT INTO OFFICIAL_HEALTH_RECORD
VALUES (20001, "06232022", "3:24", 30001),
		(20002, "05222021", "19:40", 30002),
		(20003, "02112023", "12:22", 30003),
		(20004, "05132009", "4:12", 30004),
		(20005, "11092017", "13:30", 30005),
		(20006, "09122019", "15:26", 30006);
        
INSERT INTO TRANSCRIBED_NOTES
VALUES (20001, "Insufferable. Though other than being a millennial, there’s nothing wrong with Charles", 00002),
		(20002, "He’s just suffering because he’s old", 00002),
		(20003, "She’s got the strangest ear lobe I’ve ever seen!", 00002),
		(20004, "Holy shit, is that an ugly child!", 00002),
		(20005, "Wow, I’ve never seen a child look that ugly!", 00002),
		(20006, "Child looks ugly… I wonder when children started looking so ugly.", 00002);
        
INSERT INTO INTAKE
VALUES (20001, "3:55", 900, 00003),
		(20002, "20:00", 1100, 00003),
		(20003, "12:45", 800, 00003),
		(20004, "4:20", 1600, 00003),
		(20005, "13:52", 1740, 00003),
		(20006, "15:40", 2560, 00003);

INSERT INTO PROVIDER_ASSESSMENT
VALUES (20001, 4111111111111111, 123, "12/25", "No bumps were founds; arm is smooth, and patient appears to be in good health", 00005),
		(20002, 5500000000000004, 456, "09/24", "Aches and pains in back, neck, and knees. His legs don’t work like they used to. Dry mouth, cannot swallow. Cannot sleep due to loud snoring", 00005),
		(20003, 6011000990139424, 789, "03/26", "The patient turned green and then melted to the ground", 00005),
		(20004, 378282246310005, 001, "06/25", "The top of her head sprang upwards like a cap off a soda can, bubbles fizzles upwards, fluid sprinkling outward, burned holes through the floor, causing the frame to collapse", 00005),
		(20005, 30569309025904, 234, "11/24", "Massive blood loss; tree is growing rapidly. He has ten days to live", 00005),
		(20006, 6011111111111117, 567, "08/27", "Memory loss implies either Alzheimer’s or depression. Too young to have Alzheimer’s, so patient is depressed by process of elimination", 00005);
        
INSERT INTO INITIAL_ASSESSMENT
VALUES (20001, 170, 65, 36.7, "120/80", 00002),
		(20002, 162, 54, 37.2, "115/75", 00002),
		(20003, 185, 78, 36.5, "122/82", 00002),
		(20004, 174, 70, 37.0, "118/76", 00002),
		(20005, 160, 50, 36.8, "110/70", 00002),
		(20006, 182, 85, 36.9, "125/85", 00002);

INSERT INTO MEDICATION
VALUES (20001, "Amoxicillin 500mg"),
		(20002, "Metformin 850mg"),
		(20002, "Lisinopril 10mg"),
		(20002, "Ibuprofen 200mg"),
		(20002, "Omeprazole 20mg"),
		(20002, "Atorvastatin 40mg"),
		(20002, "Albuterol Inhaler 90mcg"),
		(20004, "Hydrochlorothiazide 25mg"),
		(20005, "Cetirizine 10mg");

INSERT INTO MEDICAL_CONDITION_DESCRIPTION
VALUES (20001, "Random bumps under my arm. They leak fluid upon touch and itch"),
		(20002, "Everything hurts all the time"),
		(20003, "Occasionally turns green and body changes form becoming blob-like. Patient describes this experience as akin to melting"),
		(20004, "Bubbles come out from the top of the head, extending in all directions. Occurrence is roughly every hour. Bubbles pop and unleash highly corrosive fluid"),
		(20005, "After consuming gum, a tree has been growing inside the stomach. Tree ruptured stomach, causing major discomfort."),
		(20006, "Extreme dizziness, memory loss, and confusion");

INSERT INTO PATIENT
VALUES (30001, "Charles", "V", "Yabla", 238, "Velmore Ave", "Jamestown", "VR", 49012, "08221999"),
		(30002, "Jamie", "C", "Brown", 245, "Kenaston blvd", "Jamestown", "VR", 49012, "06301945"),
		(30003, "Bonnie", "D", "Jasonson", 233, "Peanut Butter Mountain dr", "Barnville", "CA", 12342, "02212002"),
		(30004, "Christina", "J", "Kellogg", 421, "Crispy Road", "Constantinople", "FL", 32012, "11112012"),
		(30005, "Easton", "R", "Evilkid", 4707, "Weird Street", "Bloomington", "IN", 47404, "01022015"),
		(30006, "Weston", "R", "Evilkid", 4707, "Weird Street", "Bloomington", "IN", 47404, "05292013");

INSERT INTO PATIENT_PHONE_NUMBER
VALUES (30001, 8389792242),
		(30002, 5853539999),
		(30003, 1232343333),
		(30003, 6863432211),
		(30004, 2322922882),
		(30005, 1919191919),
		(30006, 2828163322);
        
INSERT INTO INSURANCE_PLAN
VALUES ("A12345", "G6789", "HealthFirst", "0456", "20251231", "NY", "HMO", 30001),
		("B23456", "G7890", "MediPlus", "0567", "20230630", "CA", "PPO", 30001),
		("C34567", "G8901", "LifeCare", "0678", "20210915", "TX", "EPO", 30001),
		("D45678", "G9012", "WellGuard", "0789", "20250320", "FL", "HMO", 30002),
		("E56789", "G0123", "OptiHealth", "0890", "20270101", "IL", "PPO", 30002),
		("F67890", "G1234", "CareTrust", "0912", "20211130", "WA", "POS", 30003),
		("G78901", "G2345", "PrimeHealth", "1023", "20260731", "AZ", "HMO", 30004),
		("H89012", "G3456", "SecurePlus", "1134", "20250515", "MI", "PPO", 30005),
		("I90123", "G4567", "EliteCare", "1245", "20260228", "CO", "EPO", 30006);
        
INSERT INTO GUARDIAN
VALUES (40001, "Father", 2423534646, "arnoldevilkid@gmail.com", "Arnold", "K", "Evilkid", 4707, "Weird Street", "Bloomington", "IN", 47404),
		(40002, "Mother", 5656767878, "emilyevilkid@gmail.com", "Emily", "K", "Evilkid", 4707, "Weird Street", "Bloomington", "IN", 47404),
		(40003, "Sister", 8687574343, "karissakellogg5@gmail.com", "Karissa", "N", "Kellogg", 421, "Crispy Road", "Constantinople", "FL", 32012),
		(40004, "Grandpa", 4649792222, "frankjerrgobber@gmail.com", "Frank", "P", "Jerrgobber", 192, "Frantic Village Road", "Frantic Village", "AL", 12390);
        
INSERT INTO UNDER_GUARDIANSHIP
VALUES (30004, 40003),
		(30005, 40001),
		(30005, 40002),
		(30006, 40001),
		(30006, 40002);
        
INSERT INTO DIAGNOSIS
VALUES (20001, "L72.3", "Sebaceous cyst"),
		(20002, "M79.7", "Fibromyalgia"),
		(20003, "F48.9", "Unspecified neurotic disorder"),
		(20004, "L98.9", "Disorder of the skin and subcutaneous tissue, unspecified"),
		(20005, "K31.0", "Acute gastritis with bleeding"),
		(20006, "F33.1", "Major depressive disorder, recurrent, moderate");

INSERT INTO TREATMENT
VALUES (20001, "L72.3", 50001, "0HB1XZZ", "Excision of skin, external approach", 22000, NULL, NULL, NULL),
		(20002, "M79.7", 50002, "8E0ZXY1", "Physical therapy, general", 1500, NULL, NULL, NULL),
		(20003, "F48.9", 50003, "GZ59ZZZ", "Counseling", 2100, NULL, NULL, NULL),
		(20004, "L89.9", 50004, "3E0U3GC", "Introduction of topical substance into skin or mucous membrane", 25000, 40003, "yes", "Karissa"),
		(20005, "K31.0", 50005, "0DB60ZZ", "Excision of stomach", 51000, 40002, "yes", "Emily"),
		(20006, "F33.1", 50006, "GZ54ZZZ", "Cognitive behavioral therapy", 5000, 40002, "yes", "Emily");
        
INSERT INTO TEST_PROCEDURES
VALUES (20001, "L72.3", 60001, "B308ZZZ", "Ultrasonography of skin and subcutaneous tissue", 6000, NULL, NULL, NULL),
		(20002, "M79.7", 60002, "F008ZZZ", "Sleep study", 900, NULL, NULL, NULL),
		(20003, "F48.9", 60003, "B030ZZZ", "MRI of brain", 6300, NULL, NULL, NULL),
		(20004, "L98.9", 60004, "B218ZZZ", "Fluoroscopy of head and neck soft tissue", 2000, 40003, "yes", "Karissa"),
		(20005, "K31.0", 60005, "B210ZZZ", "Endoscopy of stomach", 2500, 40001, "Yes", "Arnold"),
		(20006, "F33.1", 60006, "GZ54ZZZ", "Measurement of neurotransmitters", 3000, 40001, "Yes", "Arnold");


