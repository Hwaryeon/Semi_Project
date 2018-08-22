--  DAY5 수업내용
--  SUBQUERY(서브쿼리)
--  서브쿼리 : 쿼리문 안에서 사용된 쿼리문
--  사원명이 노옹철인 사람의 부서 조회
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철';

-- 부서코드가 D9인 직원을 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--  부서코드가 노옹철 사원과 같은 소속의 직원 명단 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                        FROM EMPLOYEE 
                        WHERE EMP_NAME = '노옹철');
                        
--  전직원의 평균 급여보다 많은 급여를 받고 있는 직원의
--  사번, 이름, 직급코드, 급여를 조회하세요
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEE);

-- 서브쿼리의 유형
--  단일행 서브쿼리 : 서브쿼리의 조회 결과값이 1개일 때
--  다중행 서브쿼리 : 서브쿼리의 조회 결과값의 행이 여러개 일 때
--  다중열 서브쿼리 : 서브쿼리의 조회 결과값의 컬럼이 여러개 일 때
--  다중행 다중열 서브쿼리 : 조회 결과 행 수와 열 수가 여러개 일 때

--  서브쿼리의 유형에 따라 서브쿼리 앞에 붙는 연산자가 다름
--  단일행 서브쿼리 앞에는 일반 비교 연산자 사용
--  >, <, >=, <=, =, !=/<>/^= (서브쿼리)

-- 노옹철 사원의 급여보다 많이 받는 직원의
-- 사번, 이름, 부서, 직급, 급여를 조회하세요

SELECT EMP_ID 사번, EMP_NAME 이름, DEPT_TITLE 부서, JOB_NAME 직급, SALARY 급여
FROM EMPLOYEE E
JOIN JOB J ON( E.JOB_CODE = J.JOB_CODE)
JOIN DEPARTMENT D ON(E.DEPT_CODE = D.DEPT_ID)
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '노옹철');

--가장 적은 급여를 받는 직원의
-- 사번,이름,직급,부서,급여,입사일을 조회하세요
SELECT EMP_ID 사번, EMP_NAME 이름,  JOB_NAME 직급,
DEPT_TITLE 부서, SALARY 급여, HIRE_DATE 입사일
FROM EMPLOYEE E
JOIN JOB J ON( E.JOB_CODE = J.JOB_CODE)
JOIN DEPARTMENT D ON(E.DEPT_CODE = D.DEPT_ID)
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);


--  서브쿼리는 SELECT, WHERE ,HAVING, FROM절에도 사용할 수 있다.
--  부서별 급여의 합계 중 가장 큰 부서의 부서명, 급여 합계를 구하세요
SELECT DEPT_TITLE, SUM(SALARY)
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
GROUP BY DEPT_TITLE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                        GROUP BY DEPT_CODE);
                        


-- 다중행 서브쿼리
-- 다중행 서브쿼리 앞에서는 일반 비교연산자 사용 못함
-- IN / NOT IN : 여러 개의 결과값 중에서 한 개라도 일치하는 값이 있다면
--                혹은 없다면 이라는 의미
--  > ANY, < ANY : 여러 개의 결과값 중에서 한 개라도 큰 / 작은 경우
--                  가장 작은 값보다 크냐? / 가장 큰 값보다 작냐?
-- > ALL, < ALL : 모든 값보다 큰 / 작은 경우
--                  가장 큰 값보다 크냐? / 가장 작은 값보다 작냐?
-- EXISTS / NOT EXISTS : 서브 쿼리에만 사용하는 연산자로
--                         값이 존재하냐 ? / 존재하지 않느냐?

-- 부서별 최고 급여를 받는 직원의 이름, 직급, 부서, 급여 조회
SELECT DEPT_CODE, MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT EMP_NAME, JOB_CODE, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY IN (SELECT MAX(SALARY)
                    FROM EMPLOYEE
                        GROUP BY DEPT_CODE);
                        
--  관리자에 해당하는 직원에 대한 정보와 관리자가 아닌 직원의
--  정보를 추출하여 조회
--  사번, 이름, 부서명, 직급, '관리자' AS 구분 / '직원' AS 구분

SELECT DISTINCT MANAGER_ID
FROM EMPLOYEE
WHERE MANAGER_ID IS NOT NULL;

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, '관리자' AS 구분
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE EMP_ID IN (SELECT DISTINCT MANAGER_ID
                    FROM EMPLOYEE
                        WHERE MANAGER_ID IS NOT NULL)


UNION

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, '직원' AS 구분
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE EMP_ID NOT IN (SELECT DISTINCT MANAGER_ID
                    FROM EMPLOYEE
                        WHERE MANAGER_ID IS NOT NULL);


