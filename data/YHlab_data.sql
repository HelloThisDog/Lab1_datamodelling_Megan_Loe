CREATE TABLE IF NOT EXISTS School(
    School_name INTEGER,
    School_location VARCHAR,
    School_id INTEGER PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Utbildningsledare(
    First_name VARCHAR,
    Last_name VARCHAR,
    Utbildningsledare_id INTEGER PRIMARY KEY,
    Email VARCHAR,
    School_id INTEGER
);

CREATE TABLE IF NOT EXISTS Class(
    Class_id INTEGER PRIMARY KEY,
    Class_name VARCHAR,
    Student_amount INTEGER,
    Utbildningsledare_id INTEGER
);

CREATE TABLE IF NOT EXISTS Student(
    First_name VARCHAR,
    Last_name VARCHAR,
    Student_id INTEGER PRIMARY KEY,
    Email VARCHAR
);

CREATE TABLE IF NOT EXISTS Program(
    Program_name VARCHAR,
    Program_id INTEGER PRIMARY KEY,
    Course_amount INTEGER,
    Class_id INTEGER,
    Course_id INTEGER,
    School_id INTEGER
);

CREATE TABLE IF NOT EXISTS Course(
    Course_name VARCHAR,
    Course_id INTEGER PRIMARY KEY,
    Course_points INTEGER,
    Seperate_course VARCHAR,
    Program_id INTEGER
);

CREATE TABLE IF NOT EXISTS Consultant(
    First_name VARCHAR,
    Last_name VARCHAR,
    Consultant_id INTEGER PRIMARY KEY,
    Email VARCHAR,
    Hire VARCHAR,
    Hour_rate INTEGER,
    Company_id INTEGER
);

CREATE TABLE IF NOT EXISTS Consultant_Companies(
    Company_name VARCHAR,
    Company_adress VARCHAR,
    Company_id INTEGER PRIMARY KEY,
    Company_tax INTEGER
);

CREATE TABLE IF NOT EXISTS Consultant_x_Course(
    Course_id INTEGER,
    Consultant_id INTEGER,
    Combined_id INTEGER PRIMARY KEY
);

