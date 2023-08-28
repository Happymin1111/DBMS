● 파일 -> 새로 만들기 -> 데이터베이스계층 -> 데이터베이스 파일
 -> 파일명 : 01_nvl함수.sql
 -> 저장위치 : E:\java202307\database\section0822
 //////////////////////////////////////////////////////////////
 
  ※ 참조 http://pretyimo.cafe24.com/lectureRead.do?lectureno=185


● nvl() 함수 - null 값을 다른 값으로 바꿈  

문제) 주소가 'Incheon'의 행의 국어점수 최댓값,인원수를 조회하시오
 select max(kor),count(*)
 from sungjuk
 where addr='Incheon';           --최대값 (null), 인원수(0)
  
 select count(*)+1               --0+1
 from sungjuk
 where addr='Incheon'; 
 
 select max(kor)+1               --null+1  -> null값과 연산할 수 없다.
 from sungjuk
 where addr='Incheon';
 
 --null 값이면 0으로 대체함
 select nvl(max(kor),0)
 from sungjuk
 where addr='Incheon';
 
select nvl(max(kor),0)+1 as MAX_KOR
 from sungjuk
 where addr='Incheon';
 ///////////////////////////////////////////////////////////////////////////
 
 
 
 
select * from sungjuk order by sno desc;

문제) sungjuk테이블에 아래 데이터를 행추가 하시오.

sno : max(sno) + 1;
     단 max()애 null 이면 0으로 바꾼후 계산한다.
     
--insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
--values (nvl(max(sno)+1,0),'손흥민',100,100,100,'Seoul',sysdate);

--1) sno칼럼에서 가장 큰값 가져오기.
select max(sno) from sungjuk;

--2) 만일 1)결과가 null이 나오면 0으로 바꾸기
select nvl(max(sno),0) from sungjuk;

--3) 2)결과에 +1 연산하기
select nvl(max(sno),0)+1 from sungjuk;

--4) 행추가
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values((select nvl(max(sno),0)+1 from sungjuk),'손흥민',100,100,100,'Seoul',sysdate );

select * from sungjuk order by sno desc;
commit;