# SQL-Projects
SQL code used to create and test a medical database, along with diagrams created to model the database.

Test1.sql, Test2.sql, Test3.sql, Test4.sql, Test5.sql, and TestData.sql are all created by myself.
ERDiagram_Team29.jpeg and ERDiagramMapping_Team29.jpeg were designed by the collective efforts of myself, Sarah Smith, Salma Shire, and Thanmayee Boyapati.
The constraints in MakeMedicalDatabase.sql were written by Thanmayee Boyapati, the table creations were written by Sarah Smith, and "INSERT INTO" statements were created by myself.

ORDER TO RUN: 
  MakeMedicalDatabase.sql
  TestData.sql
  {Any of the Test#.sql files}

FILE DESCRIPTIONS:
  MakeMedicalDatabase.sql:
    -Creates all tables
    -Assigns constraints
    -Populates database with some initial data

  TestData.sql
    -Populates database with more data specific to the testing queries

  Test#.sql
    -Runs a query to check the associated #'s testing requirements
    -Test1.sql checks whether a patient can have two different visits with the same diagnosis by returning two rows in which the patient and diagnosis are the same, but the visit differs.
    -Test2.sql checks whether a patient can have two different visits with the same treatment by returning two rows in which the patient and treatment are the same, but the visit differs.
    -Test3.sql checks whether it is possible to see which doctor made a diagnosis or prescribed a treatment for a given visit. It returns all visits, the diagnoses and treatments, along with which doctor was responsible for these diagnoses and treatments.
    -Test4.sql checks whether an intake clerk can have two different visits with the same patient by returning two rows in which the patient and intake clerk are the same, but the visit differs.
    -Test5.sql checks whether it is possible to see which parent/guardian approved a treatment for a given minor patient. It returns all treatments approved on minors along with their corresponding signatures.











# SQL-Projects

SQL code used to create and test a medical database, along with diagrams created to model the database.

Test1.sql, Test2.sql, Test3.sql, Test4.sql, Test5.sql, and TestData.sql are all created by myself.  
ERDiagram_Team29.jpeg and ERDiagramMapping_Team29.jpeg were designed by the collective efforts of myself, Sarah Smith, Salma Shire, and Thanmayee Boyapati.  
The constraints in `MakeMedicalDatabase.sql` were written by Thanmayee Boyapati, the table creations were written by Sarah Smith, and the `INSERT INTO` statements were created by myself.

## ORDER TO RUN
1. `MakeMedicalDatabase.sql`
2. `TestData.sql`
3. Any of the `Test#.sql` files

## FILE DESCRIPTIONS

### `MakeMedicalDatabase.sql`
- Creates all tables  
- Assigns constraints  
- Populates database with some initial data  

### `TestData.sql`
- Populates database with more data specific to the testing queries  

### `Test#.sql`
Runs a query to check the associated testing requirements:
- **`Test1.sql`**  
  Checks whether a patient can have two different visits with the same diagnosis by returning two rows in which the patient and diagnosis are the same, but the visit differs.  
- **`Test2.sql`**  
  Checks whether a patient can have two different visits with the same treatment by returning two rows in which the patient and treatment are the same, but the visit differs.  
- **`Test3.sql`**  
  Checks whether it is possible to see which doctor made a diagnosis or prescribed a treatment for a given visit. It returns all visits, the diagnoses and treatments, along with which doctor was responsible for these diagnoses and treatments.  
- **`Test4.sql`**  
  Checks whether an intake clerk can have two different visits with the same patient by returning two rows in which the patient and intake clerk are the same, but the visit differs.  
- **`Test5.sql`**  
  Checks whether it is possible to see which parent/guardian approved a treatment for a given minor patient. It returns all treatments approved on minors along with their corresponding signatures.  
