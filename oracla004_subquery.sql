
/*-----------------------------------------------------------
       문제

1) department_id가 60인 부서의 도시명을 알아내는 SELECT문장을 기술하시오

    
2)사번이 107인 사원과 부서가같고,167번의 급여보다 많은 사원들의 사번,이름(first_name),급여를 출력하시오.
   
                  
3) 급여평균보다 급여를 적게받는 사원들중 커미션을 받는 사원들의 사번,이름(first_name),급여,커미션 퍼센트를 출력하시오.
    
    
4)각 부서의 최소급여가 20번 부서의 최소급여보다 많은 부서의 번호와 그부서의 최소급여를 출력하시오.
 
    
5) 사원번호가 177인 사원과 담당 업무가 같은 사원의 사원이름(first_name)과 담당업무(job_id)하시오.   

  
6) 최소 급여를 받는 사원의 이름(first_name), 담당 업무(job_id) 및 급여(salary)를 표시하시오(그룹함수 사용).

				
7)업무별 평균 급여가 가장 적은  업무(job_id)를 찾아 업무(job_id)와 평균 급여를 표시하시오.

					  
8) 각 부서의 최소 급여를 받는 사원의 이름(first_name), 급여(salary), 부서번호(department_id)를 표시하시오.


9)담당 업무가 프로그래머(IT_PROG)인 모든 사원보다 급여가 적으면서 
업무가 프로그래머(IT_PROG)가 아닌  사원들의 사원번호(employee_id), 이름(first_name), 
담당 업무(job_id), 급여(salary))를 출력하시오.
           

10)부하직원이 없는 모든 사원의 이름을 표시하시오.
-------------------------------------------------------------*/


/*--------------------------------------------------------------
ROWNUM
1. oracle의 SELECT문 결과에 대해서 논리적인 일련번호를 부여한다.
2. ROWNUM은 조회되는 행수를 제안할 때 많이 사용한다.
3. rownum=1, rownum<=3, rownum < 3(가능)
   rownym=3, rownum>=3, rownum >3 (불가능)
---------------------------------------------------------------*/

SELECT rownum, first_name, salary
FROM employees; --o

SELECT rownum, first_name, salary
FROM employees
WHERE rownum =1; --o


SELECT rownum, first_name, salary
FROM employees
WHERE rownum <= 3; --o


SELECT rownum, first_name, salary
FROM employees
WHERE rownum = 3; -- x

SELECT rownum, first_name, salary
FROM employees
WHERE rownum >= 3; -- x

SELECT b.*
FROM (SELECT rownum AS rm, a.* --아래 컬럼에 있는 모든 데이터값을 말함
      FROM (SELECT * FROM employees
            ORDER BY salary DESC) a
      )b      
WHERE b.rm >=6 AND b.rm <=10 ;  --rownum 직접적으로  크기를 정해줄 수 없다.



/*------------------------------------------
ROWID
1. oracle에서 데이터를 구분할 수 있는 유일한 값이다.
2. SELECT문에서 rowid를 사용할 수 있다.
3. rewid을 통해서 데이터가 어떤 데이터파일, 어느 블록에 저장되어 있는지 알 수 있다.
4. rowid 구조 (총 18자리)
   오브젝트 번호(1~6) : 오브젝트 별로 유일한 값을 가지고 있으며, 해당 오브젝트가 속해 있는 값이다.
   파일 번호(7~9) : 테이블스페이스(tablesapace)에 속해 있는 데이터 파일에 대한 상3대 파일번호이다.
   블록번호(10~15) : 데이터 파일 내부에서 어느 블록에 데이터가 있는지 알려준다.
   데이터번호(16~10) : 데이터 블록에 데이터가 저장되어 있는 순서를 의미한다.

[block size 확인]-8kbyte가 저장됨
SQL> conn sys/a1234 as sysdba
Connected.
SQL> show user
USER is "SYS"
SQL> show parameter db_block_size

NAME                     TYPE                     VALUE
----------------------------------------------------------------------------------------
db_block_size             integer                  8192
-------------------------------------------------------------------------------------*/
SELECT rowid, first_name, salary
FROM employees;


   








