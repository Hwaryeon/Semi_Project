-- DAY10 수업내용
-- VIEW 옵션
-- OR REPLACE : 기본에 동일한 뷰 이름이 존재하는 경우 덮어쓰고
--              존재하지 않으면 새로 생성하는 옵션
-- FORCE 옵션 : 서브쿼리에 사용된 테이블이 존재하지 않아도 뷰 생성
CREATE OR REPLACE FORCE VIEW V_EMP
AS SELECT TCODE,TNAME, TCONTENTS
   FROM TT;

SELECT * FROM EMPLOYEE;

-- NOFORCE 옵션 : 서브쿼리에 테이블이 존재해야만 뷰 생성함(기본값)
CREATE OR REPLACE /*NOFORCE*/ VIEW V_EMP2
AS SELECT TCODE, TNAME, TCONTENTS
   FROM TT;

-- WITH CHECK옵션 : 컬럼의 값을 수정하지 못하게 한다.
CREATE OR REPLACE VIEW V_EMP3
AS SELECT * FROM EMPLOYEE
WITH CHECK OPTION;

INSERT INTO V_EMP3
VALUES(666, '오현정', '666666-6666666', 'oh_hj@kh.or.kr',
       '01012344321', 'D1', 'J7', 'S1', 8000000, 0.1, 201,
       SYSDATE, NULL, DEFAULT);

-- DELETE는 가능함
--DELETE FROM V_EMP3;
ROLLBACK;

-- WITH READ ONLY : DML 수행이 불가능
CREATE OR REPLACE VIEW V_DEPT
AS SELECT * FROM DEPARTMENT
WITH READ ONLY;

DELETE FROM V_DEPT;

SELECT * FROM V_DEPT;

-- 시퀀스(SEQUENCE)
-- 자동 번호 발생기 역할을 하는 객체
-- 순차적으로 정수값을 자동으로 생성해줌
/*
  CRAETE SEQUENCE 시퀀스이름
  [INCREMENT BY 숫자] -- 다음 값에 대한 증가치, 생략하면 자동 1 기본
  [START WITH 숫자] -- 처음 발생시킬 값 지정, 생략하면 자동 1 기본
  [MAXVALUE 숫자 | NOMAXVALUE] -- 발생시킬 최대값 지정(10의 27승)
  [MINVALUE 숫자 | NOMINVALUE] -- 최소값 지정 (-10의 26승)
  [CYCLE | NOCYCLE]  -- 값순환 여부
  [CACHE 바이트크기 | NOCACHE] -- 캐쉬메모리 기본값은 20바이트, 최소는 2바이트
*/

CREATE SEQUENCE SEQ_EMPID
START WITH 300
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;

-- NEXTVAL 1회 수행 후 실행 가능
SELECT SEQ_EMPID.CURRVAL FROM DUAL; 

SELECT SEQ_EMPID.NEXTVAL FROM DUAL;
SELECT SEQ_EMPID.NEXTVAL FROM DUAL;
SELECT SEQ_EMPID.NEXTVAL FROM DUAL;
SELECT SEQ_EMPID.NEXTVAL FROM DUAL; -- MAXVALUE넘어서면 에러

SELECT * FROM USER_SEQUENCES;

-- 시퀀스 변경
ALTER SEQUENCE SEQ_EMPID
INCREMENT BY 10
MAXVALUE 400
NOCYCLE
NOCACHE;

-- START WITH값은 변경이 불가능함
-- START WITH값을 변경시에은 DROP으로 삭제후 다시 생성해야 함

-- SELECT문에서 사용 가능
-- INSERT문에서 SELECT 구문 사용 가능
-- INSERT문에서 VALUES 절에서 사용 가능
-- UPDATE문에서 SET절에서 사용 가능

-- 단, 서브쿼리의 SELECT문에서 사용 불가
-- VIEW의 SELECT절에서 사용 불가
-- DISTINCT 키워드가 있는 SELECT문에서 사용 불가
-- GROUP BY , HAVING절이 있는 SELECT문에서 사용 불가
-- ORDER BY 절에서 사용 불가
-- CREATE TABLE, ALTER TABLE의 DEFAULT값으로 사용 불가

CREATE SEQUENCE SEQ_EID
START WITH 300
INCREMENT BY 1
MAXVALUE 10000
NOCYCLE
NOCACHE;

INSERT INTO EMPLOYEE
VALUES(SEQ_EID.NEXTVAL, '홍길동', '666666-6666666',
      'hong_gd@kh.or.kr', '01012344444', 'D2', 'J7',
      'S1', 5000000, 0.1, 200, SYSDATE, NULL, DEFAULT);

SELECT * FROM EMPLOYEE;

ROLLBACK;

CREATE SEQUENCE SEQ_EID2;

-- 인덱스(INDEX)
-- : SQL명령문의 처리 속도를 향상시키기 위해서 
--  컬럼에 대해서 생성하는 오라클 객체이다.
--  인덱스의 내부 구조는 이진트리 형식으로 구성되어 있음
--  인덱스를 생성하기 위한 시간이 필요하고, 인덱스를 위한 추가
--  저장공간이 필요하기 때문에 반드시 좋은 것은 아니다.
--  => DML작업이 빈번한 경우 처리속도가 느려진다.

