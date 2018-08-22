-- DAY8 ��������

-- DML(DATA MANUPULATION LANGUAGE)
-- INSERT, UPDATE DELETE, SELECT
-- : ������ ���� ���, ���̺� ���� �����ϰų�, �����ϰų�,
--  �����ϰų�, ��ȸ�ϴ� ���
--  INSERT : ���ο� ���� �߰��ϴ� �����̴�.
--              ���̺��� �� ������ �����Ѵ�.
-- INSERT INTO ���̺�� VALUES(������, ������, ....)
-- ���̺� ��� �÷��� ���� ���� INSERT�� �� ����Ѵ�.
-- ���̺��� �Ϻ� �÷��� ���� INSERT�� �ϱ� ���ؼ���
-- INSERT INTO ���̺��(�÷���, �÷���, ...)
-- VALUES (������, ������, ������, ...);
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE,
                        DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY,
                        BONUS, MANAGER_ID, HIRE_DATE, ENT_DATE,
                        ENT_YN)
                VALUES(900, '��ä��', '90112-1080503', 'jang_ch@kh.or.kr',
                            '01055569512', 'D1', 'J7', 'S3', 4300000, 0.2, '200',
                            SYSDATE, NULL, DEFAULT
                    );
 COMMIT;
 
 SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '��ä��';
 
 
 -- INSERT�ÿ� VALUES��� ���������� �̿��� �� �ִ�.
 CREATE TABLE EMP_01(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30),
    DEPT_TITLE VARCHAR2(20)
 );
 
SELECT * FROM EMP_01;
 
 INSERT INTO EMP_01 (
 
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
 
 );
 
SELECT * FROM EMP_01;

-- INSERT ALL : INSERT�ÿ� ����ϴ� ����������
--              �� �� �̻��� ���̺� INSERT ALL�� �̿��Ͽ�
--              �ѹ��� �����͸� ������ �� �ִ�.
--              ��, �� ���������� �������� ���ƾ� �Ѵ�.
CREATE TABLE EMP_DEPT_D1
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
    FROM EMPLOYEE
    WHERE 1 = 0;    -- �׻� FALSE�̹Ƿ� ���̺� ������ ����

SELECT * FROM EMP_DEPT_D1;

CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID, EMP_NAME, MANAGER_ID
    FROM EMPLOYEE
    WHERE 1 = 0;

SELECT * FROM EMP_MANAGER;

-- EMP_DEPT_D1���̺� EMPLOYEE���̺��� �ִ� �μ��ڵ尡 D1��
-- ������ ��ȸ�ؼ� ���, �̸�, �ҼӺμ�, �Ի����� �����ϰ�, 
-- EMP_MANAGER ���̺� EMPLOYEE���̺� �ִ� �μ��ڵ尡 D1��
--  ������ ��ȸ�ؼ� ���, �̸�, ������ ����� ��ȸ�ؼ� �����ϼ���.

INSERT INTO EMP_DEPT_D1(
     SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
     FROM EMPLOYEE
     WHERE DEPT_CODE = 'D1'
);

INSERT INTO EMP_MANAGER(
    SELECT EMP_ID, EMP_NAME, MANAGER_ID
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D1'
);

SELECT * FROM EMP_DEPT_D1;
SELECT * FROM EMP_MANAGER;

DELETE FROM EMP_DEPT_D1;
DELETE FROM EMP_MANAGER;