-- SELECT 절에서도 서브쿼리를 사용할 수 있다.
SELECT EMP_ID, EMP_NAME, DEPT_TITLE,
        CASE WHEN EMP_ID IN (SELECT DISTINCT MANAGER_ID
                            FROM EMPLOYEE
                            WHERE MANAGER_ID IS NOT NULL)
            THEN '관리자'
          ELSE '직원'
        END AS 구분
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- 대리 직급의 직원들 중에서 과장 직급의 최소 급여보다 많이 받는
-- 직원의 사번, 이름, 직급, 급여를 조회하세요
-- 단, > ANY 혹은 < ANY 연산자
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '과장';

SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '대리';


SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '대리'

AND SALARY > ANY 
( SELECT SALARY FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '과장'

);


-- 차장 직급의 급여의 가장 큰 값보다 많이 받는 과장 직급의
-- 사번 , 이름, 직급, 급여를 조회하세요
-- 단, > ALL 혹은 < ALL 연산자를 사용
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '과장'

AND SALARY > ALL(SELECT SALARY FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE JOB_NAME = '차장');


SELECT *
FROM EMPLOYEE
WHERE EXISTS (SELECT *
                FROM EMPLOYEE
                    WHERE EMP_ID = '200');



-- 자기 직급의 평균 급여를 받고 있는 직원의
-- 사번, 이름, 직급, 급여를 조회하세요
-- 단, 급여와 급여 평균은 만원단위로 계산하세요 TRUNC(컬러명, -5)
SELECT JOB_CODE, TRUNC(AVG(SALARY, -5))
FROM EMPLOYEE
GROUP BY JOB_CODE;

SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY IN (SELECT TRUNC(AVG(SALARY), -5)
                    FROM EMPLOYEE
                            GROUP BY JOB_CODE);


-- 다중행 다중열 서브쿼리를 이용한 해결
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (SELECT JOB_CODE,
                                TRUNC(AVG(SALARY), -5)
                                FROM EMPLOYEE
                                GROUP BY JOB_CODE);
                                
-- 다중열 서브쿼리
-- 퇴사한 여직원과 같은 부서, 같은 직급에 해당하는
-- 사원의 이름, 직급, 부서 입사일을 조회
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
                
--다중열 서브쿼리로 변경
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
                    
-- 서브쿼리의 사용 위치 :
-- SELECT절, FROM절, WHERE절, HAVING절, GROUP BY절, ORDER BY절
-- DML 구문 : INSERT문, UPDATE문
-- DDL 구문 : CREATE TABLE문, CREATE VIEW문

-- FROM 절에서 서브쿼리를 사용할 수 있다 : 테이블 대신에 사용
-- 인라인 뷰 (INLINE VIEW)라고 함
-- : 서브쿼리가 만든 결과집합(RESULT SET)에 대한 출력 화면
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
        WHERE DEPT_TITLE = '인사관리부';
    
    
    -- 인라인뷰를 활용한 TOP-N분석
    -- ORDER BY 한 결과에 ROWNUM을 붙임
    -- ROWNUM은 행 번호를 의미함
    -- FROM절에서 붙여짐
    -- ORDER BY 한 다음에 ROWNUM이 붙게 하려면 서브쿼리(인라인뷰)를 사용함
    SELECT ROWNUM, EMP_NAME, SALARY
    FROM EMPLOYEE
    ORDER BY EMP_NAME;
    
    SELECT ROWNUM, EMP_NAME, SALARY
    FROM (SELECT * FROM EMPLOYEE
            ORDER BY SALARY DESC)
            WHERE ROWNUM <= 5;
            
            -- 급여 평균 3위 안에 드는 부서의 부서 코드와 부서명,
            -- 평균 급여를 조회하세요
            
            
         SELECT DEPT_CODE, DEPT_TITLE, 평균급여
         FROM (SELECT DEPT_CODE, DEPT_TITLE, AVG(SALARY) 평균급여
         FROM EMPLOYEE
         JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
         GROUP BY DEPT_CODE, DEPT_TITLE
         ORDER BY AVG(SALARY) DESC)
         WHERE ROWNUM <= 3;
         
-- 직원 정보에서 급여를 가장 많이 받는 직원 5명 조회
-- RANK()함수는 동일한 순위 이후의 등수를 동일한 인원수만큼 건너뛰고
-- 다음 순위를 계산하는 방식
-- DENSE_RANK() : 중복되는 순위 이후의 등수를 이후 등수로 처리

