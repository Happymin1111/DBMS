● 파일 -> 새로 만들기 -> 데이터베이스계층 -> 데이터베이스 파일
 -> 파일명 : 04_casewhen.sql
 -> 저장위치 : E:\java202307\database\section0821
 //////////////////////////////////////////////////////////////
 
 ● [CASE WHEN ~ THEN END 구문]

형식)
     CASE WHEN 조건1 THEN 조건만족시 값1
          WHEN 조건2 THEN 조건만족시 값2
          WHEN 조건3 THEN 조건만족시 값3
             ...
          ELSE 값
     END 결과컬럼명
     
     
-- 이름 주소를 조회하시오.
select uname, addr from sungjuk;

-- 이름 주소를 조회하시오. (단 주소는 한글로 바꿔서 조회)
select uname, addr , case when addr='Seoul' then '서울'
                          when addr='Jeju'  then '제주'
                          when addr='Busan' then '부산'
                          when addr='Suwon' then '수원'
                        end as juso
from sungjuk

--문제) 이름, 국어, 학점을 조회하시오
      학점 : 국어점수 90이상 'A학점'
                    80이상 'B학점'
                    70이상 'C학점'
                    60이상 'D학점'
                    나머지 'F학점'
                    
1) 
select uname, kor, case when kor>=90 then 'A학점'
                        when kor>=80 then 'B학점'
                        when kor>=70 then 'C학점'
                        when kor>=60 then 'D학점'
                        else 'F학점'
                     end as grade
from sungjuk;

2) 칼럼명 한글 가능
select uname, kor, case when kor>=90 then 'A학점'
                        when kor>=80 then 'B학점'
                        when kor>=70 then 'C학점'
                        when kor>=60 then 'D학점'
                        else 'F학점'
                     end as 국어학점
from sungjuk;

3) between ~ and 연산자
select uname, kor, case when kor between 90 and 100 then 'A학점'
                        when kor between 80 and 89  then 'B학점'
                        when kor between 70 and 79  then 'C학점'
                        when kor between 60 and 69  then 'D학점'
                        else 'F학점'
                     end as 국어학점
from sungjuk;

4) 국어학점순으로 정렬하기
select uname, kor, case when kor between 90 and 100 then 'A학점'
                        when kor between 80 and 89  then 'B학점'
                        when kor between 70 and 79  then 'C학점'
                        when kor between 60 and 69  then 'D학점'
                        else 'F학점'
                     end as 국어학점
from sungjuk
order by 국어학점;
                     

