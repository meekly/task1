SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN(
        --���������� ������, ������� ������������ �������� � �������� FIRST_NAME, LAST_NAME � SALARY (� ��������� ���������� �����)
        --������� ������, ������� ����� ���������� �������� � ������� LAST_NAME
        SELECT E.EMPLOYEE_ID
        FROM EMPLOYEES E INNER JOIN EMPLOYEES E1 ON E.LAST_NAME = E1.LAST_NAME
        WHERE E.EMPLOYEE_ID != E1.EMPLOYEE_ID
        UNION
        --������� ������, ������� ����� ���������� �������� � ������� FIRST_NAME
        SELECT E.EMPLOYEE_ID
        FROM EMPLOYEES E INNER JOIN EMPLOYEES E1 ON E.FIRST_NAME = E1.FIRST_NAME
        WHERE E.EMPLOYEE_ID != E1.EMPLOYEE_ID
        UNION
        --������� ������, ������� ����� ���������� �������� � ������� SALARY
        SELECT E.EMPLOYEE_ID
        FROM EMPLOYEES E INNER JOIN EMPLOYEES E1 ON E.SALARY = E1.SALARY
        WHERE E.EMPLOYEE_ID != E1.EMPLOYEE_ID);






--, E1.EMPLOYEE_ID, E1.FIRST_NAME, E1.LAST_NAME, E1.SALARY
--E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, E.SALARY