SELECT EMP_NAME, SALARY, 
        DENSE_RANK() OVER(ORDER BY SALARY DESC) 순위
        FROM EMPLOYEE;
        
SELECT EMP_NAME, SALARY,
        RANK() OVER(ORDER BY SALARY DESC) 순위
        FROM EMPLOYEE;
        
        
SELECT *
FROM (SELECT EMP_NAME, SALARY, 
            RANK() OVER(ORDER BY SALARY DESC) 순위
        FROM EMPLOYEE)
WHERE 순위 <=5;


-- 직원 테이블에서 보너스 포함한 연봉이 높은 5명의
-- 사번, 이름, 부서명, 직급명, 입사일을 조회하세요

SELECT *
FROM (SELECT EMP_ID 사번, EMP_NAME 이름, DEPT_TITLE 부서명, JOB_NAME 직급명, HIRE_DATE 입사일
, RANK() OVER(ORDER BY (SALARY * (1 + NVL(BONUS, 0))) DESC) AS 순위
        FROM EMPLOYEE E
        JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
        JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
        )
WHERE 순위 <= 5;
        
-- WITH 이름 AS (쿼리문)
-- 서브쿼리에 이름을 붙여주고 사용시 이름을 사용하게 됨
-- 인라인뷰로 사용될 서브쿼리에 주로 이용됨
-- 같은 서브쿼리가 여러번 사용될 경우 중복 작성을 줄일 수 있다.
-- 실행 속도가 빨라진다는 장점이 있다.

WITH TOPN_SAL AS (SELECT EMP_ID, EMP_NAME, SALARY
                    FROM EMPLOYEE
                    ORDER BY SALARY DESC)
                    SELECT ROWNUM, EMP_NAME, SALARY
                    FROM TOPN_SAL;
        
        
-- 부서별 급여 합계가 전체 급여의 총 합의 20%보다 많은
-- 부서의 부서명과 부서별 급여 합계 조회
SELECT DEPT_TITLE, SUM(SALARY)
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
GROUP BY DEPT_TITLE
HAVING SUM(SALARY) > (SELECT SUM(SALARY) * 0.2
                        FROM EMPLOYEE);
                        
-- 인라뷰 사용
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
                        
-- WITH 사용
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
                
                -- WITH로 서브쿼리 여러 개 저장
                WITH SUM_SAL AS (SELECT SUM(SALARY) FROM EMPLOYEE),
                    AVG_SAL AS (SELECT AVG(SALARY) FROM EMPLOYEE)
                    
                    SELECT *
                    FROM SUM_SAL
                    UNION
                    SELECT *
                    FROM AVG_SAL;
                    
-- 상[호연]관 서브쿼리
-- 일반적으로는 서브쿼리가 만든 결과값을 메인쿼리가 비교 연산
-- 메인쿼리가 사용하는 테이블의 값을 서브쿼리가 이용해서 결과를 만듦
-- 메인쿼리의 테이블 값이 변경되면, 서브쿼리의 결과값도 바뀌게 됨

-- 관리자 사번이 EMPLOYEE 테이블에 존재하는 직원에 대한 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID
FROM EMPLOYEE E
WHERE EXISTS (SELECT EMP_ID
                FROM EMPLOYEE M
                WHERE E.MANAGER_ID = M.EMP_ID);
                
                
-- 동일 직급의 급여 평균보다 급여를 많이 받고 있는 직원의
-- 사번, 직급코드, 급여를 조회하세요
--WHERE절에서 스칼라 서브쿼리 사용
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE E
WHERE SALARY > (SELECT TRUNC(AVG(SALARY), -5)
                FROM EMPLOYEE M
                WHERE E.JOB_CODE = M.JOB_CODE);
                
                
-- 스칼라 서브쿼리
-- 단일행 서브쿼리 + 상관쿼리
-- SELECT절, WHERE절, ORDER BY절 사용 가능

-- SELECT절에서 스칼라 서브쿼리 이용
-- 모든 사원의 사번, 이름, 관리자사번, 관리자명을 조회하세요
SELECT EMP_ID, EMP_NAME, MANAGER_ID,
        NVL((SELECT EMP_NAME
            FROM EMPLOYEE M
            WHERE E.MANAGER_ID = M.EMP_ID), '없음')
FROM EMPLOYEE E
ORDER BY 1;
                
-- ORDER BY절에서 스칼라 서브쿼리 이용
-- 모든 직원의 사번, 이름, 소속부서 조회
-- 단, 부서명 내림차순 정렬
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
ORDER BY(SELECT DEPT_TITLE FROM DEPARTMENT
                    WHERE DEPT_CODE = DEPT_ID) DESC NULLS LAST;
                