INSERT ALL
INTO EMP_DEPT_D1 VALUES(EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES(EMP_ID, EMP_NAME, MANAGER_ID)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

SELECT * FROM EMP_DEPT_D1;
SELECT * FROM EMP_MANAGER;



-- EMPLOYEE���̺��� �Ի��� �������� 2000�� 1�� 1�� ������ �Ի���
-- ����� ���, �̸�, �Ի���, �޿��� ��ȸ�Ͽ�
-- EMP_OLD ���̺� �����ϰ�
-- �� ���Ŀ� �Ի��� ����� EMP_NEW ���̺� �����ϼ���.

CREATE TABLE EMP_OLD
    AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMPLOYEE
    WHERE 1 = 0;

CREATE TABLE EMP_NEW
    AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMPLOYEE
    WHERE 1 = 0;


SELECT * FROM EMP_OLD;
SELECT * FROM EMP_NEW;

INSERT INTO EMP_OLD(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)(
    SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMPLOYEE
    WHERE TO_CHAR(HIRE_DATE, 'RRRR/MM/DD') < '2000/01/01'

);

INSERT INTO EMP_NEW(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)(
    SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMPLOYEE
    WHERE TO_CHAR(HIRE_DATE, 'RRRR/MM/DD') > '2000/01/01'

);

COMMIT;

-- UPDATE : ���̺� ��ϵ� �÷��� ���� �����ϴ� �����̴�.
--          ���̺��� ��ü �� ������ ��ȭ�� ����.
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT;

-- UPDATE ���̺�� SET �÷���  = �ٲܰ�, �÷��� = �ٲܰ�, ...
-- [WHERE �÷��� �񱳿����� �񱳰�];
UPDATE DEPT_COPY
SET DEPT_TITLE = '������ȹ��'
WHERE DEPT_ID = 'D9';

SELECT * FROM DEPT_COPY;

-- UPDATE�ÿ��� ���������� �̿��� �� �ִ�.
-- UPDATE ���̺��
-- SET �÷��� = (��������)
CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
    FROM EMPLOYEE;
    
SELECT * FROM EMP_SALARY
WHERE EMP_NAME IN ('�����', '����');

-- ���� ����� ����� �η����ϴ� ���� �����
-- �޿��� ���ʽ����� ����� ����� �����ϰ� ������ �ֱ�� �ߴ�.
-- �̸� �ݿ��ϴ� UPDATE���� �ۼ��غ�����

UPDATE EMP_SALARY
SET SALARY = (SELECT SALARY FROM EMP_SALARY WHERE EMP_NAME LIKE '�����'),
    BONUS = (SELECT BONUS FROM EMP_SALARY WHERE EMP_NAME LIKE '�����')
    WHERE EMP_NAME = '����';

SELECT * FROM EMP_SALARY
WHERE EMP_NAME IN ('�����', '����');

-- ������ ���߿� ���������� �̿��� UPDATE��
-- ���� ����� �޿� �λ� �ҽ��� ���ص��� �ٸ� �������
-- ��ü�� �ľ��� �����ߴ�
-- ���ö, ������, ������, �ϵ��� ����� �޿��� ���ʽ���
-- ����� ����� �޿��� ���ʽ��� ���� �����ϴ� UPDATE�� �ۼ�
UPDATE EMP_SALARY
SET (SALARY, BONUS) = (SELECT SALARY, BONUS
                        FROM EMPLOYEE
                        WHERE EMP_NAME = '�����')
WHERE EMP_NAME IN('���ö', '������', '������', '�ϵ���');
        
SELECT * FROM EMP_SALARY
WHERE EMP_NAME IN ('�����', '����', '���ö', '������', '������', '�ϵ���');


-- EMP_SALARY ���̺��� �ƽþ� �ٹ������� �ٹ��ϴ� ������
-- ���ʽ��� 0.5�� �����ϼ���
UPDATE EMP_SALARY
    SET BONUS = 0.5
    WHERE EMP_ID IN (SELECT EMP_ID
                        FROM EMP_SALARY S
                        JOIN DEPARTMENT D ON(S.DEPT_CODE = D.DEPT_ID)
                        JOIN LOCATION L ON(D.LOCATION_ID = L.LOCAL_CODE)
                        WHERE LOCAL_NAME LIKE 'ASIA%'
);

COMMIT;

-- UPDATE ������ ���� �ش� �÷��� ���� �������ǿ� ������� �ʾƾ� ��
UPDATE EMPLOYEE
SET DEPT_CODE = '65'    -- FOREIGN KEY �������� �����
WHERE DPET_CODE ='D6';

UPDATE EMPLOYEE
SET EMP_NAME = NULL -- NOT NULL ���� ���� �����
WHERE EMP_ID = 200;

UPDATE EMPLOYEE
SET EMP_NO = '621235-1985634' -- UNIQUE �������� �����
WHERE EMP_ID = 201;

UPDATE EMPLOYEE
SET ENT_YN = DEFAULT
WHERE EMP_ID = 222;

ROLLBACK;

-- DELETE : ���̺��� ���� �����ϴ� �����̴�.
--          ���̺��� ���� ������ �پ���.
-- DELETE FROM ���̺�� WHERE ���Ǽ���
-- ���� WHERE ������ �������� ������ ��� ���� �� �����ȴ�.
COMMIT;

DELETE FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;

ROLLBACK;

DELETE FROM EMPLOYEE
WHERE EMP_NAME = '��ä��';

SELECT * FROM EMPLOYEE;

ROLLBACK;

--FOREIGN KEY ���������� �����Ǿ� ���� ���
-- �����ǰ� �ִ� ���� ���ؼ��� ���� �� �� ����.
DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D1';

-- FOREIGN KEY ���������� �����Ǿ� �־ 
-- �����ǰ� ���� �ʴ� ���� ���ؼ��� ���� ����
DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D3';

ROLLBACK;

-- ���� �� FOREIGN KEY ������������ �÷� ������ �Ұ��� �� ���
-- ���� ������ ��Ȱ��ȭ �� �� �ִ�.
ALTER TABLE EMPLOYEE
DISABLE CONSTRAINT SYS_C007128 CASCADE;

DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D1';

SELECT * FROM DEPARTMENT;

SELECT * FROM EMPLOYEE;

ROLLBACK;

INSERT INTO DEPARTMENT
VALUES ('D1', '�λ������', 'L1');

-- ��ȭ��ȭ �� ���������� �ٽ� Ȱ��ȭ
ALTER TABLE EMPLOYEE
ENABLE CONSTRAINT SYS_C007128;

-- TRUNCATE : ���̺��� ��ü ���� ������ �� ����Ѵ�.
--              DELETE���� ���� �ӵ��� ������.
--              ROLLBACK�� ���� ������ �� ����.
SELECT * FROM EMP_SALARY;
COMMIT;

DELETE FROM EMP_SALARY;
SELECT * FROM EMP_SALARY;
ROLLBACK;
SELECT * FROM EMP_SALARY;

TRUNCATE TABLE EMP_SALARY;
SELECT * FROM EMP_SALARY;
ROLLBACK;
SELECT * FROM EMP_SALARY;

 
 
-- MERGE : ������ ���� �� ���� ���̺��� �ϳ��� ��ġ�� ����� �Ѵ�.
--          ���̺��� �����ϴ� ������ ���� �����ϸ� UPDATE
--          ������ ���� ������ INSERT��
CREATE TABLE EMP_M01
AS SELECT * FROM EMPLOYEE;

CREATE TABLE EMP_M02
AS SELECT * FROM EMPLOYEE
    WHERE JOB_CODE = 'J4';
    
INSERT INTO EMP_M02
VALUES(999, '���ο�', '561016-1234567', 'kwack_dw@kh.or.kr',
        '01011112222', 'D9', 'J4', 'S1', 9000000, 0.5, NULL,
        SYSDATE, NULL, DEFAULT);
        
SELECT * FROM EMP_M02;

UPDATE EMP_M02 SET SALARY = 0;
 
MERGE INTO EMP_M01 USING EMP_M02 ON (EMP_M01.EMP_ID = EMP_M02.EMP_ID)
WHEN MATCHED THEN 
UPDATE SET
EMP_M01.EMP_NAME = EMP_M02.EMP_NAME,
EMP_M01.EMP_NO = EMP_M02.EMP_NO,
EMP_M01.EMAIL = EMP_M02.EMAIL,
EMP_M01.PHONE = EMP_M02.PHONE,
EMP_M01.DEPT_CODE = EMP_M02.DEPT_CODE,
EMP_M01.JOB_CODE = EMP_M02.JOB_CODE,
EMP_M01.SAL_LEVEL = EMP_M02.SAL_LEVEL,
EMP_M01.SALARY = EMP_M02.SALARY,
EMP_M01.BONUS = EMP_M02.BONUS,
EMP_M01.MANAGER_ID =EMP_M02.MANAGER_ID,
EMP_M01.HIRE_DATE = EMP_M02.HIRE_DATE,
EMP_M01.ENT_DATE = EMP_M02.ENT_DATE,
EMP_M01.ENT_YN = EMP_M02.ENT_YN
WHEN NOT MATCHED THEN
INSERT VALUES (EMP_M02.EMP_ID, EMP_M02.EMP_NAME, EMP_M02.EMP_NO, EMP_M02.EMAIL,
                EMP_M02.PHONE, EMP_M02.DEPT_CODE, EMP_M02.JOB_CODE, EMP_M02.SAL_LEVEL,
                EMP_M02.SALARY, EMP_M02.BONUS, EMP_M02.MANAGER_ID, EMP_M02.HIRE_DATE,
                EMP_M02.ENT_DATE, EMP_M02.ENT_YN);
SELECT * FROM EMP_M01;




-- TCL (TRANSACTION CONTROLL LANGUAGE)
-- Ʈ������ ���� ���
-- COMMIT�� ROLLBACK�� �ִ�.

-- Ʈ������̶�?
-- �Ѳ����� ����Ǿ��� �� �ּ��� �۾� ������ ���Ѵ�.
-- ���� �۾� ����(LOGICAL UNIT OF WORK : LUW)
-- �ϳ��� Ʈ���������� �̷���� �۾��� �ݵ�� �Ѳ����� �Ϸ�(COMMIT)
-- �Ǿ�� �ϸ�, �׷��� ���� ��쿡�� �Ѳ����� ���(ROLLBACK)�Ǿ�� ��

-- EX) ATM��� ������ ��
-- 1. ī�� ����
-- 2. �޴� ����(����)
-- 3. �ݾ� Ȯ��, ��й�ȣ ����
-- 4. �ݾ� �Է�
-- 5. ���ⱸ���� ���� ����
-- 6. ī�� �ޱ�
-- 7. ��ǥ �ޱ�

