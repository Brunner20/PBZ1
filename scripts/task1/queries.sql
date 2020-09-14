-- Получить полную информацию обо всех преподавателях.
SELECT * FROM teacher JOIN teacher_speciality 
ON teacher.id=teacher_speciality.teacher_id;

-- Получить полную информацию обо всех студенческих группах на специальности ЭВМ.
SELECT * FROM student_group
WHERE speciality="ЭВМ";

-- Получить личный номер преподавателя и номера аудиторий, в которых они преподают предмет с кодовым номером 18П.
SELECT DISTINCT teacher_id, room FROM teacher_subject_group
 WHERE subject_id= "18П";
 
-- Получить номера предметов и названия предметов, которые ведет преподаватель Костин.
SELECT DISTINCT subject.id, subject.name FROM subject JOIN teacher_subject_group
ON subject.id=teacher_subject_group.subject_id
	JOIN  teacher
	ON teacher_id=teacher.id
WHERE teacher.last_name="Костин";

-- Получить номер группы, в которой ведутся предметы преподавателем Фроловым.
SELECT DISTINCT group_id FROM teacher_subject_group  JOIN teacher 
ON teacher_id=teacher.id
WHERE teacher.last_name="Фролов";

-- Получить информацию о предметах, которые ведутся на специальности АСОИ.
SELECT * FROM subject
WHERE speciality="АСОИ";

-- Получить информацию о преподавателях, которые ведут предметы на специальности АСОИ.
SELECT * FROM teacher JOIN teacher_speciality
ON teacher.id=teacher_id
where speciality="АСОИ";

-- Получить фамилии преподавателей, которые ведут предметы в 210 аудитории.
SELECT DISTINCT last_name FROM teacher JOIN teacher_subject_group
on teacher.id=teacher_id
WHERE room=210;

-- Получить названия предметов и названия групп, которые ведут занятия в аудиториях с 100 по 200.
SELECT  name FROM subject
WHERE id IN ( SELECT subject_id
				FROM teacher_subject_group 
				WHERE room BETWEEN 100 AND 200)
UNION
SELECT  name FROM student_group
WHERE id IN ( SELECT group_id
				FROM teacher_subject_group 
				WHERE room BETWEEN 100 AND 200);
                
-- Получить пары групп с одной специальности.
SELECT sg1.id, sg2.id FROM student_group AS sg1 , student_group as sg2
WHERE sg1.speciality=sg2.speciality AND sg1.id<>sg2.id;

-- Получить общее количество студентов, обучающихся на специальности ЭВМ.
SELECT sum(count) FROM student_group
WHERE speciality="ЭВМ";

-- Получить номера преподавателей, обучающих студентов по специальности ЭВМ.
SELECT DISTINCT teacher_id  FROM student_group JOIN teacher_subject_group
ON student_group.id=group_id
where student_group.speciality="ЭВМ";

-- Получить номера предметов, изучаемых всеми студенческими группами.
SELECT subject_id FROM teacher_subject_group
GROUP BY subject_id
HAVING count(group_id)=(SELECT COUNT(*) FROM student_group);

-- Получить фамилии преподавателей, преподающих те же предметы, что и преподаватель преподающий предмет с номером 14П.
SELECT DISTINCT last_name FROM teacher
LEFT JOIN teacher_subject_group ON teacher.id = teacher_id
WHERE subject_id IN (SELECT subject_id
        FROM teacher_subject_group
        WHERE  teacher_id IN (SELECT   teacher_id
                FROM teacher_subject_group
                WHERE subject_id = '14П'));
                
-- Получить информацию о предметах, которые не ведет преподаватель с личным номером 221П.
SELECT *  FROM subject
WHERE id NOT IN (SELECT subject_id 
				FROM teacher_subject_group 
                WHERE teacher_id="221Л");
                
