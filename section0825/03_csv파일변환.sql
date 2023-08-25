● 파일->새로만들기->데이터베이스계층->데이터베이스 파일
   ->파일명   : 03_csv파일변환.sql
   ->저장위치 : E:\java202307\database\section0825
///////////////////////////////////////////////////////////////////////////

● [CSV 파일]
   - 모든 데이터가 ,로 구분되어 있는 파일
   
● [CSV 파일을 데이터베이스로 가져오기]
   - 공공데이터포털 http://data.go.kr/ 활용

문1) 도로명 우편번호 테이블 구축하기..


--1) zipdoro.csv 준비 (258267행)

--2)zipdoro.csv 내용을 저장하는 zipdoro 테이블 생성
create table zipdoro (
    zipno           char(5)--우편번호
    ,zipaddress     varchar2(4000)--주소
);

drop table zipdoro; --테이블 삭제

--3) -zipdoro 테이블 우클릭 -> 데이터 임포트 (가져오기)
     -zipdoro 테이블 우클릭 -> export      (내보내기)
     
--4)전체 행 갯수 조회하기
select count(*) from zipdoro;

문2) 한국교대 초중등학교위치.csv를 변환해서 테이블에 저장하시오. (11873행)

create table korsch (
    schcode       varchar2(40) -- 학교ID
    ,schname       varchar2(100) -- 학교이름
    ,schclass      varchar2(100) -- 학교급구분
    ,schaddress    varchar2(100) -- 학교주소
    ,schcreate     DATE    -- 생성일자
    ,schalter      DATE    -- 변경일자
    ,schwedo       number(20,10)   -- 위도
    ,schkyeong     number(20,10)   -- 경도
);
drop table korsch;

select * from korsch;

--과제1) 비어있는 값(null)을 찾으시오

--과제2) 각 시도별 초등학교, 중학교 갯수를 구하시오

from korsch
g
