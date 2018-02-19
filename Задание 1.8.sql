--Дополнительное задание 1.8
--Создаём таблицу
CREATE TABLE "TEST"("ID" NUMBER(2) PRIMARY KEY, "TEXT" VARCHAR2(20) NOT NULL);
--Заполняем таблицу
INSERT INTO "TEST" VALUES(1, '12six');
INSERT INTO "TEST" VALUES(2, 't7w6o');
INSERT INTO "TEST" VALUES(3, '76three');
INSERT INTO "TEST" VALUES(4, '123four');
INSERT INTO "TEST" VALUES(5, 'five');
INSERT INTO "TEST" VALUES(6, '76one');
INSERT INTO "TEST" VALUES(7, '123');

INSERT INTO "TEST" VALUES(8, '123FIJ2JD');
INSERT INTO "TEST" VALUES(9, '123FXHF67');
--INSERT INTO "TEST" VALUES(10, 't7w6O');

--Запрос
SELECT "TEXT"
FROM "TEST"
ORDER BY CASE WHEN SUBSTR("TEXT", 1, 1) >= 'A' AND SUBSTR("TEXT", 1, 1) <= 'z' THEN 
   --Выводим ту часть начальную часть строки, которая содержит текст. Иначе - null
   CASE 
        --Определяем позицию, на которой встречается первая цифра в строке
        WHEN INSTR("TEXT", '0') != 0 AND (INSTR("TEXT", '1') = 0 OR INSTR("TEXT", '1') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '2') = 0 OR INSTR("TEXT", '2') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '3') = 0 OR INSTR("TEXT", '3') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '4') = 0 OR INSTR("TEXT", '4') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '5') = 0 OR INSTR("TEXT", '5') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '0')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '0')-1)
        WHEN INSTR("TEXT", '1') != 0 AND (INSTR("TEXT", '2') = 0 OR INSTR("TEXT", '2') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '3') = 0 OR INSTR("TEXT", '3') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '4') = 0 OR INSTR("TEXT", '4') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '5') = 0 OR INSTR("TEXT", '5') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '1')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '1')-1)
        WHEN INSTR("TEXT", '2') != 0 AND (INSTR("TEXT", '3') = 0 OR INSTR("TEXT", '3') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '4') = 0 OR INSTR("TEXT", '4') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '5') = 0 OR INSTR("TEXT", '5') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '2')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '2')-1)
        WHEN INSTR("TEXT", '3') != 0 AND (INSTR("TEXT", '4') = 0 OR INSTR("TEXT", '4') > INSTR("TEXT", '3'))
                                     AND (INSTR("TEXT", '5') = 0 OR INSTR("TEXT", '5') > INSTR("TEXT", '3'))
                                     AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '3'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '3'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '3'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '3')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '3')-1)
        WHEN INSTR("TEXT", '4') != 0 AND (INSTR("TEXT", '5') = 0 OR INSTR("TEXT", '5') > INSTR("TEXT", '4'))
                                     AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '4'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '4'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '4'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '4')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '4')-1)
        WHEN INSTR("TEXT", '5') != 0 AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '5'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '5'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '5'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '5')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '5')-1)
        WHEN INSTR("TEXT", '6') != 0 AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '6'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '6'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '6')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '6')-1)
        WHEN INSTR("TEXT", '7') != 0 AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '7'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '7')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '7')-1)
        WHEN INSTR("TEXT", '8') != 0 AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '8')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '8')-1)
        WHEN INSTR("TEXT", '9') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '9') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '9') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '9')-1)
        ELSE "TEXT"
    END
END ASC, 
TO_NUMBER(REGEXP_SUBSTR("TEXT", '^[[:digit:]]+')) ASC, TO_NUMBER(REGEXP_SUBSTR("TEXT", '^[[:digit:]]+$')) ASC, SUBSTR("TEXT", LENGTH(REGEXP_SUBSTR("TEXT", '^[[:digit:]]+'))+1) ASC;


----------------------------------------------------------------------------------------------------------------------------------

