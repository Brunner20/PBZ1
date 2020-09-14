CREATE TABLE teacher_speciality (
teacher_id VARCHAR(5) 	REFERENCES 	teacher(id),
speciality VARCHAR(255)
);

INSERT INTO teacher_speciality
(teacher_id,speciality) VALUES
("221Л","АСОИ"),("221Л","ЭВМ"),
("222Л","ЭВМ"),("225Л","АСОИ"),
("225Л","ЭВМ"),("430Л","СД"),
("110Л","Международная экономика");