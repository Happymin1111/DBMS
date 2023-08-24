● 파일->새로만들기->데이터베이스계층->데이터베이스 파일
   ->파일명   : 03_조인연습문제.sql
   ->저장위치 : E:\java202307\database\section0824
///////////////////////////////////////////////////////////////////////////


● [테이블 조인 연습 문제]

문1) 수강신청을 한 학생들 중에서 '제주'에 사는 학생들만 학번, 이름, 주소를 조회하시오.
select * from tb_sugang;

-- 수강테이블 + 학생테이블
select SU.*, UNAME, address
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno;

-- '제주'만 조회하기
select SU.*, UNAME, address
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno
where address = '제주';

-- 가공된 논리적 테이블의 이름을 AA라고 지정하고, 다시 재가공할 수 있다.
select AA.hakno, AA.gcode, AA.uname, AA.address
from(
        select SU.hakno, SU.gcode, UNAME, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
    ) AA;
    
-- ORA-00904: "AA"."EMAIL": 부적합한 식별자
-- ST테이블에서 e-mail칼럼을 가져오지 않았음.
select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email
from(
        select SU.hakno, SU.gcode, UNAME, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
    ) AA;
    
select AA.hakno, AA.gcode, AA.uname, AA.address
from(
        select SU.hakno, SU.gcode, UNAME, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
    ) AA
where AA.address='제주';

-- AA별칭 생략가능
select hakno, gcode, uname, address
from(
        select SU.hakno, SU.gcode, UNAME, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
    )
where address='제주';

-- AA테이블의 모든 칼럼
select *
from(
        select SU.hakno, SU.gcode, UNAME, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
    )
where address='제주';

/////////////////////////////////////////////////////////////////////////////////

문제2 과목별 수강 신청 인원수, 과목코드, 과목명를 조회하시오 
        d001	HTML	2명
        d002	포토샵	1명
        d003	일러스트	1명
        p001	JAVA	4명
        p002	Oracle	2명
        p003	JSP     2명
        p004	Python	1명
        p005	AJAX	1명

select GW.gname, count(*)    
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode
group by GW.gname;

select GW.gcode, GW.gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

select *
from (select GW.gcode, GW.gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode) AA;

문2) 
select * from tb_sugang order by gcode;

2)
select gcode, count(*)
from tb_sugang group by gcode;

3) 
select AA.gcode, GW.gname, concat(AA.cnt, '명')
from(select gcode, count(*) as cnt
from tb_sugang group by gcode) AA inner join tb_gwamok GW
on AA.gcode = GW.gcode
order by AA.gcode;
////////////////////////////////////////////////////////////////////////

문3) 수강신청을 한 학생들의 학번, 이름 조회
     g1001  홍길동
     g1002  홍길동
     g1005  진달래
     g1006  개나리

문4)수강신청을 하지 않은 학생들의 학번, 이름 조회
     g1003  개나리
     g1004  홍길동
    

select ST.hakno,ST.uname
from tb_sugang SU inner join tb_student ST
on SU.hakno=ST.hakno
where gcode is not null;

select ST.hakno,ST.uname
from tb_sugang SU inner join tb_student ST
on SU.hakno=ST.hakno;
where gcode is not null;
     
 문3) 수강신청을 한 학생들의 학번, 이름 조회
 g1001  홍길동
 g1002  홍길동
 g1005  진달래
 g1006  개나리

--1)
select hakno from tb_sugang order by hakno;
select distinct hakno from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno;

--2)
select hakno, uname
from tb_student
where hakno='g1001' or hakno='g1002' or hakno='g1005' or hakno='g1006';

select hakno, uname
from tb_student
where hakno in ('g1001','g1002','g1005','g1006');

--3) 1)의 결과를 서브쿼리 형태로 조회
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang group by hakno);

4)
select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang group by hakno);

/////////////////////////////////////////////////////////////////////////////////

문5) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python
     
     select hakno, GW.gcode, GW.gname
     from tb_sugang SU inner join tb_gwamok GW
     on SU.gcode = GW.gcode
     where hakno = 'g1001'
     order by GW.gcode;
     
     
     
문6) 학번별 수강신청과목의 총학점을 학번별순으로 조회하시오
        g1001	홍길동	14학점
        g1002	홍길동	8학점
        g1005	진달래	12학점
        g1006	개나리	3학점
    
    select AA.hakno, ST.uname, concat(AA.ent, '학점')
    from(    
    select hakno, sum(GW.ghakjum) as ent
    from tb_sugang SU JOIN tb_gwamok GW
    on SU.gcode=GW.gcode
    group by hakno) AA 
    inner join tb_student ST 
    on AA.hakno = ST.hakno;
        
        
문7) 지역별로 수강신청 인원수, 지역을 조회하시오
     서울 2명
     제주 2명

select address, concat(count(*),'명')
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
group by address;




