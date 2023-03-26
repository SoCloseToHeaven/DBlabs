SELECT "Н_УЧЕНИКИ"."ГРУППА", "Н_ЛЮДИ"."ИМЯ", "Н_ЛЮДИ"."ФАМИЛИЯ", "Н_ЛЮДИ"."ОТЧЕСТВО", "Н_УЧЕНИКИ"."ПРИМЕЧАНИЕ"
       FROM "Н_УЧЕНИКИ" JOIN "Н_ЛЮДИ" ON ("Н_УЧЕНИКИ"."ЧЛВК_ИД" = "Н_ЛЮДИ"."ИД")
        AND
            ("Н_УЧЕНИКИ"."ПРИМЕЧАНИЕ" SIMILAR TO '%01\.09\.00\s\(Зачислить\)')
        WHERE "Н_УЧЕНИКИ"."ПЛАН_ИД" IN
              (SELECT "Н_ПЛАНЫ"."ИД" FROM "Н_ПЛАНЫ" WHERE
                    "Н_ПЛАНЫ"."ФО_ИД" in (SELECT "Н_ФОРМЫ_ОБУЧЕНИЯ"."ИД" FROM "Н_ФОРМЫ_ОБУЧЕНИЯ"
                        WHERE "Н_ФОРМЫ_ОБУЧЕНИЯ"."НАИМЕНОВАНИЕ" in ('Очная','Заочная'))
                AND
                    "Н_ПЛАНЫ"."КУРС" in (1,5));

-- Instead of using 01.09.12 we could use 01.09.00 to check if query is right
-- There is no way whether the 5-th year of study is a speciality or a master's degree