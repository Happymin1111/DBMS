● 파일 -> 새로 만들기 -> 데이터베이스계층 -> 데이터베이스 파일
 -> 파일명 : 04_sort.sql
 -> 저장위치 : E:\java202307\database\section0818
 //////////////////////////////////////////////////////////////
 
 ● [Sort 정렬]
  - 특정값(keyfield)을 기준으로 순서대로 재배치
  - 오름차순 Ascending Sort   ASC  생략하면 기본값  1->10  A->Z  a->z  ㄱ->ㅎ
  - 내림차순 Descending Sort  DESC
  - 형식) order by 칼럼명1, 칼럼명2, 칼럼명3, ~~
  
  -- sungjuk 테이블을 조회하시오
  select * from sungjuk;
  
  -- 전체 레코드를 이름순으로 정렬해서 조회하세요.
  select uname
  from sungjuk
  order by uname asc; -- 오름차순 정렬
  
  select uname
  from sungjuk
  order by uname; -- asc 생략가능
  
  select uname
  from sungjuk
  order by uname desc; -- 내림차순 정렬
  
  -- 국어점수순으로 정렬해서 조회하시오.
  select uname, kor
  from sungjuk
  order by kor;
  
  -- 1차 정렬 : 국어점수순으로 정렬
  -- 2차 정렬 : 국어점수가 같다면 이름을 기준으로 내림차순 정렬
  select uname, kor
  from sungjuk
  order by kor,uname desc;


-- 1차(kor), 2차(eng), 3차(mat) 내림차순 정렬
 select uname, kor, eng, mat
 from sungjuk
 order by kor desc, eng desc, mat desc;
 
-- 문제) 평균 70점 이하 행을 이름 순으로 조회 하시오
 select uname, aver
 from sungjuk
 where aver<=70 order by uname;
 
 select uname, from sungjuk order by uname where aver<=70; -- ORA-00936 에러발생
 
 