-- 장점
-- 검색 속도가 빨라짐
-- 시스템에 걸리는 부하를 줄여서 시스템 전체의 성능을 향상시킴

-- 단점
-- 인덱스를 위한 추가 저장공간이 필요함
-- 인덱스를 생성하는데 시간이 걸림
-- 데이터의 변경작업(INSERT/UPDATE/DELETE)이 자주 일어나는 경우
-- 오히려 성능이 저하됨

-- 인덱스를 관리하는 데이터 딕셔너리
SELECT * FROM USER_IND_COLUMNS;

-- 행을 찾아가기 위한 가상 컬럼이 존재한다.
SELECT ROWID, EMP_ID, EMP_NAME
FROM EMPLOYEE;

-- 인덱스 종류
-- 1. 고유인덱스(UNIQUE INDEX)
-- 2. 비고유인덱스(NONUNIQUE INDEX)
-- 3. 단일인덱스(SINGLE INDEX)
-- 4. 결합인덱스(COMPOSITE INDEX)
-- 5. 함수 기반 인덱스(FUNCTION BASED INDEX)

-- UNIQUE INDEX
-- UNIQUE INDEX로 생성된 컬럼에는 중복값이 포함될 수 없음
-- 오라클 PRIMARY KEY 제약조건을 생성하면
-- 자동으로 해당 컬럼에 UNIQUE INDEX가 생성됨
-- PRIMARY KEY를 이용하여 ACCESS 경우에 성능 향상에 효과가 있음

-- TABLE FULL SCAN
SELECT * FROM EMPLOYEE;

-- UNIQUE INDEX 활용
SELECT * FROM EMPLOYEE
WHERE EMP_ID > '0';

CREATE UNIQUE INDEX IDX_EMPNO
ON EMPLOYEE(EMP_NO);

SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE';

-- 중복값이 있는 컬럼은 UNIQUE 인덱스 생성하지 못함
CREATE UNIQUE INDEX IDX_DEPTCODE
ON EMPLOYEE(DEPT_CODE);

-- NONUNIQUE INDEX
-- WHERE절에서 빈번하게 사용되는 일반 컬럼을 대상으로 생성
-- 주로 성능 향상을 위한 목적으로 생성함
CREATE INDEX IDX_DEPTCODE
ON EMPLOYEE(DEPT_CODE);

SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE';

-- 결합인덱스(COMPOSITE INDEX)
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

-- EMPLOYEE 테이블의 EMP_NAME 컬럼에 대해서 IDX_ENM이라는
-- 이름의 UNIQUE INDEX 생성
CREATE UNIQUE INDEX IDX_ENM
ON EMPLOYEE(EMP_NAME);

-- 새 직원 정보를 EMPLOYEE에 추가
-- 에러 발생
-- UNIQUE INDEX 지정한 경우 중복된 값을 저장할 수 없다.
INSERT INTO EMPLOYEE
VALUES(888, '노옹철', '888888-8888888', 'aaa@kh.or.kr',
       '01044444444', 'D1', 'J7', 'S1', 9000000,
       0.1, NULL, SYSDATE, NULL, DEFAULT);
       
-- EMPLOYEE테이블을 복사해서 EMP01, EMP02테이블 생성]
-- EMP01테이블의 EMP_ID컬럼에 대해서 UNIQUE INDEX 생성 : IDX_EID
-- EMP01, EMP02 테이블에서 EMP_ID가 201번인 직원 조회
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

-- 함수 기반 인덱스
-- SELECT절이나 WHERE절에서 산술계산식이나 함수가 사용된 경우
-- 계산에 포함된 컬럼은 인덱스의 적용을 받지 않는다.
-- 계산식으로 검색하는 경우가 많다면, 수식이나 함수식을
-- 인덱스로 만들 수도 있다.
CREATE INDEX IDX_EMP02_SALCALC
ON EMP02 ((SALARY + (SALARY * NVL(BONUS,0))) * 12);

-- 인덱스 삭제
DROP INDEX IDX_EMP02_SALCALC;

SELECT EMP_ID, EMP_NAME,
       ((SALARY + (SALARY * NVL(BONUS,0))) * 12) 연봉
FROM EMPLOYEE
WHERE ((SALARY + (SALARY * NVL(BONUS,0))) * 12) > 10000000;


-- 동의어(SYNONYM)
-- 다른 데이터베이스가 가진 객체에 대한 별명 혹은 줄임말
-- 여러 사용자가 테이블을 공유할 경우
-- 다른 사용자가 테이블에 접근할 경우 '사용자명.테이블명'으로 표현함
-- 동의어를 사용하면 간단하게 사용할 수 있다.

-- 생성방법
--CREATE SYNONYM 줄임말 FOR 사용자명.객체명;

CREATE SYNONYM EMP FOR EMPLOYEE;

SELECT * FROM EMP;

-- 동의어의 구분
-- 1. 비공개 동의어
-- 객체에 대한 접근 권한을 부여받은 사용자가 정의한 동의어
-- 2. 공개동의어
-- 모든 권한을 주는 사용자(DBA) 정의한 동의어
-- 모든 사용자가 사용할 수 있음(PUBLIC)
-- 예) DUAL









