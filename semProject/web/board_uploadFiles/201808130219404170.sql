--  DAY5 ��������
--  SUBQUERY(��������)
--  �������� : ������ �ȿ��� ���� ������
--  ������� ���ö�� ����� �μ� ��ȸ
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '���ö';

-- �μ��ڵ尡 D9�� ������ ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--  �μ��ڵ尡 ���ö ����� ���� �Ҽ��� ���� ��� ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                        FROM EMPLOYEE 
                        WHERE EMP_NAME = '���ö');
                        
--  �������� ��� �޿����� ���� �޿��� �ް� �ִ� ������
--  ���, �̸�, �����ڵ�, �޿��� ��ȸ�ϼ���
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEE);

-- ���������� ����
--  ������ �������� : ���������� ��ȸ ������� 1���� ��
--  ������ �������� : ���������� ��ȸ ������� ���� ������ �� ��
--  ���߿� �������� : ���������� ��ȸ ������� �÷��� ������ �� ��
--  ������ ���߿� �������� : ��ȸ ��� �� ���� �� ���� ������ �� ��

--  ���������� ������ ���� �������� �տ� �ٴ� �����ڰ� �ٸ�
--  ������ �������� �տ��� �Ϲ� �� ������ ���
--  >, <, >=, <=, =, !=/<>/^= (��������)

-- ���ö ����� �޿����� ���� �޴� ������
-- ���, �̸�, �μ�, ����, �޿��� ��ȸ�ϼ���

SELECT EMP_ID ���, EMP_NAME �̸�, DEPT_TITLE �μ�, JOB_NAME ����, SALARY �޿�
FROM EMPLOYEE E
JOIN JOB J ON( E.JOB_CODE = J.JOB_CODE)
JOIN DEPARTMENT D ON(E.DEPT_CODE = D.DEPT_ID)
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '���ö');

--���� ���� �޿��� �޴� ������
-- ���,�̸�,����,�μ�,�޿�,�Ի����� ��ȸ�ϼ���
SELECT EMP_ID ���, EMP_NAME �̸�,  JOB_NAME ����,
DEPT_TITLE �μ�, SALARY �޿�, HIRE_DATE �Ի���
FROM EMPLOYEE E
JOIN JOB J ON( E.JOB_CODE = J.JOB_CODE)
JOIN DEPARTMENT D ON(E.DEPT_CODE = D.DEPT_ID)
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);


--  ���������� SELECT, WHERE ,HAVING, FROM������ ����� �� �ִ�.
--  �μ��� �޿��� �հ� �� ���� ū �μ��� �μ���, �޿� �հ踦 ���ϼ���
SELECT DEPT_TITLE, SUM(SALARY)
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
GROUP BY DEPT_TITLE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                        GROUP BY DEPT_CODE);
                        


-- ������ ��������
-- ������ �������� �տ����� �Ϲ� �񱳿����� ��� ����
-- IN / NOT IN : ���� ���� ����� �߿��� �� ���� ��ġ�ϴ� ���� �ִٸ�
--                Ȥ�� ���ٸ� �̶�� �ǹ�
--  > ANY, < ANY : ���� ���� ����� �߿��� �� ���� ū / ���� ���
--                  ���� ���� ������ ũ��? / ���� ū ������ �۳�?
-- > ALL, < ALL : ��� ������ ū / ���� ���
--                  ���� ū ������ ũ��? / ���� ���� ������ �۳�?
-- EXISTS / NOT EXISTS : ���� �������� ����ϴ� �����ڷ�
--                         ���� �����ϳ� ? / �������� �ʴ���?

-- �μ��� �ְ� �޿��� �޴� ������ �̸�, ����, �μ�, �޿� ��ȸ
SELECT DEPT_CODE, MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT EMP_NAME, JOB_CODE, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY IN (SELECT MAX(SALARY)
                    FROM EMPLOYEE
                        GROUP BY DEPT_CODE);
                        
--  �����ڿ� �ش��ϴ� ������ ���� ������ �����ڰ� �ƴ� ������
--  ������ �����Ͽ� ��ȸ
--  ���, �̸�, �μ���, ����, '������' AS ���� / '����' AS ����

