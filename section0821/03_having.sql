● 파일 -> 새로 만들기 -> 데이터베이스계층 -> 데이터베이스 파일
 -> 파일명 : 03_having.sql
 -> 저장위치 : E:\java202307\database\section0821
 //////////////////////////////////////////////////////////////
 
 [having 조건절]
  - group by 와 같이 사용하는 조건절
  - 그룹화를 하고 난 후의 조건절을 추가
  - 형식) having 조건절
  
  -- 주소별 인원수를 조회 하시오
  select addr, count(*)
  from sungjuk
  group by addr;
  
  -- 주소별 인원수가 3인 행을 조회 하시오.
  select addr, count(*)
  from sungjuk
  group by addr
  having count(*)=3;
  
  -- 주소별 인원수가 3이상인 행을 조회 하시오.
  select addr, count(*)
  from sungjuk
  group by addr
  having count(*)>=3;
  
  -------------------------------------------------
--문1)주소별 국어평균값이 50이상 행을 조회하시오
--    (단, 평균값은 소수점없이 반올림)
  --select round(avg(kor))
  --from sungjuk
  --group by kor
  --having round(avg(kor))>=50;
  
  1)주소별 국어평균값 구하기
  select addr, avg(kor)
  from sungjuk
  group by addr;
  
  2)국어평균값을 소수점에서 반올림하기
  select addr, round(avg(kor))
  from sungjuk
  group by addr;
  
  3) 2)결과에서 국어평균값이 50이상 조회하기.
  select addr, round(avg(kor),0)
  from sungjuk
  group by addr
  having round(avg(kor),0)>=50;
  
  4) 3)결과에서 국어평균값을 내림차순 조회하기
  select addr, round(avg(kor),0)
  from sungjuk
  group by addr
  having round(avg(kor),0)>=50
  order by round(avg(kor),0) desc;
  
  5)  4)결과에서 국어평균값 칼럼명을 avg_kor로 변경하기.
  select addr, round(avg(kor),0) as avg_kor
  from sungjuk
  group by addr
  having round(avg(kor),0)>=50
  order by round(avg(kor),0) desc;
  
  
--문2) 평균(aver)이 70이상 행을 대상으로 주소별 인원수를 구한후
--     그 인원수가 2미만 행을 인원수 순으로 조회하시오
 select addr, count(*)
 from sungjuk
 where aver>=70
 group by addr
 having count(aver)<2;
 
 1) 전체 행 조회
 select *
 from sungjuk
 order by aver desc;
 
 2) 평균(aver)값이 70이상 행조회
 select *
 from sungjuk
 where aver>=70;
 
 3) 2)결과에서 주소별 인원수를 구하시오
 select addr, count(*)
 from sungjuk
 where aver>=70
 group by addr;
 
 4) 3)결과에서 주소별 인원수를 구하시오
 select addr, count(*)
 from sungjuk
 where aver>=70
 group by addr
 having count(*)<2;

 5) 4)결과에서 인원수 순으로 조회
 select addr, count(*) as cnt
 from sungjuk
 where aver>=70
 group by addr
 having count(*)<2
 order by cnt; -- order by count(*) 써도됨
 
 