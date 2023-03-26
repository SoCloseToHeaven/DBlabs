SELECT DISTINCT("ГРУППА") as stud_group, AVG(CURRENT_DATE-"Н_ЛЮДИ"."ДАТА_РОЖДЕНИЯ") as avg_age
FROM "Н_УЧЕНИКИ" JOIN "Н_ЛЮДИ"
    ON "Н_УЧЕНИКИ"."ЧЛВК_ИД" = "Н_ЛЮДИ"."ИД"
        GROUP BY stud_group
            HAVING AVG(CURRENT_DATE-"Н_ЛЮДИ"."ДАТА_РОЖДЕНИЯ") <
            (SELECT min(CURRENT_DATE - "ДАТА_РОЖДЕНИЯ") as min_age FROM "Н_ЛЮДИ"
          JOIN "Н_УЧЕНИКИ" ON
              "Н_ЛЮДИ"."ИД" = "Н_УЧЕНИКИ"."ЧЛВК_ИД" AND "Н_УЧЕНИКИ"."ГРУППА" = '3100');
