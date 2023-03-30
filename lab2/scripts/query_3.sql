SELECT COUNT("Н_ЛЮДИ"."ИД") > 0 as IS_THERE_STUDENTS_YOUNGER_THAN_20 FROM "Н_ЛЮДИ"
         WHERE
            "Н_ЛЮДИ"."ИД" IN (SELECT "Н_УЧЕНИКИ"."ЧЛВК_ИД" FROM "Н_УЧЕНИКИ"
                                         WHERE "Н_УЧЕНИКИ"."ГРУППА"='3102')
           AND
             ('01-01-2011'::date - "Н_ЛЮДИ"."ДАТА_РОЖДЕНИЯ") < '20 years'::interval;


/**
  There is no point to use CURRENT_DATE, because all selected students are older than 20 y.o. at the current moment
  In that case I have decided to use "01-01-2011" instead of using CURRENT_DATE
 */