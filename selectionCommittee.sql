DROP DATABASE IF EXISTS selectionCommittee;

CREATE DATABASE selectionCommittee;

USE selectionCommittee;

create table role(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(30)
);

create table region(
id INT NOT NULL PRIMARY KEY,
region VARCHAR(30),
city VARCHAR(30)
);
create table faculty(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(30),
budget_quantity INT,
total_amount INT
);
create table user(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(30),
surname VARCHAR(30),
email VARCHAR(30),
isBlock VARCHAR(10),
faculty_idfaculty INT,
role_idrole INT,
region_idregion INT,
FOREIGN KEY (faculty_idfaculty) REFERENCES faculty(id)
ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (role_idrole) REFERENCES role(id)
ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (region_idregion) REFERENCES region(id)

);

create table subjects(
id INT NOT NULL PRIMARY KEY,
ukranian INT,
math INT,
physics INT,
school_certificate INT

);
create table user_has_subject(
user_iduser INT,
subjects_idsubjects INT );

create table subjects_has_faculty(
subjects_idsubjects INT,
faculty_idfaculty INT);

CREATE TABLE course (
  id   INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(30)         NOT NULL
);
