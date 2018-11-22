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
ON DELETE CASCADE
    ON UPDATE CASCADE
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
subjects_idsubjects INT ,
PRIMARY KEY (user_iduser,subjects_idsubjects),
CONSTRAINT fk_user_has_subjects_user FOREIGN KEY (user_iduser) REFERENCES user(id)
ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT fk_user_has_subjects_subjects1 FOREIGN KEY (subjects_idsubjects) REFERENCES subjects(id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
	);
create table subjects_has_faculty(
subjects_idsubjects INT,
faculty_idfaculty INT,
 PRIMARY KEY (subjects_idsubjects, faculty_idfaculty),
CONSTRAINT fk_subjects_has_faculty_subjects1 FOREIGN KEY (subjects_idsubjects) REFERENCES subjects(id)
ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT fk_subjects_has_faculty_faculty1	FOREIGN KEY (faculty_idfaculty) REFERENCES faculty(id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

/*CREATE TABLE IF NOT EXISTS `mydb`.`subjects_has_faculty` (
  `subjects_idsubjects` INT NOT NULL,
  `faculty_idfaculty` INT NOT NULL,
  PRIMARY KEY (`subjects_idsubjects`, `faculty_idfaculty`),
  INDEX `fk_subjects_has_faculty_faculty1_idx` (`faculty_idfaculty` ASC),
  INDEX `fk_subjects_has_faculty_subjects1_idx` (`subjects_idsubjects` ASC),
  CONSTRAINT `fk_subjects_has_faculty_subjects1`
    FOREIGN KEY (`subjects_idsubjects`)
    REFERENCES `mydb`.`subjects` (`idsubjects`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subjects_has_faculty_faculty1`
    FOREIGN KEY (`faculty_idfaculty`)
    REFERENCES `mydb`.`faculty` (`idfaculty`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)*/
