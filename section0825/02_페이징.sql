● 파일->새로만들기->데이터베이스계층->데이터베이스 파일
   ->파일명   : 02_페이징.sql
   ->저장위치 : E:\java202307\database\section0825
///////////////////////////////////////////////////////////////////////////

● [모조칼럼 rownum] 

-- 줄번호
select hakno, uname, rownum
from tb_student;

-- 줄번호 칼럼명 바꾸기 
select hakno, uname, rownum as rnum from tb_student;

-- 특정 칼럼을 기준으로 정렬하면 줄번호도 배치된다.
select hakno, uname, rownum as rnum from tb_student order by uname;

-- 줄번호 1~3 사이 조회
select hakno, uname, rownum from tb_student where rownum>=1 and rownum<=3;

-- 줄번호 4~6 사이 조회 (조회안됨)
select hakno, uname, rownum from tb_student where rownum>=4 and rownum<=6;
/////////////////////////////////////////////////////////////////////////

● [rownum를 활용한 페이징]
 - rownum은 모조칼럼이므로 조건절에 직접 사용하지 말고 실제칼럼으로 인식후 사용할 것을 추천
 - rownum칼럼은 셀프조인 후에 줄번호 추가하고 조건절에 활용한다
 
 문) 줄번호(rownum)을 이용해서 줄번호 4~6 조회
 select uname, hakno, address, rownum
 from tb_student
 order by uname;
 
 --2) 1)의 결과를 셀프조인 (AA 테이블)
select uname, hakno, address, rownum as rnum
from(
    select uname, hakno, address
    from tb_student
    order by uname
) AA;

--AA 테이블 별칭은 생략해도 된다.
select uname, hakno, address, rownum as rnum
from(
        select uname, hakno, address
        from tb_student
        order by uname
    );
    
select uname, hakno, address, rnum    
from(
        select uname, hakno, address, rownum as rnum
        from(
        select uname, hakno, address
        from tb_student
        order by uname
      )AA
    )BB
Where rnum>=4 and rnum<=6; --where rnum>=1 and rnum<=3;

select uname, hakno, address, rnum    
from(
        select uname, hakno, address, rownum as rnum
        from(
        select uname, hakno, address
        from tb_student
        order by uname
      )
    )
Where rnum>=4 and rnum<=6; --where rnum>=1 and rnum<=3;  