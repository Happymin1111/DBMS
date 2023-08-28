● 파일 -> 새로 만들기 -> 데이터베이스계층 -> 데이터베이스 파일
 -> 파일명 : 06_오라클함수.sql
 -> 저장위치 : E:\java202307\database\section0821
 //////////////////////////////////////////////////////////////
 
 ※ 참조 http://pretyimo.cafe24.com/lectureRead.do?lectureno=185
 
 -- 가상 테이블 : dual
 
 ● [오라클 함수]
 
 1. 문자열 관련 함수
 
 select lower('Hello World') from dual;       --전부 소문자로 변환
 select upper('Hello World') from dual;       --전부 대문자로 변환
 select length('Hello World') from dual;      --글자갯수
 select substr('Hello World', 1,7) from dual; --문자열 자르기(첫번째 글자부터 5개) 'Hello'
 
 select instr('HelloWorld', 'W') from dual;   --특정문자 위치 6
 select lpad('SKY',5,'*') from dual;          --5칸내에서 출력하고 왼쪽 빈칸은 *로 채움
 select rpad('SKY',5,'*') from dual;          --5칸내에서 출력하고 오른쪽 빈칸은 *로 채움
 select replace('happy','p','k') from dual;   --특정문자 변환
 
  select concat('로미오','줄리엣') from dual;    --로미오줄리엣
 
 select concat(uname,'의 평균은'), concat(aver,'입니다')
 from sungjuk;
 
 select concat(uname,'의 평균은') as 이름, concat(aver,'입니다') as 평균
 from sungjuk;
 
 -- 결합연산자 ||
 select uname || '의 평균은' || aver || ' 입니다' from sungjuk;
 select uname || '의 평균은' || aver || ' 입니다' as str from sungjuk;
 
 2. 숫자 관련 함수

 
 3. 날짜 관련 함수
 
 4. 형변환 함수