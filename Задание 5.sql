--ДОП ЗАДАЧА ПО БЛОКУ 5
--УСЛОВИЕ:
/*Создать запрос для вывода всех дат, отсутствующих в
некоторой последовательности дат. Последовательность дат и результат представляются в виде списков с разделителем в виде запятой.*/
DEFINE str = '01.03.2017,02.03.2017,04.03.2017,10.03.2017'
WITH
--Преобразуем строку с датами в столбец
STR_DATES AS
(SELECT TO_DATE(REGEXP_SUBSTR('&str', '[^,]+', 1, LEVEL), 'DD.MM.RRRR') AS DAYS
 FROM DUAL
 CONNECT BY LEVEL <= LENGTH(REGEXP_REPLACE('&str', '[^,]')) + 1),
--Определим крайние даты интервала
DATE_INTERVAL AS
(SELECT MIN(DAYS) AS FIRST_DATE, MAX(DAYS) AS LAST_DATE
 FROM STR_DATES),
--Определим все даты в этом интервале
ALL_DATES AS
(SELECT FIRST_DATE + LEVEL - 1 AS DATES
 FROM DATE_INTERVAL
 CONNECT BY LEVEL <= (LAST_DATE - FIRST_DATE + 1)),
--Определим недостающие даты в исходной строке
REPLY AS
(SELECT *
 FROM ALL_DATES
 MINUS
 SELECT *
 FROM STR_DATES),
--Преобразуем столбец искомых дат в строку
D_STR AS
(SELECT LTRIM(SYS_CONNECT_BY_PATH(DATES, ','), ',') AS STR, LENGTH(SYS_CONNECT_BY_PATH(DATES, ',')) AS LEN
 FROM REPLY
 START WITH DATES = (SELECT MIN(DATES) FROM REPLY)
 CONNECT BY PRIOR DATES < DATES)
--Выберем строку с искомыми датами (самую длинную)
SELECT STR AS DATES
FROM D_STR
WHERE LEN = (SELECT MAX(LEN) FROM D_STR);