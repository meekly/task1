--��� ������ 4.4
WITH
TEMP_TAB AS
--�������� ������� � ����������� ����� �� ����� 365 (�� ����� ���� � 2013 ����)
(SELECT 'day'
FROM DUAL
GROUP BY CUBE(1, 2, 3, 4, 5, 6, 7, 8, 9))
--������� ���� 2013 ����: ����� ���������� � ������� ��� ���� (����� ������� ������ �� ������� TEMP_TAB - 1), ���� �� ������� 31 ������� 2013 ����
SELECT TO_CHAR(TO_DATE('01.01.2013', 'DD.MM.RRRR') + (ROWNUM - 1), 'DD.MM.RRRR') AS "Date", TO_CHAR(TO_DATE('01.01.2013', 'DD.MM.RRRR') + (ROWNUM - 1), 'Day') AS "Day"
FROM TEMP_TAB
WHERE ROWNUM <= 365;