SELECT DISTINCT MANAGER_ID
FROM EMPLOYEE
WHERE MANAGER_ID IS NOT NULL;

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, '������' AS ����
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE EMP_ID IN (SELECT DISTINCT MANAGER_ID
                    FROM EMPLOYEE
                        WHERE MANAGER_ID IS NOT NULL)


UNION

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, '����' AS ����
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE EMP_ID NOT IN (SELECT DISTINCT MANAGER_ID
                    FROM EMPLOYEE
                        WHERE MANAGER_ID IS NOT NULL);


-- SELECT �������� ���������� ����� �� �ִ�.
SELECT EMP_ID, EMP_NAME, DEPT_TITLE,
        CASE WHEN EMP_ID IN (SELECT DISTINCT MANAGER_ID
                            FROM EMPLOYEE
                            WHERE MANAGER_ID IS NOT NULL)
            THEN '������'
          ELSE '����'
        END AS ����
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- �븮 ������ ������ �߿��� ���� ������ �ּ� �޿����� ���� �޴�
-- ������ ���, �̸�, ����, �޿��� ��ȸ�ϼ���
-- ��, > ANY Ȥ�� < ANY ������
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '����';

SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '�븮';


SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '�븮'

AND SALARY > ANY 
( SELECT SALARY FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '����'

);


-- ���� ������ �޿��� ���� ū ������ ���� �޴� ���� ������
-- ��� , �̸�, ����, �޿��� ��ȸ�ϼ���
-- ��, > ALL Ȥ�� < ALL �����ڸ� ���
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '����'

AND SALARY > ALL(SELECT SALARY FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '����');


SELECT *
FROM EMPLOYEE
WHERE EXISTS (SELECT *
                FROM EMPLOYEE
                    WHERE EMP_ID = '200');



-- �ڱ� ������ ��� �޿��� �ް� �ִ� ������
-- ���, �̸�, ����, �޿��� ��ȸ�ϼ���
-- ��, �޿��� �޿� ����� ���������� ����ϼ��� TRUNC(�÷���, -5)
SELECT JOB_CODE, TRUNC(AVG(SALARY, -5))
FROM EMPLOYEE
GROUP BY JOB_CODE;

SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY IN (SELECT TRUNC(AVG(SALARY), -5)
                    FROM EMPLOYEE
                            GROUP BY JOB_CODE);


-- ������ ���߿� ���������� �̿��� �ذ�
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (SELECT JOB_CODE,
                                TRUNC(AVG(SALARY), -5)
                                FROM EMPLOYEE
                                GROUP BY JOB_CODE);
                                
-- ���߿� ��������
-- ����� �������� ���� �μ�, ���� ���޿� �ش��ϴ�
-- ����� �̸�, ����, �μ� �Ի����� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = 2
AND ENT_YN = 'Y';

SELECT EMP_NAME, JOB_CODE, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE SUBSTR(EMP_NO, 8, 1) = 2
                    AND ENT_YN = 'Y')
AND JOB_CODE = (SELECT JOB_CODE
                FROM EMPLOYEE
                WHERE SUBSTR(EMP_NO, 8, 1) = 2
                AND ENT_YN = 'Y')
AND EMP_NAME <> (SELECT EMP_NAME
                FROM EMPLOYEE
                WHERE SUBSTR(EMP_NO, 8, 1) = 2
                AND ENT_YN = 'Y');
                
--���߿� ���������� ����
SELECT EMP_NAME, JOB_CODE, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) IN (SELECT DEPT_CODE, JOB_CODE
                                FROM EMPLOYEE
                                WHERE SUBSTR(EMP_NO, 8, 1) = 2
                                AND ENT_YN = 'Y')
AND EMP_ID <> (SELECT EMP_ID
                FROM EMPLOYEE
                    WHERE SUBSTR(EMP_NO, 8, 1) = 2
                    AND ENT_YN = 'Y');
                    
-- ���������� ��� ��ġ :
-- SELECT��, FROM��, WHERE��, HAVING��, GROUP BY��, ORDER BY��
-- DML ���� : INSERT��, UPDATE��
-- DDL ���� : CREATE TABLE��, CREATE VIEW��

