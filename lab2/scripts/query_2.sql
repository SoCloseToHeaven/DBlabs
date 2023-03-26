SELECT "Н_ЛЮДИ"."ИМЯ", "Н_ВЕДОМОСТИ"."ИД", "Н_СЕССИЯ"."ЧЛВК_ИД"
    FROM "Н_ЛЮДИ"
        RIGHT JOIN "Н_ВЕДОМОСТИ" ON
            "Н_ЛЮДИ"."ИД" = "Н_ВЕДОМОСТИ"."ЧЛВК_ИД"
        RIGHT JOIN "Н_СЕССИЯ" ON
            "Н_ВЕДОМОСТИ"."ЧЛВК_ИД" = "Н_СЕССИЯ"."ЧЛВК_ИД"
    WHERE
        "Н_ЛЮДИ"."ИМЯ" > 'Роман'
      AND
        "Н_ВЕДОМОСТИ"."ИД" < 1250972
      AND
        "Н_СЕССИЯ"."УЧГОД" = '2001/2002';