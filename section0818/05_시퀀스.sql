● 파일 -> 새로 만들기 -> 데이터베이스계층 -> 데이터베이스 파일
 -> 파일명 : 05_시퀀스.sql
 -> 저장위치 : E:\java202307\database\section0818
 //////////////////////////////////////////////////////////////
 
 select * from sungjuk;
 
 [자동으로 일련번호 부여]
 - Oracle database : squence 생성
 - M*SQL database : identity 제약조건
 
 -- sungjuk 테이블 삭제
 drop table sungjuk;
 
 
 -- sungjuk 테이블 생성
 create table sungjuk(
     sno    int         not null   -- 일련번호
     ,uname varchar(50) not null
     ,kor   int         not null
     ,eng   int         not null
     ,mat   int
     ,tot   int
     ,aver  int
     ,addr  varchar(20)            -- 주소
     ,wdate date                   -- 작성일 (년월일시분초)
);

select * from sungjuk;

-- 행 추가 테스트
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values (1,'홍길동',89,88,77,'Seoul','2023-08-18');
delete from sungjuk;
commit; -- 명령어 완료

[시퀀스 sequence]
-일련번호 자동생성
-시퀀스 생성 : create sequence 시퀀스명;
-시퀀스 삭제 : drop sequence 시퀀스명;

-- 시퀀스 생성 형식)
   create sequence 시퀀스명
   increment by 증가값 start with 시작값;
   
-- sungjuk테이블에서 사용할 시퀀스 생성
create sequence sungjuk_seq;

-- sungjuk테이블 시퀀스 삭제
drop sequence sungjuk_seq;

[sysdate 함수] - 시스템의 현재 날짜 정보
///////////////////////////////////////////////////////////////////

-- 시퀀스와 sysdate함수를 이용한 행추가 테스트
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values (sungjuk_seq.nextval,'홍길동',89,88,77,'Seoul',sysdate );

select * from sungjuk;

--문제) sno=3행을 삭제하시오.
delete from sungjuk where uname='홍길동';
delete from sungjuk where kor=89;
delete from sungjuk where sno=3;