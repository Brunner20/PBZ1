CREATE TABLE teacher (
id VARCHAR(5) PRIMARY KEY,
last_name VARCHAR(255),
position VARCHAR(255),
department VARCHAR(255),
phone_number VARCHAR(255)
);


INSERT INTO teacher
(id,last_name,position,department,phone_number) VALUES
("221Л","Фролов","Доцент","ЭВМ","487"),
("222Л","Костин","Доцент","ЭВМ","543"),
("225Л","Бойко","Профессор","АСУ","112"),
("430Л","Глазов","Ассистент","ТФ","421"),
("110Л","Петров","Ассистент","Экономики","324");

