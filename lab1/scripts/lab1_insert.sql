INSERT INTO person(name, age) VALUES ('Джон Остром', 50);
INSERT INTO person(name, age) VALUES ('Роберк Бэккер', 23);

INSERT INTO university(name) VALUES ('Йельский университет');

INSERT INTO creature(type, population) VALUES ('Млекопитающее', 999999);
INSERT INTO creature(type, population) VALUES ('Хладнокровное', 100000);

INSERT INTO research_group(description) VALUES ('Исследовательская группа 1');
INSERT INTO research_group(description) VALUES ('something');

INSERT INTO university_to_person VALUES (1,1);
INSERT INTO university_to_person VALUES (1,2);

INSERT INTO group_to_person VALUES (1,1);
INSERT INTO group_to_person VALUES (1,2);
INSERT INTO group_to_person VALUES (2,1);

INSERT INTO fact(group_id, description) values (1,
                                                'Метаболические процессы у млекопитающих' ||
                                                'превращаю пищу в тепло');
INSERT INTO fact(group_id, description) values (1, 'Получают тепло из окружающей среды');

INSERT INTO fact_to_creature values (1,1);
insert into fact_to_creature values (1,2);