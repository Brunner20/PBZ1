CREATE TABLE subject (
id VARCHAR(5) PRIMARY KEY,
name VARCHAR(255),
hours INT,
speciality VARCHAR(255),
semester VARCHAR(255)
);

INSERT INTO subject
(id,name,hours,speciality,semester) VALUES
("12П","Мини Эвм", 36, "ЭВМ",1),
("14П","ПЭВМ", 72, "ЭВМ",2),
("17П","СУБД ПК", 48, "АСОИ",4),
("18П","ВКСС", 52, "АСОИ",6),
("34П","Физика", 30, "СД",6),
("22П","Аудит", 24, "Бухучета",3);