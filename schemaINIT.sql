CREATE SCHEMA common_credit_app; 
-- Create the ACCOUNT_CREATION table
DROP TABLE IF EXISTS ACCOUNT_CREATION;
CREATE TABLE ACCOUNT_CREATION (
    uname VARCHAR(50) PRIMARY KEY,  -- Primary key for user accounts (username)
    fname VARCHAR(255) NOT NULL,    -- First name
    lname VARCHAR(255) NOT NULL,    -- Last name
    bdate DATE NOT NULL,            -- Birthdate
    email VARCHAR(255) NOT NULL     -- Email
);

-- Create the Students table with foreign key referencing ACCOUNT_CREATION
DROP TABLE IF EXISTS students;
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,     -- Primary key for students
    name VARCHAR(255) NOT NULL,                    -- Student's name
    gpa DECIMAL(3,2) NOT NULL,                     -- GPA
    year_in_school INT NOT NULL,                   -- Year in school
    major_category VARCHAR(50) NOT NULL,           -- Major category
    work_history_years DECIMAL(3,1) NOT NULL,      -- Work history in years
    parental_income DECIMAL(15,2) NOT NULL,        -- Parental income
    credit_score INT,                              -- Credit score
    uname VARCHAR(50),                             -- Foreign key from ACCOUNT_CREATION (username)
    FOREIGN KEY (uname) REFERENCES ACCOUNT_CREATION(uname)  -- Define foreign key constraint
);

-- Create the Payments table with foreign key referencing Students
DROP TABLE IF EXISTS payments;
CREATE TABLE Payments (
	student_id INT,
    payment_date DATE NOT NULL,                    -- Payment date
    on_time BOOLEAN NOT NULL,                      -- Whether the payment was on time
    FOREIGN KEY (student_id) REFERENCES Students(student_id)  -- Define foreign key constraint
);