-- FROM ������ ���������� ����� �� �ִ� : ���̺� ��ſ� ���
-- �ζ��� �� (INLINE VIEW)��� ��
-- : ���������� ���� �������(RESULT SET)�� ���� ��� ȭ��
SELECT EMP_NAME, JOB_NAME, SALARY
FROM (SELECT JOB_CODE, TRUNC(AVG(SALARY), -5) AS JOBAVG
    FROM EMPLOYEE
    GROUP BY JOB_CODE) V
    JOIN EMPLOYEE E ON(JOBAVG = SALARY AND E.JOB_CODE = V.JOB_CODE)
    JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
    ORDER BY JOB_NAME;
    
    
    
    SELECT EMP_NAME, DEPT_TITLE, JOB_NAME
    FROM (SELECT EMP_NAME, DEPT_TITLE, JOB_NAME
        FROM EMPLOYEE
        LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
        JOIN JOB USING(JOB_CODE))
        WHERE DEPT_TITLE = '�λ������';
    
    
    -- �ζ��κ並 Ȱ���� TOP-N�м�
    -- ORDER BY �� ����� ROWNUM�� ����
    -- ROWNUM�� �� ��ȣ�� �ǹ���
    -- FROM������ �ٿ���
    -- ORDER BY �� ������ ROWNUM�� �ٰ� �Ϸ��� ��������(�ζ��κ�)�� �����
    SELECT ROWNUM, EMP_NAME, SALARY
    FROM EMPLOYEE
    ORDER BY EMP_NAME;
    
    SELECT ROWNUM, EMP_NAME, SALARY
    FROM (SELECT * FROM EMPLOYEE
            ORDER BY SALARY DESC)
            WHERE ROWNUM <= 5;
            
            -- �޿� ��� 3�� �ȿ� ��� �μ��� �μ� �ڵ�� �μ���,
            -- ��� �޿��� ��ȸ�ϼ���
            
            
         SELECT DEPT_CODE, DEPT_TITLE, ��ձ޿�
         FROM (SELECT DEPT_CODE, DEPT_TITLE, AVG(SALARY) ��ձ޿�
         FROM EMPLOYEE
         JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
         GROUP BY DEPT_CODE, DEPT_TITLE
         ORDER BY AVG(SALARY) DESC)
         WHERE ROWNUM <= 3;
         
-- ���� �������� �޿��� ���� ���� �޴� ���� 5�� ��ȸ
-- RANK()�Լ��� ������ ���� ������ ����� ������ �ο�����ŭ �ǳʶٰ�
-- ���� ������ ����ϴ� ���
-- DENSE_RANK() : �ߺ��Ǵ� ���� ������ ����� ���� ����� ó��

SELECT EMP_NAME, SALARY, 
        DENSE_RANK() OVER(ORDER BY SALARY DESC) ����
        FROM EMPLOYEE;
        
SELECT EMP_NAME, SALARY,
        RANK() OVER(ORDER BY SALARY DESC) ����
        FROM EMPLOYEE;
        
        
SELECT *
FROM (SELECT EMP_NAME, SALARY, 
            RANK() OVER(ORDER BY SALARY DESC) ����
        FROM EMPLOYEE)
WHERE ���� <=5;


-- ���� ���̺��� ���ʽ� ������ ������ ���� 5����
-- ���, �̸�, �μ���, ���޸�, �Ի����� ��ȸ�ϼ���

SELECT *
FROM (SELECT EMP_ID ���, EMP_NAME �̸�, DEPT_TITLE �μ���, JOB_NAME ���޸�, HIRE_DATE �Ի���
, RANK() OVER(ORDER BY (SALARY * (1 + NVL(BONUS, 0))) DESC) AS ����
        FROM EMPLOYEE E
        JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
        JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
        )
WHERE ���� <= 5;
        
-- WITH �̸� AS (������)
-- ���������� �̸��� �ٿ��ְ� ���� �̸��� ����ϰ� ��
-- �ζ��κ�� ���� ���������� �ַ� �̿��
-- ���� ���������� ������ ���� ��� �ߺ� �ۼ��� ���� �� �ִ�.
-- ���� �ӵ��� �������ٴ� ������ �ִ�.