-- Получить информацию о предметах, которые не изучаются в группе М-6.
SELECT * FROM subject
WHERE id NOT IN (SELECT subject_id 
				FROM teacher_subject_group  
                JOIN student_group
                ON group_id=student_group.id
                WHERE student_group.name="М-6");
                
-- Получить информацию о доцентах, преподающих в группах 3Г и 8Г.
SELECT * FROM teacher
WHERE position="Доцент" 
AND id IN (SELECT DISTINCT teacher_id
			FROM teacher_subject_group
			WHERE group_id in ("8Г","3Г"));
            
-- Получить номера предметов, номера преподавателей, номера групп, в которых ведут занятия преподаватели с кафедры ЭВМ, имеющих специальность АСОИ.
SELECT subject_id,teacher_subject_group.teacher_id,group_id FROM teacher_subject_group
LEFT JOIN teacher
ON teacher_id=teacher.id
	LEFT JOIN teacher_speciality
	ON teacher.id=teacher_speciality.teacher_id 
WHERE department="ЭВМ" AND speciality="АСОИ";

-- Получить номера групп с такой же специальностью, что и специальность преподавателей.
SELECT DISTINCT group_id FROM teacher_subject_group
LEFT JOIN student_group
ON group_id=student_group.id
	LEFT JOIN teacher_speciality 
    ON teacher_subject_group.teacher_id=teacher_speciality.teacher_id
WHERE student_group.speciality=teacher_speciality.speciality;

-- Получить номера преподавателей с кафедры ЭВМ, преподающих предметы по специальности, совпадающей со специальностью студенческой группы.
SELECT DISTINCT teacher_subject_group.teacher_id FROM teacher_subject_group
LEFT JOIN student_group
ON group_id=student_group.id
	LEFT JOIN teacher_speciality 
    ON teacher_subject_group.teacher_id=teacher_speciality.teacher_id
		LEFT JOIN teacher
        ON teacher_subject_group.teacher_id=teacher.id
WHERE student_group.speciality=teacher_speciality.speciality AND teacher.department="ЭВМ";

-- Получить специальности студенческой группы, на которых работают преподаватели кафедры АСУ.
SELECT DISTINCT speciality FROM student_group
LEFT JOIN teacher_subject_group 
ON  student_group.id=group_id
	LEFT JOIN teacher
    ON teacher_id=teacher.id
WHERE department="АСУ";

-- Получить номера предметов, изучаемых группой АС-8.
SELECT subject_id FROM teacher_subject_group
LEFT JOIN student_group
ON group_id=student_group.id
WHERE name="АС-8";

-- Получить номера студенческих групп, которые изучают те же предметы, что и студенческая группа АС-8.
SELECT DISTINCT group_id FROM teacher_subject_group
WHERE subject_id IN (SELECT subject_id FROM teacher_subject_group
					LEFT JOIN student_group
					ON group_id=student_group.id
					WHERE name="АС-8");
                    
-- Получить номера студенческих групп, которые не изучают предметы, преподаваемых в студенческой группе АС-8.
SELECT DISTINCT id FROM student_group
WHERE id NOT IN (SELECT DISTINCT group_id
				FROM teacher_subject_group
				WHERE subject_id IN (SELECT subject_id
									FROM teacher_subject_group
									LEFT JOIN student_group
									ON group_id=student_group.id
									WHERE name="АС-8"));
                                    
-- Получить номера студенческих групп, которые не изучают предметы, преподаваемых преподавателем 430Л.
SELECT DISTINCT id FROM student_group
WHERE id NOT IN
			(SELECT DISTINCT group_id
			FROM teacher_subject_group
			WHERE teacher_id="430Л");
            
-- Получить номера преподавателей, работающих с группой Э-15, но не преподающих предмет 12П.
SELECT last_name FROM teacher
LEFT JOIN teacher_subject_group
ON teacher.id=teacher_id
	LEFT JOIN student_group
    ON group_id=student_group.id
WHERE student_group.name="Э-15" AND subject_id<>"12П";