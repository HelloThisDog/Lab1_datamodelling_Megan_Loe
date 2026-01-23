CREATE TABLE "School" (
  "School_name" varchar(50) NOT NULL,
  "Location" varchar NOT NULL,
  "School_id" integer PRIMARY KEY
);

CREATE TABLE "Utbildningsledare" (
  "First_name" varchar(50) NOT NULL,
  "Last_name" varchar(50) NOT NULL,
  "Utbildningsledare_id" integer PRIMARY KEY,
  "Email" varchar(255) UNIQUE NOT NULL,
  "School_id" integer NOT NULL
);

CREATE TABLE "Class" (
  "Class_id" integer PRIMARY KEY,
  "Class_name" varchar(30) NOT NULL,
  "Student_amount" integer NOT NULL,
  "Student_id" integer NOT NULL,
  "Utbildningsledare_id" integer NOT NULL
);

CREATE TABLE "Student" (
  "Frist_name" varchar(50) NOT NULL,
  "Last_name" varchar(50) NOT NULL,
  "Student_id" integer PRIMARY KEY,
  "Email" varchar(255) UNIQUE NOT NULL
);

CREATE TABLE "Program" (
  "Program_name" varchar(50) NOT NULL,
  "Program_id" integer PRIMARY KEY,
  "Course_amount" integer NOT NULL,
  "Class_id" integer NOT NULL,
  "Course_id" integer NOT NULL,
  "School_id" integer NOT NULL
);

CREATE TABLE "Course" (
  "Course_name" varchar(50) NOT NULL,
  "Course_id" integer PRIMARY KEY,
  "Course_points" integer(100) NOT NULL,
  "Seperate_course" varchar NOT NULL,
  "Program_id" integer NOT NULL
);

CREATE TABLE "Consultant_x_Course" (
  "Course_id" integer NOT NULL,
  "Consultant_id" integer NOT NULL,
  "Combined_id" integer PRIMARY KEY
);

CREATE TABLE "Consultant" (
  "First_name" varchar(50) NOT NULL,
  "Last_name" varchar(50) NOT NULL,
  "Consultant_id" integer PRIMARY KEY,
  "Email" varchar(255) UNIQUE NOT NULL,
  "Hire" varchar NOT NULL,
  "Hour_rate" integer NOT NULL,
  "Company_id" integer NOT NULL
);

CREATE TABLE "Consultant_companies" (
  "Company_name" varchar(50) NOT NULL,
  "Company_adress" varchar NOT NULL,
  "Company_id" integer PRIMARY KEY,
  "Company_tax" integer NOT NULL
);

ALTER TABLE "Utbildningsledare" ADD FOREIGN KEY ("School_id") REFERENCES "School" ("School_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("Student_id") REFERENCES "Student" ("Student_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("Utbildningsledare_id") REFERENCES "Utbildningsledare" ("Utbildningsledare_id");

ALTER TABLE "Program" ADD FOREIGN KEY ("Class_id") REFERENCES "Class" ("Class_id");

ALTER TABLE "Program" ADD FOREIGN KEY ("Course_id") REFERENCES "Course" ("Course_id");

ALTER TABLE "Program" ADD FOREIGN KEY ("School_id") REFERENCES "School" ("School_id");

ALTER TABLE "Course" ADD FOREIGN KEY ("Program_id") REFERENCES "Program" ("Program_id");

ALTER TABLE "Consultant_x_Course" ADD FOREIGN KEY ("Course_id") REFERENCES "Course" ("Course_id");

ALTER TABLE "Consultant_x_Course" ADD FOREIGN KEY ("Consultant_id") REFERENCES "Consultant" ("Consultant_id");

ALTER TABLE "Consultant" ADD FOREIGN KEY ("Company_id") REFERENCES "Consultant_companies" ("Company_id");
