-- Drop the database if it exists
DROP DATABASE IF EXISTS ACTORS_BOOKING;

-- Create and select the database
CREATE DATABASE ACTORS_BOOKING;
USE ACTORS_BOOKING;


CREATE TABLE Actor (
    ActorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ActorContactInfo VARCHAR(100),
    DateOfBirth DATE,
	Gender CHAR(1),
    Ethnicity VARCHAR(50),
    Height VARCHAR(50),
    Weight VARCHAR(50),
    EyeColor VARCHAR(20),
    HairColor VARCHAR(20),
    Region VARCHAR(50),
    City VARCHAR(50),
    IsActive BOOLEAN
);

CREATE TABLE Agency (
    AgencyID INT PRIMARY KEY,
    AgencyName VARCHAR(100),
    AgencyContactInfo VARCHAR(100)
);

CREATE TABLE Agent (
    AgentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    AgentContactInfo VARCHAR(100),
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES Agency(AgencyID)
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(15, 2)
);

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    ActorID INT,
    ProjectID INT,
    BookingDate DATE,
    Role VARCHAR(100),
    FOREIGN KEY (ActorID) REFERENCES Actor(ActorID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    ActorID INT,
    ProjectID INT,
    Rating INT,
    Comments VARCHAR(255),
    FOREIGN KEY (ActorID) REFERENCES Actor(ActorID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(15, 2),
    PaymentDate DATE,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

CREATE TABLE AgencyProject (
    AgencyProjectID INT PRIMARY KEY,
    AgencyID INT,
    ProjectID INT,
    FOREIGN KEY (AgencyID) REFERENCES Agency(AgencyID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

CREATE TABLE Skill (
    SkillID INT PRIMARY KEY,
    SkillName VARCHAR(100)
);

CREATE TABLE ActorSkill (
    ActorSkillID INT PRIMARY KEY,
    ActorID INT,
    SkillID INT,
    FOREIGN KEY (ActorID) REFERENCES Actor(ActorID),
    FOREIGN KEY (SkillID) REFERENCES Skill(SkillID)
);
INSERT INTO Actor (ActorID, FirstName, LastName, ActorContactInfo, DateOfBirth, Gender, Ethnicity, Height, Weight, EyeColor, HairColor, Region, City, IsActive)
VALUES
(1, 'John', 'Doe', 'john.newemail@example.com', '1985-02-15', 'M', 'Caucasian', '5ft 10in', '160 lbs', 'Blue', 'Blonde', 'West', 'Los Angeles', TRUE),
(2, 'Jane', 'Smith', 'jane.newemail@example.com','1990-06-25', 'F', 'African American', '5ft 6in', '140 lbs', 'Brown', 'Black', 'South', 'Houston', TRUE),
(3, 'Michael', 'Johnson', 'michael.newemail@example.com','1978-12-10', 'M', 'Hispanic', '6ft 1in', '180 lbs', 'Green', 'Brown', 'East', 'New York', TRUE),
(4, 'Emily', 'Williams', 'emily.newemail@example.com','1988-11-03', 'F', 'Asian', '5ft 4in', '120 lbs', 'Hazel', 'Black', 'Midwest', 'Chicago', FALSE),
(5, 'Chris', 'Brown', 'chris.newemail@example.com','1982-09-17', 'M', 'Caucasian', '5ft 9in', '170 lbs', 'Blue', 'Blonde', 'West', 'San Francisco', TRUE),
(6, 'Sarah', 'Miller', 'sarah.newemail@example.com','1995-05-20', 'F', 'Hispanic', '5ft 3in', '130 lbs', 'Brown', 'Black', 'South', 'Miami', TRUE),
(7, 'David', 'Garcia', 'david.newemail@example.com','1980-07-30', 'M', 'Asian', '5ft 8in', '150 lbs', 'Black', 'Brown', 'East', 'Boston', TRUE),
(8, 'Laura', 'Martinez', 'laura.newemail@example.com','1989-04-10', 'F', 'Caucasian', '5ft 7in', '140 lbs', 'Blue', 'Blonde', 'Midwest', 'Detroit', false),
(9, 'Robert', 'Anderson', 'robert.newemail@example.com','1975-01-05', 'M', 'African American', '6ft 0in', '200 lbs', 'Brown', 'Black', 'West', 'Seattle', TRUE),
(10, 'Sophia', 'Moore', 'sophia.newemail@example.com','1993-08-22', 'F', 'Hispanic', '5ft 5in', '135 lbs', 'Green', 'Brown', 'South', 'Atlanta', TRUE),
(11, 'James', 'Taylor', 'james.newemail@example.com','1984-03-14', 'M', 'Asian', '5ft 11in', '175 lbs', 'Hazel', 'Black', 'East', 'Philadelphia', TRUE),
(12, 'Olivia', 'Thomas', 'olivia.newemail@example.com','1991-12-19', 'F', 'Caucasian', '5ft 6in', '145 lbs', 'Blue', 'Blonde', 'Midwest', 'Minneapolis', TRUE),
(13, 'William', 'Lee', 'william.newemail@example.com','1987-10-07', 'M', 'African American', '6ft 2in', '190 lbs', 'Brown', 'Black', 'West', 'Denver', TRUE),
(14, 'Ava', 'Harris', 'ava.newemail@example.com','1994-07-15', 'F', 'Hispanic', '5ft 4in', '125 lbs', 'Green', 'Brown', 'South', 'New Orleans', TRUE),
(15, 'Daniel', 'Clark', 'daniel.newemail@example.com','1979-05-28', 'M', 'Caucasian', '5ft 10in', '160 lbs', 'Blue', 'Blonde', 'East', 'Baltimore', TRUE),
(16, 'Ethan', 'Baker', 'ethan.newemail@example.com','1983-08-12', 'M', 'Caucasian', '6ft 0in', '180 lbs', 'Brown', 'Brown', 'West', 'Los Angeles', FALSE),
(17, 'Madison', 'Young', 'madison.newemail@example.com','1992-04-05', 'F', 'African American', '5ft 7in', '150 lbs', 'Brown', 'Black', 'South', 'Houston', TRUE),
(18, 'Christopher', 'White', 'christopher.newemail@example.com','1977-11-20', 'M', 'Hispanic', '5ft 8in', '170 lbs', 'Brown', 'Black', 'East', 'New York', TRUE),
(19, 'Isabella', 'Scott', 'isabella.newemail@example.com','1986-10-03', 'F', 'Asian', '5ft 5in', '120 lbs', 'Brown', 'Black', 'Midwest', 'Chicago', TRUE),
(20, 'Andrew', 'Allen', 'Andrew.newemail@example.com','1981-09-16', 'M', 'Caucasian', '5ft 11in', '190 lbs', 'Green', 'Brown', 'West', 'San Francisco', TRUE),
(21, 'Hailey', 'Young', 'hailey.newemail@example.com','1996-06-19', 'F', 'Hispanic', '5ft 4in', '135 lbs', 'Brown', 'Black', 'South', 'Miami', TRUE),
(22, 'Gabriel', 'Lopez', 'gabriel.newemail@example.com','1988-03-29', 'M', 'Asian', '5ft 9in', '160 lbs', 'Black', 'Brown', 'East', 'Boston', TRUE),
(23, 'Natalie', 'Gonzalez', 'natalie.newemail@example.com', '1990-02-14', 'F', 'Caucasian', '5ft 6in', '140 lbs', 'Blue', 'Blonde', 'Midwest', 'Detroit', TRUE),
(24, 'Samuel', 'Perez', 'samuel.newemail@example.com','1974-12-25', 'M', 'African American', '6ft 2in', '200 lbs', 'Brown', 'Black', 'West', 'Seattle', TRUE),
(25, 'Lily', 'King', 'lily.newemail@example.com','1995-07-29', 'F', 'Hispanic', '5ft 3in', '130 lbs', 'Green', 'Brown', 'South', 'Atlanta', TRUE),
(26, 'Jonathan', 'Diaz','jonathan.newemail@example.com', '1982-05-08', 'M', 'Asian', '5ft 10in', '180 lbs', 'Brown', 'Black', 'East', 'Philadelphia', TRUE),
(27, 'Victoria', 'Lopez', 'victoria.newemail@example.com','1993-12-09', 'F', 'Caucasian', '5ft 7in', '150 lbs', 'Blue', 'Blonde', 'Midwest', 'Minneapolis', TRUE),
(28, 'Nicholas', 'Hernandez', 'nicholas2.newemail@example.com','1989-09-23', 'M', 'African American', '6ft 1in', '190 lbs', 'Brown', 'Black', 'West', 'Denver', TRUE),
(29, 'Chloe', 'Gomez', 'chloe.newemail@example.com','1994-06-18', 'F', 'Hispanic', '5ft 4in', '125 lbs', 'Brown', 'Brown', 'South', 'New Orleans', false),
(30, 'Benjamin', 'Russell','benjamin.newemail@example.com', '1980-03-31', 'M', 'Caucasian', '5ft 11in', '170 lbs', 'Blue', 'Blonde', 'East', 'Baltimore', TRUE);

INSERT INTO Agency (AgencyID, AgencyName, AgencyContactInfo) VALUES 
(1, 'Top Talent Agency', 'contact@toptalent.com'),
(2, 'Star Agency', 'info@staragency.com'),
(3, 'Elite Talent', 'contact@elitetalent.com'),
(4, 'Prime Actors', 'info@primeactors.com'),
(5, 'Superstar Agency', 'contact@superstar.com'),
(6, 'Hollywood Talent', 'info@hollywoodtalent.com'),
(7, 'Gold Agency', 'contact@goldagency.com'),
(8, 'Platinum Talent', 'info@platinumtalent.com'),
(9, 'Silver Screen Agency', 'contact@silverscreen.com'),
(10, 'Diamond Talent', 'info@diamondtalent.com'),
(11, 'Brilliant Stars', 'contact@brilliantstars.com'),
(12, 'Shining Agency', 'info@shiningagency.com'),
(13, 'Glitter Talent', 'contact@glittertalent.com'),
(14, 'Radiant Agency', 'info@radiantagency.com'),
(15, 'Luminary Talent', 'contact@luminarytalent.com');

INSERT INTO Agent (AgentID, FirstName, LastName, AgentContactInfo, AgencyID) VALUES 
(1, 'Alice', 'Taylor', 'alice.taylor@example.com', 1),
(2, 'Chris', 'Anderson', 'chris.anderson@example.com', 2),
(3, 'Ella', 'Thomas', 'ella.thomas@example.com', 3),
(4, 'James', 'Jackson', 'james.jackson@example.com', 4),
(5, 'Oliver', 'White', 'oliver.white@example.com', 5),
(6, 'Ava', 'Harris', 'ava.harris@example.com', 6),
(7, 'Isabella', 'Martin', 'isabella.martin@example.com', 7),
(8, 'Sophia', 'Thompson', 'sophia.thompson@example.com', 8),
(9, 'Mia', 'Garcia', 'mia.garcia@example.com', 9),
(10, 'Liam', 'Martinez', 'liam.martinez@example.com', 10),
(11, 'Noah', 'Robinson', 'noah.robinson@example.com', 11),
(12, 'Lucas', 'Clark', 'lucas.clark@example.com', 12),
(13, 'Mason', 'Rodriguez', 'mason.rodriguez@example.com', 13),
(14, 'Ethan', 'Lewis', 'ethan.lewis@example.com', 14),
(15, 'Logan', 'Lee', 'logan.lee@example.com', 15);

INSERT INTO Project (ProjectID, ProjectName, StartDate, EndDate, Budget) VALUES 
(1001, 'New Movie', '2024-01-01', '2024-12-31', 1000000.00),
(1002, 'TV Show', '2024-02-01', '2024-11-30', 2000000.00),
(1003, 'Commercial', '2024-03-01', '2024-10-31', 500000.00),
(1004, 'Music Video', '2024-04-01', '2024-09-30', 300000.00),
(1005, 'Documentary', '2024-05-01', '2024-08-31', 800000.00),
(1006, 'Web Series', '2024-06-01', '2024-07-31', 1500000.00),
(1007, 'Short Film', '2024-07-01', '2024-12-31', 600000.00),
(1008, 'Feature Film', '2024-08-01', '2024-11-30', 2500000.00),
(1009, 'Animation', '2024-09-01', '2024-10-31', 1200000.00),
(10010, 'Indie Film', '2024-10-01', '2024-12-31', 700000.00),
(10011, 'Reality Show', '2024-11-01', '2024-11-30', 900000.00),
(10012, 'Drama Series', '2024-12-01', '2024-12-31', 2200000.00),
(10013, 'Action Movie', '2024-01-01', '2024-11-30', 3000000.00),
(10014, 'Romantic Comedy', '2024-02-01', '2024-10-31', 1800000.00),
(10015, 'Sci-Fi Series', '2024-03-01', '2024-09-30', 2800000.00);

INSERT INTO Booking (BookingID, ActorID, ProjectID, BookingDate, Role) VALUES 
(1, 1, 1001, '2024-02-01', 'Lead Actor'),
(2, 2, 1002, '2024-03-01', 'Supporting Actor'),
(3, 3, 1003, '2024-04-01', 'Extra'),
(4, 4, 1004, '2024-05-01', 'Voice Actor'),
(5, 5, 1005, '2024-06-01', 'Main Role'),
(6, 6, 1006, '2024-07-01', 'Guest Star'),
(7, 7, 1007, '2024-08-01', 'Recurring Role'),
(8, 8, 1008, '2024-09-01', 'Stunt Double'),
(9, 9, 1009, '2024-10-01', 'Cameo'),
(10, 10, 10010, '2024-11-01', 'Supporting Actor'),
(11, 11, 10011, '2024-12-01', 'Lead Actor'),
(12, 12, 10012, '2024-01-01', 'Extra'),
(13, 13, 10013, '2024-02-01', 'Main Role'),
(14, 14, 10014, '2024-03-01', 'Supporting Actor'),
(15, 15, 10015, '2024-04-01', 'Voice Actor');

INSERT INTO Review (ReviewID, ActorID, ProjectID, Rating, Comments) VALUES 
(1, 1, 1001, 5, 'Outstanding performance!'),
(2, 2, 1002, 4, 'Great job!'),
(3, 3, 1003, 3, 'Good effort.'),
(4, 4, 1004, 5, 'Excellent work!'),
(5, 5, 1005, 4, 'Well done!'),
(6, 6, 1006, 3, 'Nice attempt.'),
(7, 7, 1007, 5, 'Amazing performance!'),
(8, 8, 1008, 4, 'Very good!'),
(9, 9, 1009, 3, 'Decent job.'),
(10, 10, 10010, 5, 'Superb!'),
(11, 11, 10011, 4, 'Good performance!'),
(12, 12, 10012, 3, 'Nice work.'),
(13, 13, 10013, 5, 'Fantastic!'),
(14, 14, 10014, 4, 'Well executed!'),
(15, 15, 10015, 3, 'Good effort.');

INSERT INTO Payment (PaymentID, BookingID, Amount, PaymentDate) VALUES 
(1, 1, 50000.00, '2024-03-01'),
(2, 2, 60000.00, '2024-04-01'),
(3, 3, 40000.00, '2024-05-01'),
(4, 4, 55000.00, '2024-06-01'),
(5, 5, 70000.00, '2024-07-01'),
(6, 6, 45000.00, '2024-08-01'),
(7, 7, 65000.00, '2024-09-01'),
(8, 8, 75000.00, '2024-10-01'),
(9, 9, 80000.00, '2024-11-01'),
(10, 10, 85000.00, '2024-12-01'),
(11, 11, 90000.00, '2024-01-01'),
(12, 12, 95000.00, '2024-02-01'),
(13, 13, 100000.00, '2024-03-01'),
(14, 14, 110000.00, '2024-04-01'),
(15, 15, 120000.00, '2024-05-01');

INSERT INTO AgencyProject (AgencyProjectID, AgencyID, ProjectID) VALUES 
(1, 1, 1001),
(2, 2, 1002),
(3, 3, 1003),
(4, 4, 1004),
(5, 5, 1005),
(6, 6, 1006),
(7, 7, 1007),
(8, 8, 1008),
(9, 9, 1009),
(10, 10, 10010),
(11, 11, 10011),
(12, 12, 10012),
(13, 13, 10013),
(14, 14, 10014),
(15, 15, 10015);

INSERT INTO Skill (SkillID, SkillName) VALUES 
(1, 'Acting'),
(2, 'Singing'),
(3, 'Dancing'),
(4, 'Directing'),
(5, 'Writing'),
(6, 'Producing'),
(7, 'Editing'),
(8, 'Cinematography'),
(9, 'Composing'),
(10, 'Stunt Performing'),
(11, 'Voice Acting'),
(12, 'Scriptwriting'),
(13, 'Costume Designing'),
(14, 'Makeup Artistry'),
(15, 'Set Designing');

INSERT INTO ActorSkill (ActorSkillID, ActorID, SkillID) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15);

UPDATE Actor 
SET ActorContactInfo = 'john.newemail@example.com' 
WHERE ActorID = 1;

UPDATE Agency 
SET AgencyContactInfo = 'newcontact@toptalent.com' 
WHERE AgencyID = 1;

UPDATE Agent 
SET AgentContactInfo = 'jane.newemail@example.com' 
WHERE AgentID = 1;

UPDATE Agent 
SET AgentContactInfo = 'jane.newemail@example.com' 
WHERE AgentID = 1;

UPDATE Project 
SET Budget = 1200000.00 
WHERE ProjectID = 1001;

UPDATE Booking 
SET Role = 'Supporting Actor' 
WHERE BookingID = 1;

UPDATE Review 
SET Comments = 'Amazing performance!' 
WHERE ReviewID = 1;

UPDATE Payment 
SET Amount = 55000.00 
WHERE PaymentID = 1;

UPDATE AgencyProject 
SET AgencyID = 2 
WHERE AgencyProjectID = 1;

UPDATE Skill 
SET SkillName = 'Advanced Acting' 
WHERE SkillID = 1;

UPDATE ActorSkill 
SET SkillID = 2 
WHERE ActorSkillID = 1;

SELECT * FROM Actor;
SELECT * FROM Agency;
SELECT * FROM Agent;
SELECT * FROM Project;
SELECT * FROM Booking;
SELECT * FROM Review;
SELECT * FROM Payment;
SELECT * FROM AgencyProject;
SELECT * FROM Skill;
SELECT * FROM ActorSkill;


-- Retrieve all bookings with actor and project details
SELECT b.BookingID, a.FirstName, a.LastName, p.ProjectName, b.BookingDate, b.Role
FROM Booking b
JOIN Actor a ON b.ActorID = a.ActorID
JOIN Project p ON b.ProjectID = p.ProjectID;

-- Retrieve all agents with their respective agency details
SELECT ag.AgentID, ag.FirstName, ag.LastName, ag.AgentContactInfo, agy.AgencyName
FROM Agent ag
JOIN Agency agy ON ag.AgencyID = agy.AgencyID;

-- Retrieve all reviews with actor and project details
SELECT r.ReviewID, a.FirstName, a.LastName, p.ProjectName, r.Rating, r.Comments
FROM Review r
JOIN Actor a ON r.ActorID = a.ActorID
JOIN Project p ON r.ProjectID = p.ProjectID;

-- Retrieve all payments with booking, actor, and project details
SELECT py.PaymentID, py.Amount, py.PaymentDate, b.BookingID, a.FirstName, a.LastName, p.ProjectName
FROM Payment py
JOIN Booking b ON py.BookingID = b.BookingID
JOIN Actor a ON b.ActorID = a.ActorID
JOIN Project p ON b.ProjectID = p.ProjectID;

-- Retrieve all bookings with actor details and their agency details (assuming actors have agents)
SELECT b.BookingID, a.FirstName, a.LastName, ag.AgentID, ag.FirstName AS AgentFirstName, ag.LastName AS AgentLastName, agy.AgencyName
FROM Booking b
JOIN Actor a ON b.ActorID = a.ActorID
LEFT JOIN Agent ag ON a.ActorID = ag.AgentID -- assuming a relationship between Actor and Agent through ActorID
LEFT JOIN Agency agy ON ag.AgencyID = agy.AgencyID;

