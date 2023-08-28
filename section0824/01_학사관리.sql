● 파일->새로만들기->데이터베이스계층->데이터베이스 파일
   ->파일명   : 01_학사관리.sql
   ->저장위치 : E:\java202307\database\section0824
/////////////////////////////////////////////////

1. 테이블 생성
---------------------- 학생테이블
create table tb_student(
   hakno    char(5)     not null         --학번
  ,uname    varchar2(20) not null         --이름
  ,email    varchar2(20) unique           --이메일
  ,address  varchar2(20) not null         --주소
  ,phone    varchar2(20)                  --전화번호
  ,regdt    date        default sysdate  --등록일
  ,primary key(hakno)                    --기본키
);

---------------------- 과목테이블
create table tb_gwamok(
   gcode    char(4)      not null        --과목코드 (p:프로그램교과목, d:디자인교과목)
  ,gname    varchar2(20)  not null        --과목이름
  ,ghakjum  number(2)    default 1       --학점 -99 ~ 99
  ,regdt    date         default sysdate --등록일
  ,primary key(gcode)                    --기본키
);

---------------------- 수강테이블
create table tb_sugang(
   sno    number     not null   --일련번호
  ,hakno  char(5)    not null   --학번
  ,gcode  char(4)    not null   --과목코드
  ,primary key(sno)             --기본키
);



2. 수강테이블 시퀀스 생성
create sequence sugang_seq;


3. 행추가
----------------------------- tb_student테이블에 행 추가하기
insert into tb_student(hakno,uname,address,phone,email)
values('g1001','홍길동','서울','111-5558','11@naver.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1002','홍길동','제주','787-8877','33@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1003','개나리','서울','554-9632','77@naver.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1004','홍길동','부산','555-8844','88@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1005','진달래','서울','544-6996','33@nate.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1006','개나리','제주','777-1000','66@naver.com');

----------------------------- tb_gwamok테이블에 행 추가하기
insert into tb_gwamok(gcode,gname,ghakjum) values('p001','JAVA',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p002','Oracle',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p003','JSP',2);
insert into tb_gwamok(gcode,gname,ghakjum) values('d001','HTML',1);
insert into tb_gwamok(gcode,gname,ghakjum) values('d002','포토샵',5);
insert into tb_gwamok(gcode,gname,ghakjum) values('d003','일러스트',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('d004','CSS',1);
insert into tb_gwamok(gcode,gname,ghakjum) values('p004','Python',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p005','AJAX',2);

----------------------------- tb_sugang테이블에 행 추가하기
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p004');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','d001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1006','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');
/////////////////////////////////////////////////////////////////////////////////

commit;

-- tb_student 테이블 전체 레코드 갯수
select count(*) from tb_student; -- 6

-- tb_gwamok 테이블 전체 레코드 갯수
select count(*) from tb_gwamok; --9

-- tb_sugang 테이블 전체 레코드 갯수
select count(*) from tb_sugang; --14
/////////////////////////////////////////////////////////////////////////////////



문1)학생테이블에서 지역별 인원수를 인원수순으로 조회하시오
select address, count(*)
from tb_student
group by address
order by count(*);

select address from tb_student;
select distinct address from tb_student;
select address, count(*) from tb_student group by address;
select address, count(*) from tb_student group by address order by count(*) desc;

문2)학생테이블에서 동명이인이 각 몇명인지 조회하시오
select uname, count(*)
from tb_student
group by uname;

select uname from tb_student;
select distinct uname from tb_student;
select uname from tb_student group by uname;
select uname, count(*) from tb_student group by uname;
select uname, count(*) from tb_student group by uname order by count(*) desc;

문3)학생테이블의 학번, 이름, 주소를 조회하시오 (주소는 영문으로 출력)
select hakno, uname, case when address='서울' then 'Seoul'
                          when address='제주' then 'Jeju'
                          when address='부산' then 'Busan'
                          end as 주소
from tb_student;

select hakno, uname, address, case when address='서울' then 'Seoul'
                                   when address='제주' then 'Jeju'
                                   when address='부산' then 'Busan'
                              end as 주소
from tb_student;



문4)학생테이블에서 주소별 인원수가 3명미만 행을 조회하시오
select address, count(*)
from tb_student
group by address
having count(*)<3;

select address, count(*) from tb_student group by address having count(*)<3;



문5)과목테이블에서 프로그램 교과목만 조회하시오
select gname
from tb_gwamok
group by gname;

select * from tb_gwamok where gcode like 'p%'; -- 프로그램 교과목
select * from tb_gwamok where gcode like 'd%'; -- 디자인 교과목


문6)과목테이블에서 디자인 교과목중에서 3학점만 조회하시오
select gname, ghakjum
from tb_gwamok
where ghakjum=3;

select * from tb_gwamok where gcod목의 학점 평균보다 낮은e like 'd%' and ghakjum=3;

문7)과목테이블에서 프로그램 교과 프로그램 교과목을 조회하시오
select gname
from tb_gwamok
where gcode like 'p%' and ghakjum<=(select avg(ghakjum) from tb_gwamok where gcode like 'p%');

select avg(ghakjum) from tb_gwamok;

select ghakjum from tb_gwamok where gcode like 'p%';
select avg(ghakjum) from tb_gwamok where gcode like 'p%'; -- 2.6

select gcode, ghakjum
from tb_gwamok
where gcode like 'p%' and ghakjum<(select avg(ghakjum) from tb_gwamok where gcode like 'p%');












