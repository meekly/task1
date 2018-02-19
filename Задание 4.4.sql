--Доп задача 4.4
WITH
TEMP_TAB AS
--Создадим таблицу с количеством строк не менее 365 (по числу дней в 2013 году)
(SELECT 'day'
FROM DUAL
GROUP BY CUBE(1, 2, 3, 4, 5, 6, 7, 8, 9))
--Выведем даты 2013 года: будем прибавлять к первому дню года (номер текущей строки из таблицы TEMP_TAB - 1), пока не получим 31 декабря 2013 года
SELECT TO_CHAR(TO_DATE('01.01.2013', 'DD.MM.RRRR') + (ROWNUM - 1), 'DD.MM.RRRR') AS "Date", TO_CHAR(TO_DATE('01.01.2013', 'DD.MM.RRRR') + (ROWNUM - 1), 'Day') AS "Day"
FROM TEMP_TAB
WHERE ROWNUM <= 365;