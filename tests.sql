-- Insert into ACCOUNT_CREATION table
INSERT INTO ACCOUNT_CREATION (uname, fname, lname, bdate, email)
VALUES 
('jdoe1', 'John', 'Doe', '2001-03-12', 'john.doe1@example.com'),
('jdoe2', 'Jane', 'Doe', '2000-05-15', 'jane.doe2@example.com'),
('asmith', 'Alice', 'Smith', '1999-08-22', 'alice.smith@example.com'),
('bwhite', 'Bob', 'White', '2002-01-18', 'bob.white@example.com'),
('cjohnson', 'Charlie', 'Johnson', '2001-10-09', 'charlie.johnson@example.com'),
('ddavis', 'Diana', 'Davis', '2001-06-20', 'diana.davis@example.com'),
('ewilliams', 'Ethan', 'Williams', '2000-12-05', 'ethan.williams@example.com'),
('fwilson', 'Faith', 'Wilson', '2002-07-11', 'faith.wilson@example.com'),
('gclark', 'George', 'Clark', '2001-11-30', 'george.clark@example.com'),
('hharris', 'Hannah', 'Harris', '2000-03-04', 'hannah.harris@example.com'),
('ijones', 'Ian', 'Jones', '1999-05-22', 'ian.jones@example.com'),
('krobinson', 'Kyle', 'Robinson', '2002-09-17', 'kyle.robinson@example.com'),
('lmiller', 'Lily', 'Miller', '2001-04-25', 'lily.miller@example.com'),
('mmartin', 'Michael', 'Martin', '1999-12-30', 'michael.martin@example.com'),
('nlopez', 'Nina', 'Lopez', '2001-07-13', 'nina.lopez@example.com'),
('opatton', 'Oscar', 'Patton', '2000-11-29', 'oscar.patton@example.com'),
('pperez', 'Paula', 'Perez', '2001-02-10', 'paula.perez@example.com'),
('qrivers', 'Quinn', 'Rivers', '2002-06-21', 'quinn.rivers@example.com'),
('rgarcia', 'Rosa', 'Garcia', '2001-08-05', 'rosa.garcia@example.com'),
('tturner', 'Tom', 'Turner', '2001-03-18', 'tom.turner@example.com');

-- Insert into Students table
INSERT INTO Students (gpa, year_in_school, major_category, work_history_years, parental_income, uname)
VALUES
(3.5, 3, 'STEM', 1.5, 85000, 'jdoe1'),
(3.8, 4, 'Business and Management', 2.0, 95000, 'jdoe2'),
(2.9, 2, 'Humanities', 0.5, 60000, 'asmith'),
(3.2, 1, 'Social Science', 0.0, 50000, 'bwhite'),
(3.9, 4, 'STEM', 2.5, 100000, 'cjohnson'),
(3.1, 3, 'Business and Management', 1.0, 75000, 'ddavis'),
(2.7, 2, 'Art and Fine Arts', 0.0, 40000, 'ewilliams'),
(3.6, 4, 'STEM', 2.0, 90000, 'fwilson'),
(3.3, 3, 'Business and Management', 1.5, 80000, 'gclark'),
(2.5, 1, 'Humanities', 0.0, 35000, 'hharris'),
(3.7, 4, 'STEM', 3.0, 110000, 'ijones'),
(3.4, 2, 'Social Science', 0.5, 65000, 'krobinson'),
(3.0, 3, 'Business and Management', 1.5, 70000, 'lmiller'),
(2.8, 1, 'Art and Fine Arts', 0.0, 42000, 'mmartin'),
(3.9, 4, 'STEM', 2.5, 120000, 'nlopez'),
(2.6, 2, 'Social Science', 0.0, 48000, 'opatton'),
(3.2, 3, 'Humanities', 1.0, 55000, 'pperez'),
(3.5, 4, 'STEM', 2.5, 94000, 'qrivers'),
(3.1, 2, 'Business and Management', 1.0, 78000, 'rgarcia'),
(3.6, 4, 'STEM', 2.0, 87000, 'tturner');

-- Insert payment data into Payments table
INSERT INTO Payments (student_id, payment_date, on_time)
VALUES
-- John Doe 1 (jdoe1)
(1, '2024-09-15', TRUE),
(1, '2024-08-01', TRUE),
(1, '2024-07-01', FALSE),

-- Jane Doe 2 (jdoe2)
(2, '2024-09-10', TRUE),
(2, '2024-08-10', TRUE),
(2, '2024-06-01', TRUE),
(2, '2024-03-01', FALSE),

-- Alice Smith (asmith)
(3, '2024-09-05', FALSE),
(3, '2024-06-15', TRUE),

-- Bob White (bwhite)
(4, '2024-09-20', TRUE),

-- Charlie Johnson (cjohnson)
(5, '2024-09-01', TRUE),
(5, '2024-08-01', TRUE),

-- Diana Davis (ddavis)
(6, '2024-09-12', TRUE),
(6, '2024-05-30', FALSE),

-- Ethan Williams (ewilliams)
(7, '2024-08-28', TRUE),
(7, '2024-07-15', FALSE),

-- Faith Wilson (fwilson)
(8, '2024-09-25', TRUE),
(8, '2024-08-12', TRUE),
(8, '2024-07-20', TRUE),

-- George Clark (gclark)
(9, '2024-09-15', FALSE),
(9, '2024-06-30', TRUE),

-- Hannah Harris (hharris)
(10, '2024-09-10', TRUE),
(10, '2024-05-20', FALSE),

-- Ian Jones (ijones)
(11, '2024-09-05', TRUE),
(11, '2024-08-10', TRUE),

-- Kyle Robinson (krobinson)
(12, '2024-08-20', FALSE),

-- Lily Miller (lmiller)
(13, '2024-07-25', TRUE),

-- Michael Martin (mmartin)
(14, '2024-08-05', TRUE),

-- Nina Lopez (nlopez)
(15, '2024-07-10', TRUE),

-- Oscar Patton (opatton)
(16, '2024-08-01', TRUE),

-- Paula Perez (pperez)
(17, '2024-06-30', TRUE),

-- Quinn Rivers (qrivers)
(18, '2024-09-05', FALSE),
(18, '2024-07-15', TRUE),

-- Rosa Garcia (rgarcia)
(19, '2024-08-25', TRUE),

-- Tom Turner (tturner)
(20, '2024-09-18', TRUE);