WITH TOPN_SAL AS (SELECT EMP_ID, EMP_NAME, SALARY
                    FROM EMPLOYEE
                    ORDER BY SALARY DESC)
                    SELECT ROWNUM, EMP_NAME, SALARY
                    FROM TOPN_SAL;
        
        
-- �μ��� �޿� �հ谡 ��ü �޿��� �� ���� 20%���� ����
-- �μ��� �μ���� �μ��� �޿� �հ� ��ȸ
SELECT DEPT_TITLE, SUM(SALARY)
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
GROUP BY DEPT_TITLE
HAVING SUM(SALARY) > (SELECT SUM(SALARY) * 0.2
                        FROM EMPLOYEE);
                        
-- �ζ�� ���
SELECT DEPT_TITLE, SUM(SALARY) SSAL
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
GROUP BY DEPT_TITLE;

SELECT DEPT_TITLE, SSAL
FROM (SELECT DEPT_TITLE, SUM(SALARY) SSAL
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
        GROUP BY DEPT_TITLE)
        WHERE SSAL > (SELECT SUM(SALARY) * 0.2
                        FROM EMPLOYEE);
                        
-- WITH ���
WITH TOTAL_SAL AS (SELECT DEPT_TITLE, SUM(SALARY) SSAL
                    FROM EMPLOYEE
                    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
                    GROUP BY DEPT_TITLE),
            TOTAL_SAL2 AS(SELECT SUM(SALARY) * 0.2
                        FROM EMPLOYEE)
                        
SELECT DEPT_TITLE, SSAL
FROM TOTAL_SAL
WHERE SSAL > (SELECT SUM(SALARY) * 0.2
                FROM EMPLOYEE;
                
                -- WITH�� �������� ���� �� ����
                WITH SUM_SAL AS (SELECT SUM(SALARY) FROM EMPLOYEE),
                    AVG_SAL AS (SELECT AVG(SALARY) FROM EMPLOYEE)
                    
                    SELECT *
                    FROM SUM_SAL
                    UNION
                    SELECT *
                    FROM AVG_SAL;
                    
-- ��[ȣ��]�� ��������
-- �Ϲ������δ� ���������� ���� ������� ���������� �� ����
-- ���������� ����ϴ� ���̺��� ���� ���������� �̿��ؼ� ����� ����
-- ���������� ���̺� ���� ����Ǹ�, ���������� ������� �ٲ�� ��

-- ������ ����� EMPLOYEE ���̺� �����ϴ� ������ ���� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID
FROM EMPLOYEE E
WHERE EXISTS (SELECT EMP_ID
                FROM EMPLOYEE M
                WHERE E.MANAGER_ID = M.EMP_ID);
                
                
-- ���� ������ �޿� ��պ��� �޿��� ���� �ް� �ִ� ������
-- ���, �����ڵ�, �޿��� ��ȸ�ϼ���
--WHERE������ ��Į�� �������� ���
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE E
WHERE SALARY > (SELECT TRUNC(AVG(SALARY), -5)
                FROM EMPLOYEE M
                WHERE E.JOB_CODE = M.JOB_CODE);
                
                
-- ��Į�� ��������
-- ������ �������� + �������
-- SELECT��, WHERE��, ORDER BY�� ��� ����

-- SELECT������ ��Į�� �������� �̿�
-- ��� ����� ���, �̸�, �����ڻ��, �����ڸ��� ��ȸ�ϼ���
SELECT EMP_ID, EMP_NAME, MANAGER_ID,
        NVL((SELECT EMP_NAME
            FROM EMPLOYEE M
            WHERE E.MANAGER_ID = M.EMP_ID), '����')
FROM EMPLOYEE E
ORDER BY 1;
                
-- ORDER BY������ ��Į�� �������� �̿�
-- ��� ������ ���, �̸�, �ҼӺμ� ��ȸ
-- ��, �μ��� �������� ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
ORDER BY(SELECT DEPT_TITLE FROM DEPARTMENT
                    WHERE DEPT_CODE = DEPT_ID) DESC NULLS LAST;
                