/*SELECT tab.TABLE_NAME, col.CONSTRAINT_NAME AS C1_NAME, con.SEARCH_CONDITION AS C1_TEXT, col.COL_COUNT AS C1_COL_CNT, col1.CONSTRAINT_NAME AS C2_NAME, con1.SEARCH_CONDITION AS C2_TEXT, col1.COL_COUNT AS C2_COL_CNT, con2.CONSTR_COUNT AS C_CNT
FROM USER_TABLES tab LEFT OUTER JOIN
  --������ ������� ��� ��������� ������ ����������� Check
  (SELECT ucc.TABLE_NAME, ucc.CONSTRAINT_NAME, COUNT(ucc.COLUMN_NAME) AS COL_COUNT
   FROM USER_CONS_COLUMNS ucc
   --���������� �� ����� � ������� �����������, �.�. ������� ������������ ������������ ������� ��� ������� ����� �����������
   GROUP BY ucc.CONSTRAINT_NAME, ucc.TABLE_NAME) col ON tab.TABLE_NAME = col.TABLE_NAME
   --���������� � USER_CONSTRAINTS, ����� �������� ����� ����������� ��� ������� �����������
   LEFT OUTER JOIN 
   USER_CONSTRAINTS con ON con.CONSTRAINT_NAME = col.CONSTRAINT_NAME
   LEFT OUTER JOIN
  --������ ������� ��� ��������� ������� ����������� Check
   (SELECT ucc.TABLE_NAME, ucc.CONSTRAINT_NAME, COUNT(ucc.COLUMN_NAME) AS COL_COUNT
   FROM USER_CONS_COLUMNS ucc
   --���������� �� ����� � ������� �����������, �.�. ������� ������������ ������������ ������� ��� ������� ����� �����������
   GROUP BY ucc.CONSTRAINT_NAME, ucc.TABLE_NAME) col1 ON tab.TABLE_NAME = col1.TABLE_NAME
   --���������� � USER_CONSTRAINTS, ����� �������� ����� ����������� ��� ������� �����������
   LEFT OUTER JOIN 
   USER_CONSTRAINTS con1 ON con1.CONSTRAINT_NAME = col1.CONSTRAINT_NAME
   LEFT OUTER JOIN
   --������ ������� ��� ��������� ���������� ����������� �� ������ ������� (TABLE_NAME)
   (SELECT TABLE_NAME, COUNT(CONSTRAINT_NAME) AS CONSTR_COUNT
   FROM  USER_CONSTRAINTS
   GROUP BY TABLE_NAME) con2 ON con2.TABLE_NAME = tab.TABLE_NAME
--������������� ������� ������ ������� � ������� �����������
--�������� ������ ����������� Check
WHERE con.CONSTRAINT_TYPE = 'C'
--������ ����������� ������ ���� ������ � ���������� �������
AND col.CONSTRAINT_NAME IN(SELECT MIN(CONSTRAINT_NAME)
                              FROM (SELECT TABLE_NAME, CONSTRAINT_NAME, COUNT(COLUMN_NAME) AS COL_COUNT
                                    FROM USER_CONS_COLUMNS
                                    GROUP BY CONSTRAINT_NAME, TABLE_NAME)
                              GROUP BY TABLE_NAME)
--������ ����������� ������ ���� ������ � ���������� �������
AND col1.CONSTRAINT_NAME IN(SELECT MIN(CONSTRAINT_NAME)
                            FROM (SELECT TABLE_NAME, CONSTRAINT_NAME, COUNT(COLUMN_NAME) AS COL_COUNT
                                  FROM USER_CONS_COLUMNS
                                  GROUP BY CONSTRAINT_NAME, TABLE_NAME)
                            WHERE CONSTRAINT_NAME NOT IN(SELECT MIN(CONSTRAINT_NAME)
                                                          FROM (SELECT TABLE_NAME, CONSTRAINT_NAME, COUNT(COLUMN_NAME) AS COL_COUNT
                                                                FROM USER_CONS_COLUMNS
                                                                GROUP BY CONSTRAINT_NAME, TABLE_NAME)
                                                          GROUP BY TABLE_NAME)
                            GROUP BY TABLE_NAME);*/
