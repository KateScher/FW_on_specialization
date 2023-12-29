CREATE DATABASE IF NOT EXISTS Human_Friends;
USE Human_Friends;

CREATE TABLE IF NOT EXISTS AnimalClass(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(30)
);

INSERT INTO AnimalClass(name)
VALUES
    ('Pets'),
    ('Pack Animals');

SELECT * FROM AnimalClass;

CREATE TABLE IF NOT EXISTS Types(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(30),
    AnimalClass_id INT,
    CONSTRAINT fk_AnimalClass FOREIGN KEY(AnimalClass_id) REFERENCES AnimalClass(id)
);

INSERT INTO Types(name, AnimalClass_id)
VALUES
    ('Dog', 1),
    ('Cat', 1),
    ('Hamster', 1),
    ('Horse', 2),
    ('Camel', 2),
    ('Donkey', 2);  
    
SELECT * FROM Types;

CREATE TABLE IF NOT EXISTS Animals(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(30),
    type_id int,
    birthday DATE,
    CONSTRAINT fk_type Foreign Key (type_id) REFERENCES Types(id)
);

INSERT INTO Animals(name, type_id, birthday)
VALUES ('Рекс', 1, '2022-02-28'),
    ('Буран', 1, '2020-07-22'),
    ('Альфа', 1, '2018-10-15'),
    ('Матроскин', 2, '2021-03-01'),
    ('Скрудж', 2, '2016-07-13'),
    ('Рыжик', 2, '2019-01-12'),
    ('Черныш', 3, '2023-05-12'),
    ('Зубик', 3, '2023-04-15'),
    ('Хам', 3, '2017-08-21'),
    ('Ветер', 4, '2018-11-03'),
    ('Плюш', 4, '2021-08-14'),
    ('Египет', 5, '2019-08-22'),
    ('Фидель', 5, '2022-12-08'),
    ('Хороший', 6, '2020-03-11'),
    ('Умка', 6, '2022-08-08');

SELECT * FROM Animals;

DROP TABLE IF EXISTS Commands;
CREATE TABLE IF NOT EXISTS Commands(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(30),
    animal_id int,
    CONSTRAINT fk_animal Foreign Key (animal_id) REFERENCES Animals(id)
);

INSERT INTO Commands(name, animal_id)
VALUES ('Сидеть', 1), ('Лапу', 1), 
    ('Гулять', 2), ('Спать', 2),
    ('Умри', 3), ('Ешь', 3),
    ('Гулять', 4), ('Сидеть', 4),
    ('Можно', 5), ('Сидеть', 5),
    ('Место', 6), ('Играть', 6),
    ('Беги', 7), ('Гулять', 7), ('Сидеть', 7),
    ('Место', 8), ('Тихо', 8),
	('Голос', 9), ('Умри', 9), ('Рядом', 9),
    ('Беги', 10), ('Стой', 10),
    ('Тихо', 11), ('Голос', 11),
    ('Играть', 16), ('Стой', 16);
    
-- выведем все значения таблицы Commands
SELECT * FROM Commands;

-- создадим таблицу и выбираем только лошадей и ослов
CREATE VIEW PackAnimalsCommands AS
SELECT 
    a.id,
    a.name,
    a.birthday,
    t.name AS animal_type,
    AnimalClass.name AS anc,
    GROUP_CONCAT(cm.name ORDER BY cm.name ASC SEPARATOR ', ') AS concatenated_commands
FROM Animals AS a
LEFT JOIN Types AS t ON t.id = a.type_id
JOIN AnimalClass ON t.AnimalClass_id = animalClass.id
LEFT JOIN Commands AS cm ON cm.animal_id = a.id
WHERE anc.name = 'Pack Animals' AND (t.name = 'Horse' OR t.name = 'Camel')
GROUP BY a.id, a.name, a.birthday, t.name, anc.name;

SELECT * FROM packanimalswithcommands;

-- создадим таблицу, которая объединит таблицы Types, Animals, AnimalClass и выберет возраст животных от 1 до 3 лет
CREATE VIEW YoungAnimals AS
SELECT
    a.name,
    a.birthday,
    t.name AS animal_type,
    AnimalClass.name AS AnimalClass,
    CONCAT(
        TIMESTAMPDIFF(YEAR, a.birthday, CURDATE()),
        ' years ',
        TIMESTAMPDIFF(MONTH, a.birthday, CURDATE()) % 12,
        ' months'
    ) AS age
FROM Animals as a
LEFT JOIN Types AS t ON t.id = a.type_id
JOIN AnimalClass AS AnimalClass ON t.AnimalClass_id = AnimalClass.id
WHERE TIMESTAMPDIFF(YEAR, a.birthday, CURDATE()) BETWEEN 1 AND 3;

SELECT * FROM YoungAnimals;

SELECT 
    a.id,
    a.name,
    CONCAT(
        TIMESTAMPDIFF(YEAR, a.birthday, CURDATE()),
        ' years ',
        TIMESTAMPDIFF(MONTH, a.birthday, CURDATE()) % 12,
        ' months'
    ) AS age,
    t.name AS animal_type,
    AnimalClass.name AS AnimalClass,
    GROUP_CONCAT(cm.name ORDER BY cm.name ASC SEPARATOR ', ') AS concatenated_commands
FROM Animals AS a
LEFT JOIN Types AS t ON t.id = a.type_id
JOIN AnimalClass AS AnimalClass ON t.category_id = AnimalClass.id
LEFT JOIN Commands AS cm ON cm.animal_id = a.id
GROUP BY a.id, a.name, a.birthday, t.name, AnimalClass.name
ORDER BY age;