SELECT CASE WHEN SUBSTR("TEXT", 1, 1) >= '0' AND SUBSTR("TEXT", 1, 1) <= '9' THEN
    --Выводим числа в начале строки (до первой буквы)
    /*SUBSTR("TEXT", 1,
      --Находим позицию первой буквы в строке
      INSTR("TEXT", */
          --Определяем первую букву в строке. Для этого убираем все цифры из начала строки
          CASE WHEN SUBSTR("TEXT", 1, 1) IN('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') THEN TRIM(SUBSTR("TEXT", 1, 1) FROM "TEXT") END
          CASE WHEN SUBSTR("TEXT", 1, 1) IN('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') THEN TRIM(SUBSTR("TEXT", 1, 1) FROM "TEXT") END
          CASE WHEN SUBSTR("TEXT", 1, 1) IN('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') THEN TRIM(SUBSTR("TEXT", 1, 1) FROM "TEXT") END
          CASE WHEN SUBSTR("TEXT", 1, 1) IN('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') THEN TRIM(SUBSTR("TEXT", 1, 1) FROM "TEXT") END
          CASE WHEN SUBSTR("TEXT", 1, 1) IN('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') THEN TRIM(SUBSTR("TEXT", 1, 1) FROM "TEXT") END
          CASE WHEN SUBSTR("TEXT", 1, 1) IN('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') THEN TRIM(SUBSTR("TEXT", 1, 1) FROM "TEXT") END
          CASE WHEN SUBSTR("TEXT", 1, 1) IN('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') THEN TRIM(SUBSTR("TEXT", 1, 1) FROM "TEXT") END
          CASE WHEN SUBSTR("TEXT", 1, 1) IN('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') THEN TRIM(SUBSTR("TEXT", 1, 1) FROM "TEXT") END
          CASE WHEN SUBSTR("TEXT", 1, 1) IN('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') THEN TRIM(SUBSTR("TEXT", 1, 1) FROM "TEXT") END
     /* )
    )*/
    ELSE "TEXT"
   /*CASE 
        WHEN INSTR("TEXT", '0') != 0 AND (INSTR("TEXT", '1') = 0 OR INSTR("TEXT", '1') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '2') = 0 OR INSTR("TEXT", '2') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '3') = 0 OR INSTR("TEXT", '3') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '4') = 0 OR INSTR("TEXT", '4') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '5') = 0 OR INSTR("TEXT", '5') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '0'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '0')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '0')-1)
        WHEN INSTR("TEXT", '1') != 0 AND (INSTR("TEXT", '2') = 0 OR INSTR("TEXT", '2') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '3') = 0 OR INSTR("TEXT", '3') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '4') = 0 OR INSTR("TEXT", '4') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '5') = 0 OR INSTR("TEXT", '5') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '1'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '1')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '1')-1)
        WHEN INSTR("TEXT", '2') != 0 AND (INSTR("TEXT", '3') = 0 OR INSTR("TEXT", '3') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '4') = 0 OR INSTR("TEXT", '4') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '5') = 0 OR INSTR("TEXT", '5') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '2'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '2')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '2')-1)
        WHEN INSTR("TEXT", '3') != 0 AND (INSTR("TEXT", '4') = 0 OR INSTR("TEXT", '4') > INSTR("TEXT", '3'))
                                     AND (INSTR("TEXT", '5') = 0 OR INSTR("TEXT", '5') > INSTR("TEXT", '3'))
                                     AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '3'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '3'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '3'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '3')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '3')-1)
        WHEN INSTR("TEXT", '4') != 0 AND (INSTR("TEXT", '5') = 0 OR INSTR("TEXT", '5') > INSTR("TEXT", '4'))
                                     AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '4'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '4'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '4'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '4')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '4')-1)
        WHEN INSTR("TEXT", '5') != 0 AND (INSTR("TEXT", '6') = 0 OR INSTR("TEXT", '6') > INSTR("TEXT", '5'))
                                     AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '5'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '5'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '5')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '5')-1)
        WHEN INSTR("TEXT", '6') != 0 AND (INSTR("TEXT", '7') = 0 OR INSTR("TEXT", '7') > INSTR("TEXT", '6'))
                                     AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '6'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '6')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '6')-1)
        WHEN INSTR("TEXT", '7') != 0 AND (INSTR("TEXT", '8') = 0 OR INSTR("TEXT", '8') > INSTR("TEXT", '7'))
                                     AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '7')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '7')-1)
        WHEN INSTR("TEXT", '8') != 0 AND (INSTR("TEXT", '9') = 0 OR INSTR("TEXT", '9') > INSTR("TEXT", '8')) THEN SUBSTR("TEXT", 1, INSTR("TEXT", '8')-1)
        WHEN INSTR("TEXT", '9') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '9') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '9') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '9')-1)
        ELSE "TEXT"
    END*/
END
FROM "TEST";
--REGEXP_SUBSTR("TEXT", '^[[:digit:]]+[[:alpha:]]{1}.*')
-- SUBSTR("TEXT", LENGTH(REGEXP_SUBSTR("TEXT", '^[[:digit:]]+'))+1)
--SUBSTR("TEXT", 1, 1)
/*CASE 
              WHEN INSTR("TEXT", '0') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '0') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '0') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '0'))
              WHEN INSTR("TEXT", '1') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '1') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '1') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '1'))
              WHEN INSTR("TEXT", '2') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '2') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '2') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '2'))
              WHEN INSTR("TEXT", '3') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '3') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '3') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '3'))
              WHEN INSTR("TEXT", '4') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '4') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '4') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '4'))
              WHEN INSTR("TEXT", '5') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '5') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '5') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '5'))
              WHEN INSTR("TEXT", '6') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '6') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '6') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '6'))
              WHEN INSTR("TEXT", '7') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '7') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '7') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '7'))
              WHEN INSTR("TEXT", '8') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '8') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '8') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '8'))
              WHEN INSTR("TEXT", '9') != 0 AND (SUBSTR("TEXT", INSTR("TEXT", '9') - 1, 1) >= 'A' AND SUBSTR("TEXT", INSTR("TEXT", '9') - 1, 1) <= 'z') THEN SUBSTR("TEXT", 1, INSTR("TEXT", '9'))
              ELSE "TEXT"
END*/
/*SELECT "TEXT"
FROM "TEST"
ORDER BY REGEXP_SUBSTR("TEXT", '^[[:alpha:]]+') ASC, TO_NUMBER(REGEXP_SUBSTR("TEXT", '^[[:digit:]]+')) ASC, TO_NUMBER(REGEXP_SUBSTR("TEXT", '^[[:digit:]]+$')) ASC, SUBSTR("TEXT", LENGTH(REGEXP_SUBSTR("TEXT", '^[[:digit:]]+'))+1) ASC;
*/