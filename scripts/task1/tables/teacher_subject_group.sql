CREATE TABLE teacher_subject_group (
group_id VARCHAR(5) REFERENCES student_group(id) ,
subject_id VARCHAR(5) REFERENCES subject(id),
teacher_id VARCHAR(5) REFERENCES teacher(id),
room INT
);

INSERT INTO teacher_subject_group
(group_id,subject_id,teacher_id,room) VALUES
("8Г","12П","222Л",112),("8Г","14П","221Л",220),
("8Г","17П","222Л",112),("7Г","14П","221Л",220),
("7Г","17П","222Л",241),("7Г","18П","225Л",210),
("4Г","12П","222Л",112),("4Г","18П","225Л",210),
("3Г","12П","222Л",112),("3Г","17П","221Л",241),
("3Г","18П","225Л",210),("17Г","12П","222Л",112),
("17Г","22П","110Л",220),("17Г","34П","430Л",118),
("12Г","12П","222Л",112),("12Г","22П","110Л",210),
("10Г","12П","222Л",210),("10Г","22П","110Л",210);
