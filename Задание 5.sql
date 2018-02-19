--��� ������ �� ����� 5
--�������:
/*������� ������ ��� ������ ���� ���, ������������� �
��������� ������������������ ���. ������������������ ��� � ��������� �������������� � ���� ������� � ������������ � ���� �������.*/
DEFINE str = '01.03.2017,02.03.2017,04.03.2017,10.03.2017'
WITH
--����������� ������ � ������ � �������
STR_DATES AS
(SELECT TO_DATE(REGEXP_SUBSTR('&str', '[^,]+', 1, LEVEL), 'DD.MM.RRRR') AS DAYS
 FROM DUAL
 CONNECT BY LEVEL <= LENGTH(REGEXP_REPLACE('&str', '[^,]')) + 1),
--��������� ������� ���� ���������
DATE_INTERVAL AS
(SELECT MIN(DAYS) AS FIRST_DATE, MAX(DAYS) AS LAST_DATE
 FROM STR_DATES),
--��������� ��� ���� � ���� ���������
ALL_DATES AS
(SELECT FIRST_DATE + LEVEL - 1 AS DATES
 FROM DATE_INTERVAL
 CONNECT BY LEVEL <= (LAST_DATE - FIRST_DATE + 1)),
--��������� ����������� ���� � �������� ������
REPLY AS
(SELECT *
 FROM ALL_DATES
 MINUS
 SELECT *
 FROM STR_DATES),
--����������� ������� ������� ��� � ������
D_STR AS
(SELECT LTRIM(SYS_CONNECT_BY_PATH(DATES, ','), ',') AS STR, LENGTH(SYS_CONNECT_BY_PATH(DATES, ',')) AS LEN
 FROM REPLY
 START WITH DATES = (SELECT MIN(DATES) FROM REPLY)
 CONNECT BY PRIOR DATES < DATES)
--������� ������ � �������� ������ (����� �������)
SELECT STR AS DATES
FROM D_STR
WHERE LEN = (SELECT MAX(LEN) FROM D_STR);