---------------------------------
SELECT tab.TABLE_NAME, c1.CONSTRAINT_NAME AS C1_NAME, col.SEARCH_CONDITION AS C1_TEXT, NVL(col.COL_COUNT, 0) AS C1_COL_CNT--, c2.CONSTRAINT_NAME AS C2_NAME, col1.SEARCH_CONDITION AS C2_TEXT, NVL(col1.COL_COUNT, 0) AS C2_COL_CNT, NVL(con.CONSTR_COUNT, 0) AS C_CNT
FROM USER_TABLES tab LEFT OUTER JOIN
    --������ ������� ��� ��������� ��� ����������� Check, ������� �������� ������� � ���������� ������� ��� ������ �������
    (SELECT TABLE_NAME, MIN(CONSTRAINT_NAME) AS CONSTRAINT_NAME
    FROM USER_CONSTRAINTS
    WHERE CONSTRAINT_TYPE = 'C'
    GROUP BY TABLE_NAME) c1 ON tab.TABLE_NAME = c1.TABLE_NAME
    LEFT OUTER JOIN
  --������ ������� ��� ��������� ���������� �� ������ ������������ Check
   (SELECT c.CONSTRAINT_NAME, c.COL_COUNT, con.SEARCH_CONDITION
   --������ ������� ��� ��������� ���������� �������� � ������ �����������
    FROM (SELECT CONSTRAINT_NAME, COUNT(COLUMN_NAME) AS COL_COUNT
          FROM USER_CONS_COLUMNS
          GROUP BY CONSTRAINT_NAME) c
    --���������� � USER_CONSTRAINTS, ����� �������� ����� ����������� ��� ������� �����������
    LEFT OUTER JOIN USER_CONSTRAINTS con ON con.CONSTRAINT_NAME = c.CONSTRAINT_NAME
    --�������� ������ ����������� Check
    WHERE con.CONSTRAINT_TYPE = 'C') col ON c1.CONSTRAINT_NAME = col.CONSTRAINT_NAME
    LEFT OUTER JOIN
    
   --������ ������� ��� ��������� ��� ����������� Check, ������� �������� ������� � ���������� ������� ��� ������ �������
   (SELECT TABLE_NAME, MIN(CONSTRAINT_NAME) AS CONSTRAINT_NAME
    FROM (SELECT TABLE_NAME, CONSTRAINT_NAME
          FROM USER_CONSTRAINTS
          WHERE CONSTRAINT_TYPE = 'C'
          --���������� �� ����� � ������� �����������, �.�. ������� ������������ ������������ ������� ��� ������� ����� �����������
          GROUP BY CONSTRAINT_NAME, TABLE_NAME)
    --��������� �����������, ���������� ������� � ���������� �������
    WHERE CONSTRAINT_NAME NOT IN(SELECT MIN(CONSTRAINT_NAME)
                                  FROM USER_CONSTRAINTS
                                  WHERE CONSTRAINT_TYPE = 'C'
                                  GROUP BY TABLE_NAME)
    GROUP BY TABLE_NAME) c2 ON tab.TABLE_NAME = c2.TABLE_NAME
    LEFT OUTER JOIN
  --������ ������� ��� ��������� ���������� �� ������� ����������� Check
   (SELECT c.CONSTRAINT_NAME, c.COL_COUNT, con.SEARCH_CONDITION
   --������ ������� ��� ��������� ���������� �������� � ������ �����������
    FROM (SELECT CONSTRAINT_NAME, COUNT(COLUMN_NAME) AS COL_COUNT
          FROM USER_CONS_COLUMNS
          GROUP BY CONSTRAINT_NAME) c
    --���������� � USER_CONSTRAINTS, ����� �������� ����� ����������� ��� ������� �����������
    LEFT OUTER JOIN USER_CONSTRAINTS con ON con.CONSTRAINT_NAME = c.CONSTRAINT_NAME
    --�������� ������ ����������� Check
    WHERE con.CONSTRAINT_TYPE = 'C') col1 ON c2.CONSTRAINT_NAME = col1.CONSTRAINT_NAME AND c1.CONSTRAINT_NAME != c2.CONSTRAINT_NAME
   LEFT OUTER JOIN
   --������ ������� ��� ��������� ���������� ����������� �� ������ ������� (TABLE_NAME)
   (SELECT TABLE_NAME, COUNT(CONSTRAINT_NAME) AS CONSTR_COUNT
   FROM  USER_CONSTRAINTS
   WHERE CONSTRAINT_TYPE = 'C'
   GROUP BY TABLE_NAME) con ON con.TABLE_NAME = tab.TABLE_NAME;
   
   
