CREATE TABLE part (
id VARCHAR(5) PRIMARY KEY,
title VARCHAR(255),
color VARCHAR(255),
size INT,
city VARCHAR(255)
);

INSERT INTO part
(id,title,color,size,city) VALUES
("Д1","Болт","Красный",12,"Москва"),
("Д2","Гайка","Зеленая",17,"Минск"),
("Д3","Диск","Черный",17,"Вильнюс"),
("Д4","Диск","Черный",14,"Москва"),
("Д5","Корпус","Красный",12,"Минск"),
("Д6","Крышки","Красный",19,"Москва");

