-- DAY10 ��������
-- VIEW �ɼ�
-- OR REPLACE : �⺻�� ������ �� �̸��� �����ϴ� ��� �����
--              �������� ������ ���� �����ϴ� �ɼ�
-- FORCE �ɼ� : ���������� ���� ���̺��� �������� �ʾƵ� �� ����
CREATE OR REPLACE FORCE VIEW V_EMP
AS SELECT TCODE,TNAME, TCONTENTS
   FROM TT;

SELECT * FROM EMPLOYEE;

-- NOFORCE �ɼ� : ���������� ���̺��� �����ؾ߸� �� ������(�⺻��)
CREATE OR REPLACE /*NOFORCE*/ VIEW V_EMP2
AS SELECT TCODE, TNAME, TCONTENTS
   FROM TT;

-- WITH CHECK�ɼ� : �÷��� ���� �������� ���ϰ� �Ѵ�.
CREATE OR REPLACE VIEW V_EMP3
AS SELECT * FROM EMPLOYEE
WITH CHECK OPTION;

INSERT INTO V_EMP3
VALUES(666, '������', '666666-6666666', 'oh_hj@kh.or.kr',
       '01012344321', 'D1', 'J7', 'S1', 8000000, 0.1, 201,
       SYSDATE, NULL, DEFAULT);

-- DELETE�� ������
--DELETE FROM V_EMP3;
ROLLBACK;

-- WITH READ ONLY : DML ������ �Ұ���
CREATE OR REPLACE VIEW V_DEPT
AS SELECT * FROM DEPARTMENT
WITH READ ONLY;

DELETE FROM V_DEPT;

SELECT * FROM V_DEPT;

-- ������(SEQUENCE)
-- �ڵ� ��ȣ �߻��� ������ �ϴ� ��ü
-- ���������� �������� �ڵ����� ��������
/*
  CRAETE SEQUENCE �������̸�
  [INCREMENT BY ����] -- ���� ���� ���� ����ġ, �����ϸ� �ڵ� 1 �⺻
  [START WITH ����] -- ó�� �߻���ų �� ����, �����ϸ� �ڵ� 1 �⺻
  [MAXVALUE ���� | NOMAXVALUE] -- �߻���ų �ִ밪 ����(10�� 27��)
  [MINVALUE ���� | NOMINVALUE] -- �ּҰ� ���� (-10�� 26��)
  [CYCLE | NOCYCLE]  -- ����ȯ ����
  [CACHE ����Ʈũ�� | NOCACHE] -- ĳ���޸� �⺻���� 20����Ʈ, �ּҴ� 2����Ʈ
*/

CREATE SEQUENCE SEQ_EMPID
START WITH 300
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;

-- NEXTVAL 1ȸ ���� �� ���� ����
SELECT SEQ_EMPID.CURRVAL FROM DUAL; 

SELECT SEQ_EMPID.NEXTVAL FROM DUAL;
SELECT SEQ_EMPID.NEXTVAL FROM DUAL;
SELECT SEQ_EMPID.NEXTVAL FROM DUAL;
SELECT SEQ_EMPID.NEXTVAL FROM DUAL; -- MAXVALUE�Ѿ�� ����

SELECT * FROM USER_SEQUENCES;

-- ������ ����
ALTER SEQUENCE SEQ_EMPID
INCREMENT BY 10
MAXVALUE 400
NOCYCLE
NOCACHE;

-- START WITH���� ������ �Ұ�����
-- START WITH���� ����ÿ��� DROP���� ������ �ٽ� �����ؾ� ��

-- SELECT������ ��� ����
-- INSERT������ SELECT ���� ��� ����
-- INSERT������ VALUES ������ ��� ����
-- UPDATE������ SET������ ��� ����

