CREATE TABLE student_group (
id VARCHAR(5) PRIMARY KEY,
name VARCHAR(255),
count INT,
speciality VARCHAR(255),
head_last_name VARCHAR(255)
);

INSERT INTO student_group
(id,name,count,speciality,head_last_name) VALUES
("8Г","Э-12",18,"ЭВМ","Иванова"),
("7Г","Э-15",22,"ЭВМ","Сеткин"),
("4Г","АС-9",24,"АСОИ","Балабанов"),
("3Г","АС-8",20,"АСОИ","Чижов"),
("17Г","С-14",29,"Сд","Амросов"),
("12Г","М-6",16,"Международная экономика","Трубин"),
("10Г","Б-4",121,"Бухучет","Зязюткин");