SELECT "Н_УЧЕНИКИ"."ГРУППА" as stud_group, count(*) as stud_count
    FROM "Н_УЧЕНИКИ" WHERE
    "Н_УЧЕНИКИ"."ГРУППА" IN (SELECT "ГРУППА" FROM "Н_ГРУППЫ_ПЛАНОВ"
        WHERE
            "Н_ГРУППЫ_ПЛАНОВ"."ПЛАН_ИД" IN (SELECT "Н_ПЛАНЫ"."ИД" as plan_id FROM "Н_ПЛАНЫ" WHERE
            "Н_ПЛАНЫ"."УЧЕБНЫЙ_ГОД" IN ('2010/2011', '2011/2012')
                AND
            "ОТД_ИД_ЗАКРЕПЛЕН_ЗА" = (SELECT "Н_ОТДЕЛЫ"."ИД"
                                    FROM "Н_ОТДЕЛЫ"
                                    WHERE "ИМЯ_В_ИМИН_ПАДЕЖЕ" = 'кафедра вычислительной техники')))
    GROUP BY stud_group HAVING count(*) BETWEEN 0 AND 5;