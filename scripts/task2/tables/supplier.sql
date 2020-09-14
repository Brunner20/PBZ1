 CREATE TABLE supplier (
id VARCHAR(5) PRIMARY KEY,
last_name VARCHAR(255),
status INT,
city VARCHAR(255)
);

INSERT INTO supplier
(id,last_name,status,city) VALUES
("П1","Петров",20,"Москва"),
("П2","Синицин",10,"Таллинн"),
("П3","Федоров",30,"Таллинн"),
("П4","Чаянов",20,"Минск"),
("П5","Крюков",30,"Киев");