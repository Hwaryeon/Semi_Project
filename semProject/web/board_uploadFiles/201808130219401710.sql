-- DAY8 수업내용

-- DML(DATA MANUPULATION LANGUAGE)
-- INSERT, UPDATE DELETE, SELECT
-- : 데이터 조작 언어, 테이블에 값을 삽입하거나, 수정하거나,
--  삭제하거나, 조회하는 언어
--  INSERT : 새로운 행을 추가하는 구문이다.
--              테이블의 행 갯수가 증가한다.
-- INSERT INTO 테이블명 VALUES(데이터, 데이터, ....)
-- 테이블에 모든 컬럼에 대해 값을 INSERT할 때 사용한다.
-- 테이블의 일부 컬럼에 대해 INSERT를 하기 위해서는
-- INSERT INTO 테이블명(컬럼명, 컬럼명, ...)
-- VALUES (데이터, 데이터, 데이터, ...);
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE,
                        DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY,
                        BONUS, MANAGER_ID, HIRE_DATE, ENT_DATE,
                        ENT_YN)
                VALUES(900, '장채현', '90112-1080503', 'jang_ch@kh.or.kr',
                            '01055569512', 'D1', 'J7', 'S3', 4300000, 0.2, '200',
                            SYSDATE, NULL, DEFAULT
                    );
 COMMIT;
 
 SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '장채현';
 
 
 -- INSERT시에 VALUES대신 서브쿼리를 이용할 수 있다.
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

-- INSERT ALL : INSERT시에 사용하는 서브쿼리가
--              두 개 이상의 테이블에 INSERT ALL을 이용하여
--              한번에 데이터를 삽입할 수 있다.
--              단, 각 서브쿼리의 조건절이 같아야 한다.
CREATE TABLE EMP_DEPT_D1
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
    FROM EMPLOYEE
    WHERE 1 = 0;    -- 항상 FALSE이므로 테이블 구조만 복사

SELECT * FROM EMP_DEPT_D1;

CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID, EMP_NAME, MANAGER_ID
    FROM EMPLOYEE
    WHERE 1 = 0;

SELECT * FROM EMP_MANAGER;

-- EMP_DEPT_D1테이블에 EMPLOYEE테이블에서 있는 부서코드가 D1인
-- 직원을 조회해서 사번, 이름, 소속부서, 입사일을 삽입하고, 
-- EMP_MANAGER 테이블에 EMPLOYEE테이블에 있는 부서코드가 D1인
--  직원을 조회해서 사번, 이름, 관리자 사번을 조회해서 삽입하세요.

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



-- EMPLOYEE테이블에서 입사일 기준으로 2000년 1월 1일 이전에 입사한
-- 사원의 사번, 이름, 입사일, 급여를 조회하여
-- EMP_OLD 테이블에 삽입하고
-- 그 이후에 입사한 사원은 EMP_NEW 테이블에 삽입하세요.

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

-- UPDATE : 테이블에 기록된 컬럼의 값을 수정하는 구문이다.
--          테이블의 전체 행 갯수는 변화가 없다.
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT;

-- UPDATE 테이블명 SET 컬럼명  = 바꿀값, 컬러명 = 바꿀값, ...
-- [WHERE 컬러명 비교연산자 비교값];
UPDATE DEPT_COPY
SET DEPT_TITLE = '전략기획팀'
WHERE DEPT_ID = 'D9';

SELECT * FROM DEPT_COPY;

-- UPDATE시에도 서브쿼리를 이용할 수 있다.
-- UPDATE 테이블명
-- SET 컬럼명 = (서브쿼리)
CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
    FROM EMPLOYEE;
    
SELECT * FROM EMP_SALARY
WHERE EMP_NAME IN ('유재식', '방명수');

-- 평상시 유재식 사원을 부러워하던 방명수 사원의
-- 급여와 보너스율을 유재식 사원과 동일하게 변경해 주기로 했다.
-- 이를 반영하는 UPDATE문을 작성해보세요

UPDATE EMP_SALARY
SET SALARY = (SELECT SALARY FROM EMP_SALARY WHERE EMP_NAME LIKE '유재식'),
    BONUS = (SELECT BONUS FROM EMP_SALARY WHERE EMP_NAME LIKE '유재식')
    WHERE EMP_NAME = '방명수';

SELECT * FROM EMP_SALARY
WHERE EMP_NAME IN ('유재식', '방명수');

-- 다중행 다중열 서브쿼리를 이용한 UPDATE문
-- 방명수 사원의 급여 인상 소식을 전해들은 다른 멤버들이
-- 단체로 파업을 진행했다
-- 노옹철, 전형돈, 정중하, 하동운 사원의 급여와 보너스를
-- 유재식 사원의 급여와 보너스와 같게 변경하는 UPDATE문 작성
UPDATE EMP_SALARY
SET (SALARY, BONUS) = (SELECT SALARY, BONUS
                        FROM EMPLOYEE
                        WHERE EMP_NAME = '유재식')
WHERE EMP_NAME IN('노옹철', '전형돈', '정중하', '하동운');
        
