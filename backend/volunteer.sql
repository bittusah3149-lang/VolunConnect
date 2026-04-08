use login1;

drop table volunteers;

CREATE TABLE volunteers (
    volunteerID INT PRIMARY KEY,
    VolunteerName VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    skills VARCHAR(50) NOT NULL,
    exp VARCHAR(50) NOT NULL,
    availability VARCHAR(50) NOT NULL,
    work_type VARCHAR(50) NOT NULL,
    rating int,
    location VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DataRec.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

truncate table volunteers;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DataRec.csv'
INTO TABLE volunteers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(volunteerID, VolunteerName, email, skills, exp, availability, work_type, rating, location, gender);

truncate table volunteers;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DataRec.csv'
INTO TABLE volunteers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(volunteerID, VolunteerName, email, skills, exp, availability, work_type, @rating, location, gender)
SET rating = NULLIF(@rating, '');

select * from volunteers;

UPDATE volunteers
SET exp= '5-10'
WHERE exp='05-Oct';

SET SQL_SAFE_UPDATES = 1;

select * from volunteers;

use login1;

CREATE TABLE skills_mapping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(50) NOT NULL,
    experience_bracket VARCHAR(20) NOT NULL,
    skill_name VARCHAR(100) NOT NULL
);

-- 1. IT Support Skills
INSERT INTO skills_mapping (category, experience_bracket, skill_name) VALUES
('IT Support', '0-5', 'Hardware Troubleshooting'),
('IT Support', '0-5', 'OS Installation'),
('IT Support', '0-5', 'Basic Networking'),
('IT Support', '0-5', 'Helpdesk Ticketing'),
('IT Support', '5-10', 'System Administration'),
('IT Support', '5-10', 'Cloud Basics (AWS/Azure)'),
('IT Support', '5-10', 'Network Security'),
('IT Support', '>10', 'IT Infrastructure Strategy'),
('IT Support', '>10', 'Advanced Cybersecurity'),
('IT Support', '>10', 'Team Leadership');

-- 2. Teaching Skills
INSERT INTO skills_mapping (category, experience_bracket, skill_name) VALUES
('Teaching', '0-5', 'Lesson Planning'),
('Teaching', '0-5', 'Classroom Management'),
('Teaching', '0-5', 'Student Engagement'),
('Teaching', '5-10', 'Curriculum Development'),
('Teaching', '5-10', 'EdTech Integration'),
('Teaching', '5-10', 'Student Evaluation'),
('Teaching', '>10', 'Educational Leadership'),
('Teaching', '>10', 'Teacher Training'),
('Teaching', '>10', 'Advanced Pedagogy');

-- 3. Healthcare Skills
INSERT INTO skills_mapping (category, experience_bracket, skill_name) VALUES
('Healthcare', '0-5', 'First Aid & CPR'),
('Healthcare', '0-5', 'Basic Vitals Monitoring'),
('Healthcare', '0-5', 'Patient Care'),
('Healthcare', '5-10', 'Emergency Response (Triage)'),
('Healthcare', '5-10', 'Medical Equipment Operation'),
('Healthcare', '5-10', 'Health Campaign Coordination'),
('Healthcare', '>10', 'Healthcare Administration'),
('Healthcare', '>10', 'Crisis Management'),
('Healthcare', '>10', 'Public Health Strategy');

-- 4. Event Management Skills
INSERT INTO skills_mapping (category, experience_bracket, skill_name) VALUES
('Event Management', '0-5', 'On-site Coordination'),
('Event Management', '0-5', 'Registration Desk'),
('Event Management', '0-5', 'Guest Relations'),
('Event Management', '5-10', 'Vendor Negotiation'),
('Event Management', '5-10', 'Budget Tracking'),
('Event Management', '5-10', 'Event Marketing'),
('Event Management', '>10', 'Large-scale Strategy'),
('Event Management', '>10', 'VIP Handling'),
('Event Management', '>10', 'PR & Risk Mitigation');
use login1;
select * from volunteers;

use login1;
CREATE TABLE cities (
    cityid INT PRIMARY KEY,
    city_name VARCHAR(255) NOT NULL,
    lat DECIMAL(10, 8) NOT NULL,
    lng DECIMAL(11, 8) NOT NULL,
    country VARCHAR(100) NOT NULL,
    admin_name VARCHAR(255)
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/city.csv' 
INTO TABLE cities
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; 

select * from cities;

select * from volunteers where exp like "%>10%";

