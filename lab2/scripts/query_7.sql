SELECT "ИД","ИМЯ","ФАМИЛИЯ" FROM "Н_ЛЮДИ" WHERE "ИД" NOT IN (SELECT "Н_УЧЕНИКИ"."ЧЛВК_ИД" FROM "Н_УЧЕНИКИ");