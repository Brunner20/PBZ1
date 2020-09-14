-- Получить полную информацию обо всех проектах.
SELECT * FROM project;

-- Получить все сочетания "цвета деталей-города деталей".
SELECT color,city FROM part;

-- Получить номера деталей, поставляемых поставщиком в Лондоне
SELECT DISTINCT part_id FROM supplier_part_project
LEFT JOIN supplier
ON supplier_id=supplier.id
WHERE supplier.city="Лондон";

-- Получить все пары названий городов, для которых поставщик из первого города обеспечивает проект во втором городе.
SELECT DISTINCT supplier.city AS city_from, project.city AS city_to FROM supplier
LEFT JOIN supplier_part_project
ON supplier.id=supplier_id
	LEFT JOIN project
    ON project_id=project.id
WHERE supplier.city<>project.city;

-- Получить все такие пары номеров деталей, которые обе поставляются одновременно одним поставщиком.
SELECT DISTINCT spp1.part_id AS part1, spp2.part_id AS part2 FROM supplier_part_project AS spp1
JOIN supplier_part_project AS spp2
ON spp1.supplier_id<>spp2.supplier_id
WHERE spp1.part_id>spp2.part_id
ORDER BY part1,part2;

-- Получить имена проектов, обеспечиваемых поставщиком П1.
SELECT title FROM project
JOIN supplier_part_project
ON project.id=project_id
WHERE supplier_id="П1";

-- Получить номера деталей, поставляемых для какого-либо проекта в Лондоне.
SELECT DISTINCT part_id FROM project
LEFT JOIN supplier_part_project
ON project.id=project_id
WHERE city="Лондон";

-- Получить номера проектов, город которых стоит первым в алфавитном списке городов.
SELECT id FROM project
ORDER BY city
LIMIT 1;

-- Получить номера деталей, поставляемых для лондонских проектов.
SELECT DISTINCT part_id FROM supplier_part_project
LEFT JOIN project
ON project_id=project.id
WHERE project.city="Лондон";

-- Получить номера проектов, обеспечиваемых по крайней мере всеми деталями поставщика П1.
SELECT DISTINCT project_id FROM supplier_part_project
WHERE part_id =ALL (SELECT part_id 
						FROM supplier_part_project
                        WHERE supplier_id="П1");
