-- table space
CREATE TABLE IF NOT EXISTS School(
    School_name VARCHAR NOT NULL,
    School_location VARCHAR NOT NULL,
    School_id INTEGER PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Utbildningsledare(
    First_name VARCHAR NOT NULL,
    Last_name VARCHAR NOT NULL,
    Utbildningsledare_id INTEGER PRIMARY KEY,
    Email VARCHAR NOT NULL UNIQUE,
    School_id INTEGER
);

CREATE TABLE IF NOT EXISTS Class(
    Class_id INTEGER PRIMARY KEY,
    Class_name VARCHAR NOT NULL,
    Student_amount INTEGER NOT NULL,
    Utbildningsledare_id INTEGER,
    Program_id INTEGER
);

CREATE TABLE IF NOT EXISTS Student(
    First_name VARCHAR NOT NULL,
    Last_name VARCHAR NOT NULL,
    Student_id INTEGER PRIMARY KEY,
    Email VARCHAR NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Program(
    Program_name VARCHAR NOT NULL UNIQUE,
    Program_id INTEGER PRIMARY KEY,
    Course_amount INTEGER NOT NULL,
    Class_id INTEGER,
    Course_id INTEGER,
    School_id INTEGER
);

CREATE TABLE IF NOT EXISTS Course(
    Course_name VARCHAR NOT NULL,
    Course_id INTEGER PRIMARY KEY,
    Course_points INTEGER NOT NULL,
    Seperate_course VARCHAR NOT NULL,
    Program_id INTEGER
);

CREATE TABLE IF NOT EXISTS Consultant(
    First_name VARCHAR NOT NULL,
    Last_name VARCHAR NOT NULL,
    Consultant_id INTEGER PRIMARY KEY,
    Email VARCHAR NOT NULL UNIQUE,
    Hire VARCHAR NOT NULL,
    Hour_rate INTEGER NOT NULL,
    Company_id INTEGER
);

CREATE TABLE IF NOT EXISTS Consultant_Companies(
    Company_name VARCHAR NOT NULL,
    Company_adress VARCHAR NOT NULL,
    Company_id INTEGER PRIMARY KEY,
    Company_tax INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Consultant_x_Course(
    Course_id INTEGER,
    Consultant_id INTEGER,
    Combined_id INTEGER PRIMARY KEY
);

-- insertion hell
INSERT INTO --program data
    Program(Program_name, Program_id, Course_amount, School_id)
    VALUES
    ('Cognitive Patterns & Decision Making', 214, 5, 100),
    ('Social Dynamics in Modern Institutions', 301, 5, 200),
    ('Emerging Technologies & Society', 245, 5, 100),
    ('Strategic Communication Practices', 322, 5, 200),
    ('Interdisciplinary Problem Solving Seminar', 410, 5, 100);

INSERT INTO --course data
    Course(Course_name, Course_id, Course_points, Seperate_course, Program_id)
    VALUES
    ('Foundations of Human Judgment', 201, 30, 'Y', 214),
    ('Behavioral Habits and Motivation', 228, 30, 'N', 214),
    ('Risk, Uncertainty, and Choice', 260, 40, 'N', 214),
    ('Cognitive Biases in Applied Settings', 315, 30, 'N', 214),
    ('Emotion, Attention, and Performance', 344, 30, 'N', 214),
    ('Power, Authority, and Social Influence', 210, 30, 'Y', 301),
    ('Culture, Identity, and Social Behavior', 225, 30, 'N', 301),
    ('Institutional Change and Social Adaptation', 330, 40, 'N', 301),
    ('Social Networks and Collective Behavior', 352, 30, 'N', 301),
    ('Ethics, Inequality, and Social Responsibility', 390, 30, 'Y', 301),
    ('Digital Literacy and Society', 200, 30, 'Y', 245),
    ('Automation, Work, and the Future Economy', 265, 40, 'N', 245),
    ('Artificial Intelligence and Human Decision-Making', 310, 30, 'N', 245),
    ('Ethics of Data, Privacy, and Surveillance', 335, 30, 'N', 245),
    ('Technology Policy and Social Impact', 370, 30, 'N', 245),
    ('Persuasion and Message Design', 211, 30, 'Y', 322),
    ('Professional Communication in Organizations', 245, 30, 'N', 322),
    ('Media Influence and Public Opinion', 311, 40, 'N', 322),
    ('Crisis Communication and Reputation Management', 355, 30, 'N', 322),
    ('Strategic Storytelling Across Platforms', 380, 30, 'N', 322),
    ('Systems Thinking and Complex Problems', 250, 30, 'N', 410),
    ('Collaborative Research Methods', 313, 30, 'N', 410),
    ('Global Challenges Lab', 360, 40, 'N', 410),
    ('Applied Policy and Innovation Workshop', 405, 30, 'N', 410),
    ('Ethics, Technology, and Society Seminar', 420, 20, 'Y', 410);

INSERT INTO -- company data
    Consultant_Companies(Company_name, Company_adress, Company_id, Company_tax)
    VALUES
    ('Teachtant AB', 'Fallback street 69', 567, 100),
    ('Consulter AB', 'Waterfall lane 5', 678, 150),
    ('Teachany AB', 'Hill road 10', 789, 100),
    ('Compacher AB', 'Fine lane 6', 890, 200),
    ('Teacher Consult AB', 'Teaching street 20', 123, 150);

INSERT INTO --consultant data
    Consultant(First_name, Last_name, Consultant_id, Email, Hire, Hour_rate, Company_id)
    VALUES
    ('Maya', 'Reynolds', 001, 'maya.reynolds@educonsultpro.com', 'Y', 68, 678),
    ('Jordan', 'Whitaker', 002, 'jordan.whitaker@educonsultpro.com', 'N', 55, 890),
    ('Luis', 'Calderon', 003, 'luis.calderon@educonsultpro.com', 'Y', 75, 123),
    ('Priya', 'Nandakumar', 004, 'priya.nandakumar@educonsultpro.com', 'N', 60, 567),
    ('Ethan', 'Holloway', 005, 'ethan.holloway@educonsultpro.com', 'Y', 75, 789),
    ('Simone', 'Duval', 006, 'simone.duval@educonsultpro.com', 'N', 58, 890),
    ('Marcus', 'Bennett', 007, 'marcus.bennett@educonsultpro.com', 'Y', 70, 123),
    ('Alina', 'Kovacs', 008, 'alina.kovacs@educonsultpro.com', 'N', 62, 567),
    ('Trevor', 'ONeill', 009, 'trevor.oneill@educonsultpro.com', 'Y', 78, 678),
    ('Naomi', 'Park', 010, 'naomi.park@educonsultpro.com', 'N', 57, 789);

INSERT INTO -- class data
    Class(Class_id, Class_name, Student_amount, Utbildningsledare_id, Program_id)
    VALUES
    (023, 'CPDM23', 5, 001, 214),
    (060, 'CPDM24', 5, 001, 214),
    (050, 'CPDM25', 5, 001, 214),
    (022, 'SDiMI23', 5, 002, 301),
    (011, 'SDiMI24', 5, 002, 301),
    (021, 'ETS25', 5, 003, 245),
    (024, 'SCP23', 5, 004, 322),
    (040, 'SCP24', 5, 004, 322),
    (025, 'IPSS23', 5, 005, 410),
    (035, 'IPSS25', 5, 005, 410);

INSERT INTO -- student data
    Student(First_name, Last_name, Student_id, Email)
    VALUES
    ('Alex', 'Morgan', 001, 'alex.morgan001@example.test'),
    ('Jamie', 'Collins', 002, 'jamie.collins002@example.test'),
    ('Taylor', 'Brooks', 003, 'taylor.brooks003@example.test'),
    ('Jordan', 'Patel', 004, 'jordan.patel004@example.test'),
    ('Casey', 'Nguyen', 005, 'casey.nguyen005@example.test'),
    ('Riley', 'Thompson', 006, 'riley.thompson006@example.test'),
    ('Morgan', 'Alvarez', 007, 'morgan.alvarez007@example.test'),
    ('Avery', 'Kim', 008, 'avery.kim008@example.test'),
    ('Quinn', 'Robinson', 009, 'quinn.robinson009@example.test'),
    ('Parker', 'Lewis', 010, 'parker.lewis010@example.test'),
    ('Dakota', 'Martinez', 011, 'dakota.martinez011@example.test'),
    ('Rowan', 'Singh', 012, 'rowan.singh012@example.test'),
    ('Finley', 'Carter', 013, 'finley.carter013@example.test'),
    ('Skyler', 'Adams', 014, 'skyler.adams014@example.test'),
    ('Emerson', 'Wright', 015, 'emerson.wright015@example.test'),
    ('Hayden', 'Lopez', 016, 'hayden.lopez016@example.test'),
    ('Blair', 'Foster', 017, 'blair.foster017@example.test'),
    ('Reese', 'Hernandez', 018, 'reese.hernandez018@example.test'),
    ('Elliot', 'Park', 019, 'elliot.park019@example.test'),
    ('Logan', 'Baker', 020, 'logan.baker020@example.test'),
    ('Cameron', 'Rivera', 021, 'cameron.rivera021@example.test'),
    ('Devon', 'Mitchell', 022, 'devon.mitchell022@example.test'),
    ('Sage', 'Turner', 023, 'sage.turner023@example.test'),
    ('Ashton', 'Phillips', 024, 'ashton.phillips024@example.test'),
    ('Drew', 'Campbell', 025, 'drew.campbell025@example.test'),
    ('Peyton', 'Evans', 026, 'peyton.evans026@example.test'),
    ('Jesse', 'Murphy', 027, 'jesse.murphy027@example.test'),
    ('Robin', 'Ortiz', 028, 'robin.ortiz028@example.test'),
    ('Micah', 'Reed', 029, 'micah.reed029@example.test'),
    ('Tatum', 'Cooper', 030, 'tatum.cooper030@example.test'),
    ('Noah', 'Bennett', 031, 'noah.bennett031@example.test'),
    ('Aria', 'Coleman', 032, 'aria.coleman032@example.test'),
    ('Luca', 'Flores', 033, 'luca.flores033@example.test'),
    ('Mila', 'Peterson', 034, 'mila.peterson034@example.test'),
    ('Owen', 'Ramirez', 035, 'owen.ramirez035@example.test'),
    ('Isla', 'Watson', 036, 'isla.watson036@example.test'),
    ('Theo', 'Brooks', 037, 'theo.brooks037@example.test'),
    ('Nora', 'Diaz', 038, 'nora.diaz038@example.test'),
    ('Leo', 'Howard', 039, 'leo.howard039@example.test'),
    ('Ivy', 'Sanders', 040, 'ivy.sanders040@example.test'),
    ('Max', 'Price', 041, 'max.price041@example.test'),
    ('Zoe', 'Wood', 042, 'zoe.wood042@example.test'),
    ('Eli', 'Ross', 043, 'eli.ross043@example.test'),
    ('Luna', 'Powell', 044, 'luna.powell044@example.test'),
    ('Sam', 'Long', 045, 'sam.long045@example.test'),
    ('Mia', 'Patterson', 046, 'mia.patterson046@example.test'),
    ('Ben', 'Hughes', 047, 'ben.hughes047@example.test'),
    ('Chloe', 'Richardson', 048, 'chloe.richardson048@example.test'),
    ('Jack', 'Barnes', 049, 'jack.barnes049@example.test'),
    ('Ava', 'Sullivan', 050, 'ava.sullivan050@example.test');

INSERT INTO -- utbildningsledare data
    Utbildningsledare(First_name, Last_name, Utbildningsledare_id, Email, School_id)
    VALUES
    ('Caleb', 'Monroe', 001, 'caleb.monroe051@example.test', 100),
    ('Nina', 'Wallace', 002, 'nina.wallace052@example.test', 200),
    ('Victor', 'Chen', 003, 'victor.chen053@example.test', 100),
    ('Priya', 'Desai', 004, 'priya.desai054@example.test', 200),
    ('Marcus', 'ONeill', 005, 'marcus.oneill055@example.test', 100);

INSERT INTO -- school data
    School(School_name, School_location, School_id)
    VALUES
    ('YrkesSkola', 'Stockholm', 100),
    ('YrkesSkola', 'Göteborg', 200);

INSERT INTO -- insert the rest of join here
    Consultant_x_Course(Consultant_id, Course_id, Combined_id)
    VALUES
    (001, 201, 001201),
    (001, 228, 001228),
    (001, 260, 001260),
    (001, 315, 001315),
    (001, 344, 001344),
    (002, 210, 002210),
    (002, 225, 002225),
    (002, 330, 002330),
    (002, 352, 002352),
    (002, 390, 002390),
    (003, 200, 003200),
    (003, 265, 003265),
    (003, 310, 003310),
    (003, 335, 003335),
    (003, 370, 003370),
    (004, 211, 004211),
    (004, 245, 004245),
    (004, 311, 004311),
    (004, 355, 004355),
    (004, 380, 004380),
    (005, 250, 005250),
    (005, 313, 005313),
    (005, 360, 005360),
    (005, 405, 005405),
    (005, 420, 005420);

SELECT * FROM Course

SELECT
    AVG (Hour_rate) AS avg_rate
FROM Consultant;