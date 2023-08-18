● 파일 -> 새로 만들기 -> 데이터베이스계층 -> 데이터베이스 파일
 -> 파일명 : 20230818_alter.sql
 -> 저장위치 : E:\java202307\database\section0818
 
 -- sungjuk 테이블 삭제
 drop table sungjuk;
 
 -- sungjuk 테이블 생성
create table sungjuk (
    uname varchar(50) not null
    ,kor  int        not null
    ,eng  int        not null
    ,mat  int        not null
    ,tot  int            null  
    ,aver int         
) ;    

-- sungjuk 테이블 조회
select * from sungjuk;
//////////////////////////////////////////////////////////////////

● [alter 문] 테이블의 구조 수정 및 변경

1. 컬럼 추가
형식) alter table table명 add (컬럼명 데이터타입);

--music 칼럼 추가
alter table sungjuk add (music int null);
select * from sungjuk;

2. 컬럼명 수정
형식) alter table table명 rename column 원래컬럼명 to 바꿀컬럼명

== 국어칼럼 kor를 korea칼럼명으로 수정하시오
alter table sungjuk rename column kor to korea;

3. 컬럼 데이터 타입 수정 
형식) alter table table명 modify(컬럼명 데이터타입);

-- music 칼럼의 자료형을 varchar 수정하시오
alter table sungjuk modify(music varchar(5));
select * from sungjuk;

4. 컬럼 삭제 
형식) alter table table명 drop(컬럼명);

-- music칼럼을 삭제하시오
alter table sungjuk drop (music);
