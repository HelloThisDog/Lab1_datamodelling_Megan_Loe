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
    Utbildningsledare_id INTEGER
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

INSERT INTO
    Program(Program_name, Program_id, Course_amount)
    VALUES
    ("Cognitive Patterns & Decision Making", 214, 5)
    ("Social Dynamics in Modern Institutions", 301, 5)
    ("Emerging Technologies & Society", 245, 5)
    ("Strategic Communication Practices", 322, 5)
    ("Interdisciplinary Problem Solving Seminar", 410, 5)

INSERT INTO
    Course(Course_name, Course_id, Course_points, Seperate_course, Program_id)
    VALUES
    ("Foundations of Human Judgment", 201, 30, "Y", 214)
    ("Behavioral Habits and Motivation", 228, 30, "N", 214)
    ("Risk, Uncertainty, and Choice", 260, 40, "N", 214)
    ("Cognitive Biases in Applied Settings", 315, 30, "N", 214)
    ("Emotion, Attention, and Performance", 344, 30, "N", 214)
    ("Power, Authority, and Social Influence", 210, 30, "Y", 301)
    ("Culture, Identity, and Social Behavior", 225, 30, "N", 301)
    ("Institutional Change and Social Adaptation", 330, 40, "N", 301)
    ("Social Networks and Collective Behavior", 352, 30, "N", 301)
    ("Ethics, Inequality, and Social Responsibility", 390, 30, "Y", 301)
    ("Digital Literacy and Society", 200, 30, "Y", 245)
    ("Automation, Work, and the Future Economy", 265, 40, "N", 245)
    ("Artificial Intelligence and Human Decision-Making", 310, 30, "N", 245)
    ("Ethics of Data, Privacy, and Surveillance", 335, 30, "N", 245)
    ("Technology Policy and Social Impact", 370, 30, "N", 245)
    ("Persuasion and Message Design", 211, 30, "Y", 322)
    ("Professional Communication in Organizations", 245, 30, "N", 322)
    ("Media Influence and Public Opinion", 311, 40, "N", 322)
    ("Crisis Communication and Reputation Management", 355, 30 "N", 322)
    ("Strategic Storytelling Across Platforms", 380, 30, "N", 322)
    ("Systems Thinking and Complex Problems", 250, 30, "N", 410)
    ("Collaborative Research Methods", 313, 30, "N", 410)
    ("Global Challenges Lab", 360, 40, "N", 410)
    ("Applied Policy and Innovation Workshop", 405, 30, "N", 410)
    ("Ethics, Technology, and Society Seminar", 420, 20, "Y", 410)