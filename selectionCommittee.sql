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
name VARCHAR(70),
budget_quantity INT,
total_amount INT
);
create table user(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(50),
surname VARCHAR(50),
email VARCHAR(70) NOT NULL UNIQUE,
password INT UNIQUE,
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

INSERT INTO role VALUES(1,'ADMIN');
INSERT INTO role VALUES(2,'STUDENT');

INSERT INTO region VALUES(1,'Principado de Asturias','Oviedo');
INSERT INTO region VALUES(2,'Hampshire','Portsmouth');
INSERT INTO region VALUES(3,'Valparaíso','San Esteban');
INSERT INTO region VALUES(4,'WB','Dabgram');
INSERT INTO region VALUES(5,'Leinster','Dublin');
INSERT INTO region VALUES(6,'Ov','Enschede');
INSERT INTO region VALUES(7,'JH','Mango');
INSERT INTO region VALUES(8,'AR','Fayetteville');
INSERT INTO region VALUES(9,'CAM','Napoli');
INSERT INTO region VALUES(10,'Ist','Istanbul');

INSERT INTO faculty VALUES(1,'Faculty of Computer Science',150,315);
INSERT INTO faculty VALUES(2,'Faculty of Computer Engineerin and Control',110,230);
INSERT INTO faculty VALUES(3,'Faculty of Automatics and Computerized Technologies',80,240);
INSERT INTO faculty VALUES(4,'Faculty of Information and Analytical Technologies and Managment',90,215);
INSERT INTO faculty VALUES(5,'Faculty of Infocommunications',60,145);
INSERT INTO faculty VALUES(6,'Faculty of Electronic and Biomedical Engineering',75,180);
INSERT INTO faculty VALUES(7,'Faculty of Information Radio Technologies', 60, 130);
INSERT INTO faculty VALUES(8,'Faculty of Foreign Citizens',50,100);

INSERT INTO user VALUE(1,'Sydney','Lyons','eu.accumsan.sed@scelerisque.edu',11111,'FALSE',6,2,10);
/*
INSERT INTO user VALUE(2,'Channing','Harper','non.nisi.Aenean@ametultriciessem.net','FALSE',1,2,7);
INSERT INTO user VALUE(3,'Brittany','Atkinson','sed.hendrerit@acrisusMorbi.ca','FALSE',3,2,6);
INSERT INTO user VALUE(4,'Frances','Kirby','In@odio.com','FALSE',4,2,5);
INSERT INTO user VALUE(5,'Barclay','Hardin','Phasellus.vitae.mauris@turpisegestas.org','FALSE',1,2,10);
INSERT INTO user VALUE(6,'Leilani','Reid','Duis.a.mi@et.net','FALSE',8,2,3);
INSERT INTO user VALUE(7,'Slade','Webster','convallis.in@Suspendisseeleifend.net','FALSE',1,2,4);
INSERT INTO user VALUE(8,'Cleo','Hester','eu@nec.org','FALSE',2,2,7);
INSERT INTO user VALUE(9,'Geraldine','Hess','Donec.tempus.lorem@ante.org','FALSE',1,2,5);
INSERT INTO user VALUE(10,'Yuli','Swanson','pede.Cras.vulputate@eulacus.co.uk','FALSE',7,2,8);
INSERT INTO user VALUE(11,'Ruth','Chen','nonummy.ultricies@ante.net','FALSE',1,2,1);
INSERT INTO user VALUE(12,'Carlos','Reyes','ac.tellus.Suspendisse@Loremipsum.ca','FALSE',2,2,2);
INSERT INTO user VALUE(13,'Susan','Ross','Donec@vitae.net','FALSE',3,2,3);
INSERT INTO user VALUE(14,'Halee','Stafford','faucibus.Morbi.vehicula@mollis.ca','FALSE',4,2,4);
INSERT INTO user VALUE(15,'Reuben','Morse','sed.sapien@sitamet.edu','FALSE',5,2,5);
INSERT INTO user VALUE(16,'Doris','Fisher','pretium.aliquet@quisurna.net','FALSE',6,2,6);
INSERT INTO user VALUE(17,'Faith','Perry','Sed@ligula.edu','FALSE',7,2,7);
INSERT INTO user VALUE(18,'Stuart','Dickson','eget.ipsum.Suspendisse@Proinegetodio.ca','FALSE',8,2,8);
INSERT INTO user VALUE(19,'Fatima','Franco','adipiscing@elitAliquam.ca','FALSE',1,2,9);
INSERT INTO user VALUE(20,'Nigel','Nelson','dictum.augue.malesuada@convallis.com','FALSE',2,2,10);
INSERT INTO user VALUE(21,'Drake','Lowe','in.consectetuer@Cras.net','FALSE',1,2,3);
INSERT INTO user VALUE(22,'Addison','Parrish','enim.nec.tempus@nibh.org','FALSE',2,2,4);
INSERT INTO user VALUE(23,'Hall','Johnston','dolor.tempus.non@Inmipede.edu','FALSE',3,2,5);
INSERT INTO user VALUE(24,'Beau','Burch','neque.tellus.imperdiet@aliquetliberoInteger.co.uk','FALSE',4,2,6);
INSERT INTO user VALUE(25,'Mannix','Walsh','molestie.tortor.nibh@nullaat.com','FALSE',5,2,7);
INSERT INTO user VALUE(26,'May','Barlow','Nunc.ac.sem@tempuseuligula.co.uk','FALSE',6,2,8);
INSERT INTO user VALUE(27,'Nell','Potter','orci.Ut@eget.ca','FALSE',7,2,1);
INSERT INTO user VALUE(28,'Phillip','Dejesus','orci@varius.edu','FALSE',8,2,2);
INSERT INTO user VALUE(29,'Nerea','Solis','sodales.at.velit@leoVivamus.net','FALSE',3,2,9);
INSERT INTO user VALUE(30,'Jamalia','Frye','massa@velesttempor.net','FALSE',4,2,10);
INSERT INTO user VALUE(31,'Davis','Durham','consectetuer.adipiscing.elit@vestibulum.net','FALSE',1,2,5);
INSERT INTO user VALUE(32,'Ezra','Herring','nec@duinec.org','FALSE',2,2,6);
INSERT INTO user VALUE(33,'Mariam','Cruz','nulla.Donec.non@libero.co.uk','FALSE',3,2,7);
INSERT INTO user VALUE(34,'Skyler','French','erat@Innec.net','FALSE',4,2,8);
INSERT INTO user VALUE(35,'Phyllis','Keysy','ac@dictumaugue.ca','FALSE',5,2,1);
INSERT INTO user VALUE(36,'Caryn','Justice','elit.fermentum@congueInscelerisque.net','FALSE',6,2,2);
INSERT INTO user VALUE(37,'Yeo','Bradford','est@loremvehicula.co.uk','FALSE',7,2,3);
INSERT INTO user VALUE(38,'Lamar','Rodgers','lectus.quis@antedictum.com','FALSE',8,2,4);
INSERT INTO user VALUE(39,'Tucker','Francis','Etiam@justositamet.net','FALSE',5,2,9);
INSERT INTO user VALUE(40,'Yoko','Dixon','ipsum@augueeu.edu','FALSE',6,2,10);
INSERT INTO user VALUE(41,'Petra','Cote','ut.nulla.Cras@egetdictumplacerat.com','FALSE',1,2,7);
INSERT INTO user VALUE(42,'Gannon','Horton','Integer.vitae@velitQuisquevarius.org','FALSE',2,2,8);
INSERT INTO user VALUE(43,'Isadora','Stanton','sem@luctus.co.uk','FALSE',3,2,1);
INSERT INTO user VALUE(44,'Thor','Figueroa','sagittis.augue@nonummyFuscefermentum.co.uk','FALSE',4,2,2);
INSERT INTO user VALUE(45,'Aquila','Faulkner','ipsum.porta.elit@dolor.com','FALSE',5,2,2);
INSERT INTO user VALUE(46,'Bradley','Francis','Sed.pharetra.felis@Utsagittis.co.uk','FALSE',6,2,3);
INSERT INTO user VALUE(47,'Briar','Bird','Aenean.massa.Integer@euarcuMorbi.co.uk','FALSE',7,2,4);
INSERT INTO user VALUE(48,'Nelle','Jacobs','molestie.arcu.Sed@eratEtiamvestibulum.com','FALSE',8,2,5);
INSERT INTO user VALUE(49,'Mufutau','Osborne','tristique.senectus.et@augue.org','FALSE',7,2,9);
INSERT INTO user VALUE(50,'Christopher','Harmon','Curabitur.vel.lectus@vel.org','FALSE',8,2,10);
INSERT INTO user VALUE(51,'Bertha','Bowen','Nulla.eu.neque@velnislQuisque.org','FALSE',1,2,1);
INSERT INTO user VALUE(52,'Amena','Logan','Vestibulum.ante@ametnullaDonec.edu','FALSE',2,2,2);
INSERT INTO user VALUE(53,'Florence','Marks','lorem@et.org','FALSE',3,2,2);
INSERT INTO user VALUE(54,'Jana','Goodman','turpis.egestas.Aliquam@vitaemaurissit.edu','FALSE',4,2,4);
*/
INSERT INTO subjects VALUE (1,130,121,149,197);
INSERT INTO subjects VALUE(2,191,178,170,134);
INSERT INTO subjects VALUE(3,111,158,151,194);
INSERT INTO subjects VALUE(4,114,128,148,197);
INSERT INTO subjects VALUE(5,182,102,181,187);
INSERT INTO subjects VALUE(6,123,156,131,102);
INSERT INTO subjects VALUE(7,157,147,194,128);
INSERT INTO subjects VALUE(8,104,102,116,131);
INSERT INTO subjects VALUE(9,107,104,120,105);
INSERT INTO subjects VALUE(10,110,159,174,123);
INSERT INTO subjects VALUE(11,147,151,110,190);
INSERT INTO subjects VALUE(12,187,178,177,183);
INSERT INTO subjects VALUE(13,188,122,199,132);
INSERT INTO subjects VALUE(14,159,166,143,144);
INSERT INTO subjects VALUE(15,165,120,152,146);
INSERT INTO subjects VALUE(16,196,134,162,194);
INSERT INTO subjects VALUE(17,177,167,195,151);
INSERT INTO subjects VALUE(18,182,136,129,136);
INSERT INTO subjects VALUE(19,151,147,128,115);
INSERT INTO subjects VALUE(20,183,158,133,128);
INSERT INTO subjects VALUE(21,173,188,186,120);
INSERT INTO subjects VALUE(22,163,196,120,114);
INSERT INTO subjects VALUE(23,183,137,104,148);
INSERT INTO subjects VALUE(24,103,180,176,129);
INSERT INTO subjects VALUE(25,179,104,137,159);
INSERT INTO subjects VALUE(26,124,165,159,145);
INSERT INTO subjects VALUE(27,132,146,104,126);
INSERT INTO subjects VALUE(28,152,106,160,185);
INSERT INTO subjects VALUE(29,190,188,106,147);
INSERT INTO subjects VALUE(30,196,161,149,173);
INSERT INTO subjects VALUE(31,147,104,129,107);
INSERT INTO subjects VALUE(32,116,139,196,131);
INSERT INTO subjects VALUE(33,100,106,127,124);
INSERT INTO subjects VALUE(34,125,111,164,179);
INSERT INTO subjects VALUE(35,116,151,133,122);
INSERT INTO subjects VALUE(36,173,102,182,184);
INSERT INTO subjects VALUE(37,196,175,149,152);
INSERT INTO subjects VALUE(38,112,190,109,148);
INSERT INTO subjects VALUE(39,139,193,155,161);
INSERT INTO subjects VALUE(40,104,145,125,116);
INSERT INTO subjects VALUE(41,186,190,114,175);
INSERT INTO subjects VALUE(42,113,164,133,137);
INSERT INTO subjects VALUE(43,181,134,129,188);
INSERT INTO subjects VALUE(44,140,101,190,127);
INSERT INTO subjects VALUE(45,128,113,154,154);
INSERT INTO subjects VALUE(46,153,178,133,156);
INSERT INTO subjects VALUE(47,136,156,179,144);
INSERT INTO subjects VALUE(48,129,175,138,182);
INSERT INTO subjects VALUE(49,197,165,191,111);
INSERT INTO subjects VALUE(50,147,195,168,150);
INSERT INTO subjects VALUE(51,103,117,187,197);
INSERT INTO subjects VALUE(52,105,168,195,184);
INSERT INTO subjects VALUE(53,119,165,134,172);
INSERT INTO subjects VALUE(54,138,109,115,187);


insert into user_has_subject (user_iduser, subjects_idsubjects) values (1,1)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (2,2)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (3,3)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (4,4)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (5,5)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (6,6)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (7,7)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (8,8)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (9,9)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (10,10)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (11,11)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (12,12)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (13,13)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (14,14)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (15,15)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (16,16)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (17,17)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (18,18)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (19,19)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (20,20)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (21,21)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (22,22)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (23,23)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (24,24)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (25,25)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (26,26)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (27,27)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (28,28)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (29,29)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (30,30)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (31,31)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (32,32)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (33,33)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (34,34)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (35,35)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (36,36)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (37,37)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (38,38)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (39,39)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (40,40)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (41,41)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (42,42)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (43,43)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (44,44)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (45,45)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (46,46)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (47,47)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (48,48)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (49,49)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (50,50)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (51,51)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (52,52)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (53,53)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);
insert into user_has_subject (user_iduser, subjects_idsubjects) values (54,54)
on DUPLICATE KEY UPDATE user_iduser=values(user_iduser), subjects_idsubjects=values(subjects_idsubjects);


insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (1,6)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (2,1)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (3,3)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (4,4)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (5,1)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (6,8)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (7,1)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (8,2)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (9,1)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (10,7)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (11,1)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (12,2)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (13,3)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (14,4)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (15,5)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (16,6)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (17,7)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (18,8)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (19,1)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (20,2)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (21,1)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (22,2)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (23,3)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (24,4)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (25,5)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (26,6)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (27,7)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (28,8)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (29,3)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (30,4)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (31,1)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (32,2)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (33,3)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (34,4)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (35,5)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (36,6)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (37,7)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (38,8)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (39,5)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (40,6)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (41,1)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (42,2)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (43,3)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (44,4)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (45,5)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (46,6)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (47,7)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (48,8)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (49,7)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (50,8)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (51,1)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (52,2)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (53,3)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);
insert into subjects_has_faculty (subjects_idsubjects, faculty_idfaculty) value (54,4)
on DUPLICATE KEY UPDATE subjects_idsubjects=values(subjects_idsubjects),faculty_idfaculty=values(faculty_idfaculty);