SELECT * FROM EMP_SALARY
WHERE EMP_NAME IN ('유재식', '방명수', '노옹철', '전형돈', '정중하', '하동운');


-- EMP_SALARY 테이블에서 아시아 근무지역에 근무하는 직원의
-- 보너스를 0.5로 변경하세요
UPDATE EMP_SALARY
    SET BONUS = 0.5
    WHERE EMP_ID IN (SELECT EMP_ID
                        FROM EMP_SALARY S
                        JOIN DEPARTMENT D ON(S.DEPT_CODE = D.DEPT_ID)
                        JOIN LOCATION L ON(D.LOCATION_ID = L.LOCAL_CODE)
                        WHERE LOCAL_NAME LIKE 'ASIA%'
);

COMMIT;

-- UPDATE 변경할 값은 해당 컬럼에 대한 제약조건에 위배되지 않아야 함
UPDATE EMPLOYEE
SET DEPT_CODE = '65'    -- FOREIGN KEY 제약조건 위배됨
WHERE DPET_CODE ='D6';

UPDATE EMPLOYEE
SET EMP_NAME = NULL -- NOT NULL 제약 조건 위배됨
WHERE EMP_ID = 200;

UPDATE EMPLOYEE
SET EMP_NO = '621235-1985634' -- UNIQUE 제약조건 위배됨
WHERE EMP_ID = 201;

UPDATE EMPLOYEE
SET ENT_YN = DEFAULT
WHERE EMP_ID = 222;

ROLLBACK;

-- DELETE : 테이블의 행을 삭제하는 구문이다.
--          테이블의 행의 갯수가 줄어든다.
-- DELETE FROM 테이블명 WHERE 조건설정
-- 만약 WHERE 조건을 설정하지 않으면 모든 행이 다 삭제된다.
COMMIT;

DELETE FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;

ROLLBACK;

DELETE FROM EMPLOYEE
WHERE EMP_NAME = '장채현';

SELECT * FROM EMPLOYEE;

ROLLBACK;

--FOREIGN KEY 제약조건이 설정되어 있을 경우
-- 참조되고 있는 값에 대해서는 삭제 할 수 없다.
DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D1';

-- FOREIGN KEY 제약조건이 설정되어 있어도 
-- 참조되고 있지 않는 값에 대해서는 삭제 가능
DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D3';

ROLLBACK;

-- 삭제 시 FOREIGN KEY 제약조건으로 컬럼 삭제가 불가능 한 경우
-- 제약 조건을 비활성화 할 수 있다.
ALTER TABLE EMPLOYEE
DISABLE CONSTRAINT SYS_C007128 CASCADE;

DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D1';

SELECT * FROM DEPARTMENT;

SELECT * FROM EMPLOYEE;

ROLLBACK;

INSERT INTO DEPARTMENT
VALUES ('D1', '인사관리부', 'L1');

-- 비화렁화 된 제약조건을 다시 활성화
ALTER TABLE EMPLOYEE
ENABLE CONSTRAINT SYS_C007128;

-- TRUNCATE : 테이블의 전체 행을 삭제할 시 사용한다.
--              DELETE보다 수행 속도가 빠르다.
--              ROLLBACK을 통해 복구할 수 없다.
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

 
 
-- MERGE : 구조가 같은 두 개의 테이블을 하나로 합치는 기능을 한다.
--          테이블에서 지정하는 조건의 값이 존재하면 UPDATE
--          조건의 값이 없으면 INSERT됨
CREATE TABLE EMP_M01
AS SELECT * FROM EMPLOYEE;

CREATE TABLE EMP_M02
AS SELECT * FROM EMPLOYEE
    WHERE JOB_CODE = 'J4';
    
INSERT INTO EMP_M02
VALUES(999, '곽두원', '561016-1234567', 'kwack_dw@kh.or.kr',
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
-- 트랜젝션 제어 언어
-- COMMIT과 ROLLBACK이 있다.

-- 트랜잭션이란?
-- 한꺼번에 수행되어햐 할 최소의 작업 단위를 말한다.
-- 논리적 작업 단위(LOGICAL UNIT OF WORK : LUW)
-- 하나의 트랜젝션으로 이루어진 작업은 반드시 한꺼번에 완료(COMMIT)
-- 되어야 하며, 그렇지 않은 경우에는 한꺼번에 취소(ROLLBACK)되어야 함

-- EX) ATM기기 인출을 함
-- 1. 카드 삽입
-- 2. 메뉴 선택(인출)
-- 3. 금액 확인, 비밀번호 인증
-- 4. 금액 입력
-- 5. 인출구에서 현금 수령
-- 6. 카드 받기
-- 7. 명세표 받기

-- COMMIT : 트랜젝션 작업이 정상 완료되면 변경 내용을 영구히 저장
-- ROLLBACK : 트랜젝션 작업을 취소하고 최근 COMMIT한 시점으로 이동
-- SAVEPOINT 세이브포인트명 : 현재 트랜젝션 작업 시점에 이름을 정해줌
--                          하나의 트랜젝션 안에 구역을 나눔
-- ROLLBACK TO 세이브포인트명 : 트랜젝션 작업을 취소하고
--                              SAVEPOINT 시점으로 이동

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
 
 