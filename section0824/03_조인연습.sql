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
     
-- 1) 학번 g1001 수강신청 목록
select * from tb_sugang where hakno='g1001';

-- 2) 수강테이블 + 과목테이블 조인
select SU.hakno, SU.gcode, GW.gcode, GW.gname
from tb_sugang SU inner join tb_gwamok GW
on SU.gcode = GW.gcode;

-- 3) 학번 g1001이 신청한 정보만 조회하기.
select SU.hakno, SU.gcode, GW.gcode, GW.gname
from tb_sugang SU inner join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno='g1001';

-- 4) 과목코드별 정렬 하기.
select SU.hakno, SU.gcode, GW.gcode, GW.gname
from tb_sugang SU inner join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno='g1001'
order by SU.gcode;

-- 5) 중복되는 칼럼에서 별칭 생략하기
select hakno, SU.gcode, GW.gcode, gname
from tb_sugang SU inner join tb_gwamok GW
on SU.gcode = GW.gcode
where hakno='g1001'
order by SU.gcode;



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
    
    
SELECT HAKNO
    , (SELECT UNAME
         FROM TB_STUDENT ST
        WHERE ST.HAKNO = AA.HAKNO) AS UNAME
    , CONCAT(HAP, '학점')           AS HAP
 FROM (
       SELECT SU.HAKNO, SUM(GW.GHAKJUM) AS HAP
         FROM TB_SUGANG SU
              JOIN TB_GWAMOK GW ON GW.GCODE = SU.GCODE
        GROUP BY SU.HAKNO
      ) AA;
       
문4)의 또 다른 방법
--1) 수강테이블 + 학생테이블 + 과목테이블 = 3개 테이블 한꺼번에 조인
select SU.hakno, SU.gcode, ST.uname, GW.ghakjum
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno inner join tb_gwamok GW
on SU.gcode = GW.gcode
order by SU.hakno;

--2) 1차그룹(학번), 2차그룹(이름)으로 그룹화하고, 총학점 구하기.
select SU.hakno, ST.uname, sum(GW.ghakjum) || '학점' as hap
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno inner join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, ST.uname;
//////////////////////////////////////////////////////////////////////////


    
--1) 수강테이블에서 학번별로 조회
select hakno, gcode from tb_sugang order by hakno;

--2) 수강테이블에 과목코드가 일치하는 학점을 과목테이블에서 가져와서 붙이기
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;
        
--3) 2)의 결과를 AA테이블로 만들고,
select AA.hakno, sum(AA.ghakjum)
from (
        select SU.hakno, SU.gcode, GW.ghakjum
        from tb_sugang SU join tb_gwamok GW
        on SU.gcode=GW.gcode) AA
group by AA.hakno;

--3)의 결과에서 칼럼명 다시 부여하기
select AA.hakno, sum(AA.ghakjum) as hap
from (select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode) AA
group by AA.hakno;

--4) 3의 결과를 BB 테이블로 만들고,
select BB.hakno, ST.uname, concat(BB.hap, '학점')
from(
        select AA.hakno, sum(AA.ghakjum) as hap
        from (select SU.hakno, SU.gcode, GW.ghakjum
        from tb_sugang SU join tb_gwamok GW
        on SU.gcode=GW.gcode) AA
        group by AA.hakno
        ) BB inner join tb_student ST
on BB.hakno = ST.hakno;

        
문7) 지역별로 수강신청 인원수, 지역을 조회하시오
     서울 2명
     제주 2명

select SU.hakno, concat(count(*),'명')
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
group by SU.hakno;

--1) 수강테이블 조회
select * from tb_sugang order by hakno;

--2) 수강 신청한 학생들의 명단 조회 (학번)
select hakno from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno;
select hakno, count(*) from tb_sugang group by hakno;

--3) 수강신청한 학번(AA)들의 주소를 학생테이블에서 가져오기
select AA.hakno, ST.address
from(
       select hakno from tb_sugang group by hakno
    ) AA inner join tb_student ST
on AA.hakno = ST.hakno;    

--4) 3)의 결과를 BB테이블로 만든 후, 주소별 갯수 조회
select BB.address, count(*)
from(
        select AA.hakno, ST.address
        from(
               select hakno from tb_sugang group by hakno
            ) AA inner join tb_student ST
        on AA.hakno = ST.hakno  
    ) BB
group by BB.address;