-- ��, ���������� SELECT������ ��� �Ұ�
-- VIEW�� SELECT������ ��� �Ұ�
-- DISTINCT Ű���尡 �ִ� SELECT������ ��� �Ұ�
-- GROUP BY , HAVING���� �ִ� SELECT������ ��� �Ұ�
-- ORDER BY ������ ��� �Ұ�
-- CREATE TABLE, ALTER TABLE�� DEFAULT������ ��� �Ұ�

CREATE SEQUENCE SEQ_EID
START WITH 300
INCREMENT BY 1
MAXVALUE 10000
NOCYCLE
NOCACHE;

INSERT INTO EMPLOYEE
VALUES(SEQ_EID.NEXTVAL, 'ȫ�浿', '666666-6666666',
      'hong_gd@kh.or.kr', '01012344444', 'D2', 'J7',
      'S1', 5000000, 0.1, 200, SYSDATE, NULL, DEFAULT);

SELECT * FROM EMPLOYEE;

ROLLBACK;

CREATE SEQUENCE SEQ_EID2;

-- �ε���(INDEX)
-- : SQL��ɹ��� ó�� �ӵ��� ����Ű�� ���ؼ� 
--  �÷��� ���ؼ� �����ϴ� ����Ŭ ��ü�̴�.
--  �ε����� ���� ������ ����Ʈ�� �������� �����Ǿ� ����
--  �ε����� �����ϱ� ���� �ð��� �ʿ��ϰ�, �ε����� ���� �߰�
--  ��������� �ʿ��ϱ� ������ �ݵ�� ���� ���� �ƴϴ�.
--  => DML�۾��� ����� ��� ó���ӵ��� ��������.

-- ����
-- �˻� �ӵ��� ������
-- �ý��ۿ� �ɸ��� ���ϸ� �ٿ��� �ý��� ��ü�� ������ ����Ŵ

-- ����
-- �ε����� ���� �߰� ��������� �ʿ���
-- �ε����� �����ϴµ� �ð��� �ɸ�
-- �������� �����۾�(INSERT/UPDATE/DELETE)�� ���� �Ͼ�� ���
-- ������ ������ ���ϵ�

-- �ε����� �����ϴ� ������ ��ųʸ�
SELECT * FROM USER_IND_COLUMNS;

-- ���� ã�ư��� ���� ���� �÷��� �����Ѵ�.
SELECT ROWID, EMP_ID, EMP_NAME
FROM EMPLOYEE;

-- �ε��� ����
-- 1. �����ε���(UNIQUE INDEX)
-- 2. ������ε���(NONUNIQUE INDEX)
-- 3. �����ε���(SINGLE INDEX)
-- 4. �����ε���(COMPOSITE INDEX)
-- 5. �Լ� ��� �ε���(FUNCTION BASED INDEX)

-- UNIQUE INDEX
-- UNIQUE INDEX�� ������ �÷����� �ߺ����� ���Ե� �� ����
-- ����Ŭ PRIMARY KEY ���������� �����ϸ�
-- �ڵ����� �ش� �÷��� UNIQUE INDEX�� ������
-- PRIMARY KEY�� �̿��Ͽ� ACCESS ��쿡 ���� ��� ȿ���� ����

-- TABLE FULL SCAN
SELECT * FROM EMPLOYEE;

-- UNIQUE INDEX Ȱ��
SELECT * FROM EMPLOYEE
WHERE EMP_ID > '0';

CREATE UNIQUE INDEX IDX_EMPNO
ON EMPLOYEE(EMP_NO);

SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE';

-- �ߺ����� �ִ� �÷��� UNIQUE �ε��� �������� ����
CREATE UNIQUE INDEX IDX_DEPTCODE
ON EMPLOYEE(DEPT_CODE);

-- NONUNIQUE INDEX
-- WHERE������ ����ϰ� ���Ǵ� �Ϲ� �÷��� ������� ����
-- �ַ� ���� ����� ���� �������� ������
CREATE INDEX IDX_DEPTCODE
ON EMPLOYEE(DEPT_CODE);

SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE';

-- �����ε���(COMPOSITE INDEX)
CREATE INDEX IDX_DEPT
ON DEPARTMENT(DEPT_ID, DEPT_TITLE);

SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'DEPARTMENT';

SELECT * FROM DEPARTMENT;

SELECT * FROM DEPARTMENT
WHERE DEPT_TITLE > '0';

SELECT * FROM DEPARTMENT
WHERE DEPT_TITLE > '0'
AND DEPT_ID > '0';

-- EMPLOYEE ���̺��� EMP_NAME �÷��� ���ؼ� IDX_ENM�̶��
-- �̸��� UNIQUE INDEX ����
CREATE UNIQUE INDEX IDX_ENM
ON EMPLOYEE(EMP_NAME);

-- �� ���� ������ EMPLOYEE�� �߰�
-- ���� �߻�
-- UNIQUE INDEX ������ ��� �ߺ��� ���� ������ �� ����.
INSERT INTO EMPLOYEE
VALUES(888, '���ö', '888888-8888888', 'aaa@kh.or.kr',
       '01044444444', 'D1', 'J7', 'S1', 9000000,
       0.1, NULL, SYSDATE, NULL, DEFAULT);
       
-- EMPLOYEE���̺��� �����ؼ� EMP01, EMP02���̺� ����]
-- EMP01���̺��� EMP_ID�÷��� ���ؼ� UNIQUE INDEX ���� : IDX_EID
-- EMP01, EMP02 ���̺��� EMP_ID�� 201���� ���� ��ȸ
CREATE TABLE EMP01
AS SELECT * FROM EMPLOYEE;

CREATE TABLE EMP02
AS SELECT * FROM EMPLOYEE;

CREATE UNIQUE INDEX IDX_EID
ON EMP01(EMP_ID);

SELECT * FROM EMP01
WHERE EMP_ID = '201';

SELECT * FROM EMP02
WHERE EMP_ID = '201';

-- �Լ� ��� �ε���
-- SELECT���̳� WHERE������ ��������̳� �Լ��� ���� ���
-- ��꿡 ���Ե� �÷��� �ε����� ������ ���� �ʴ´�.
-- �������� �˻��ϴ� ��찡 ���ٸ�, �����̳� �Լ�����
-- �ε����� ���� ���� �ִ�.
CREATE INDEX IDX_EMP02_SALCALC
ON EMP02 ((SALARY + (SALARY * NVL(BONUS,0))) * 12);

-- �ε��� ����
DROP INDEX IDX_EMP02_SALCALC;

SELECT EMP_ID, EMP_NAME,
       ((SALARY + (SALARY * NVL(BONUS,0))) * 12) ����
FROM EMPLOYEE
WHERE ((SALARY + (SALARY * NVL(BONUS,0))) * 12) > 10000000;


-- ���Ǿ�(SYNONYM)
-- �ٸ� �����ͺ��̽��� ���� ��ü�� ���� ���� Ȥ�� ���Ӹ�
-- ���� ����ڰ� ���̺��� ������ ���
-- �ٸ� ����ڰ� ���̺� ������ ��� '����ڸ�.���̺��'���� ǥ����
-- ���Ǿ ����ϸ� �����ϰ� ����� �� �ִ�.

-- �������
--CREATE SYNONYM ���Ӹ� FOR ����ڸ�.��ü��;

CREATE SYNONYM EMP FOR EMPLOYEE;

SELECT * FROM EMP;

-- ���Ǿ��� ����
-- 1. ����� ���Ǿ�
-- ��ü�� ���� ���� ������ �ο����� ����ڰ� ������ ���Ǿ�
-- 2. �������Ǿ�
-- ��� ������ �ִ� �����(DBA) ������ ���Ǿ�
-- ��� ����ڰ� ����� �� ����(PUBLIC)
-- ��) DUAL