-- COMMIT : Ʈ������ �۾��� ���� �Ϸ�Ǹ� ���� ������ ������ ����
-- ROLLBACK : Ʈ������ �۾��� ����ϰ� �ֱ� COMMIT�� �������� �̵�
-- SAVEPOINT ���̺�����Ʈ�� : ���� Ʈ������ �۾� ������ �̸��� ������
--                          �ϳ��� Ʈ������ �ȿ� ������ ����
-- ROLLBACK TO ���̺�����Ʈ�� : Ʈ������ �۾��� ����ϰ�
--                              SAVEPOINT �������� �̵�

CREATE TABLE USER_TBL(
    USERNO NUMBER UNIQUE,
    ID VARCHAR2 (20) PRIMARY KEY,
    PASSWORD CHAR(20) NOT NULL
);

INSERT INTO USER_TBL VALUES(1, 'test1', 'pass1');
INSERT INTO USER_TBL VALUES(2, 'test2', 'pass2');
INSERT INTO USER_TBL VALUES(3, 'test3', 'pass3');

COMMIT;

SELECT * FROM USER_TBL;

INSERT INTO USER_TBL VALUES(4, 'test4', 'pass4');

SELECT * FROM USER_TBL;
ROLLBACK;
SELECT * FROM USER_TBL;

INSERT INTO USER_TBL VALUES(4, 'test4', 'pass4');
SAVEPOINT SP1;
INSERT INTO USER_TBL VALUES(5, 'test5', 'pass5');

SELECT * FROM USER_TBL;

ROLLBACK TO SP1;

SELECT * FROM USER_TBL;
 
 ROLLBACK;
 
 SELECT * FROM USER_TBL;
 
 