/*   
--������������� ������� ������ ������� � ������� �����������
--������ ����������� ������ ���� ������ � ���������� �������
WHERE col.CONSTRAINT_NAME IN(SELECT TABLE_NAME, MIN(CONSTRAINT_NAME)
                              FROM (SELECT TABLE_NAME, CONSTRAINT_NAME, COUNT(COLUMN_NAME) AS COL_COUNT
                                    FROM USER_CONS_COLUMNS
                                    GROUP BY CONSTRAINT_NAME, TABLE_NAME)
                              GROUP BY TABLE_NAME)
--������ ����������� ������ ���� ������ � ���������� �������
AND col1.CONSTRAINT_NAME IN(SELECT MIN(CONSTRAINT_NAME)
                            FROM (SELECT TABLE_NAME, CONSTRAINT_NAME, COUNT(COLUMN_NAME) AS COL_COUNT
                                  FROM USER_CONS_COLUMNS
                                  GROUP BY CONSTRAINT_NAME, TABLE_NAME)
                            WHERE CONSTRAINT_NAME NOT IN(SELECT MIN(CONSTRAINT_NAME)
                                                          FROM (SELECT TABLE_NAME, CONSTRAINT_NAME, COUNT(COLUMN_NAME) AS COL_COUNT
                                                                FROM USER_CONS_COLUMNS
                                                                GROUP BY CONSTRAINT_NAME, TABLE_NAME)
                                                          GROUP BY TABLE_NAME)
                            GROUP BY TABLE_NAME);
*/









---------------------------------
SELECT *
FROM USER_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'SYS_C00557683';

SELECT TABLE_NAME, MIN(CONSTRAINT_NAME)
FROM (SELECT TABLE_NAME, CONSTRAINT_NAME, COUNT(COLUMN_NAME) AS COL_COUNT
      FROM USER_CONS_COLUMNS
      GROUP BY CONSTRAINT_NAME, TABLE_NAME)
WHERE CONSTRAINT_NAME NOT IN(SELECT MIN(CONSTRAINT_NAME)
                              FROM (SELECT TABLE_NAME, CONSTRAINT_NAME, COUNT(COLUMN_NAME) AS COL_COUNT
                                    FROM USER_CONS_COLUMNS
                                    GROUP BY CONSTRAINT_NAME, TABLE_NAME)
                              GROUP BY TABLE_NAME)
GROUP BY TABLE_NAME
ORDER BY 1;

SELECT TABLE_NAME, MIN(CONSTRAINT_NAME)
FROM (SELECT TABLE_NAME, CONSTRAINT_NAME, COUNT(COLUMN_NAME) AS COL_COUNT
      FROM USER_CONS_COLUMNS
      GROUP BY CONSTRAINT_NAME, TABLE_NAME)
GROUP BY TABLE_NAME
ORDER BY 1;

SELECT *
FROM USER_TABLES tab LEFT OUTER JOIN
  --������ ������� ��� ��������� ������ ����������� Check
  (SELECT ucc.TABLE_NAME, ucc.CONSTRAINT_NAME, COUNT(ucc.COLUMN_NAME) AS COL_COUNT
   FROM USER_CONS_COLUMNS ucc
   --���������� �� ����� � ������� �����������, �.�. ������� ������������ ������������ ������� ��� ������� ����� �����������
   GROUP BY ucc.CONSTRAINT_NAME, ucc.TABLE_NAME) col ON tab.TABLE_NAME = col.TABLE_NAME;
------------------------------------------

SELECT col.TABLE_NAME, col.CONSTRAINT_NAME AS C1_NAME, con.SEARCH_CONDITION AS C1_TEXT, col.COL_COUNT AS C1_COL_CNT, col1.CONSTRAINT_NAME AS C2_NAME, con1.SEARCH_CONDITION AS C2_TEXT, col1.COL_COUNT AS C2_COL_CNT--, con2.CONSTR_COUNT AS C_CNT
FROM 
  --������ ������� ��� ��������� ������ ����������� Check
  (SELECT ucc.TABLE_NAME, ucc.CONSTRAINT_NAME, COUNT(ucc.COLUMN_NAME) AS COL_COUNT
   FROM USER_CONS_COLUMNS ucc
   --���������� �� ����� � ������� �����������, �.�. ������� ������������ ������������ ������� ��� ������� ����� �����������
   GROUP BY ucc.CONSTRAINT_NAME, ucc.TABLE_NAME) col
   --���������� � USER_CONSTRAINTS, ����� �������� ����� ����������� ��� ������� �����������
   INNER JOIN 
   USER_CONSTRAINTS con ON con.CONSTRAINT_NAME = col.CONSTRAINT_NAME
   LEFT OUTER JOIN
  --������ ������� ��� ��������� ������� ����������� Check
   (SELECT ucc.TABLE_NAME, ucc.CONSTRAINT_NAME, COUNT(ucc.COLUMN_NAME) AS COL_COUNT
   FROM USER_CONS_COLUMNS ucc
   --���������� �� ����� � ������� �����������, �.�. ������� ������������ ������������ ������� ��� ������� ����� �����������
   GROUP BY ucc.CONSTRAINT_NAME, ucc.TABLE_NAME) col1 ON col.TABLE_NAME = col1.TABLE_NAME
   --���������� � USER_CONSTRAINTS, ����� �������� ����� ����������� ��� ������� �����������
   INNER JOIN 
   USER_CONSTRAINTS con1 ON con1.CONSTRAINT_NAME = col1.CONSTRAINT_NAME;