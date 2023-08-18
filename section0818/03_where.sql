● 파일 -> 새로 만들기 -> 데이터베이스계층 -> 데이터베이스 파일
 -> 파일명 : 03_where.sql
 -> 저장위치 : E:\java202307\database\section0818
 //////////////////////////////////////////////////////////////
 
● [between A and B] 연산자 - A부터 B까지
-- 국어점수가 80점 ~ 89점 사이 행을 조회 하시오

select uname, kor
from sungjuk
where kor between 80 and 89;

● [in] 연산자 - 목록에서 찾기
-- 이름이 '무궁화', '봉선화'를 조회하시오
select uname
from sungjuk
where uname in ('무궁화', '봉선화');

-- 국어점수 10, 30, 50점을 조회 하시오
select uname, kor
from sungjuk
where kor in(10,30,50);

● [LIKE 연산자]
 - 문자열 데이터에서 비슷한 유형을 검색할때
 - % 글자갯수와 상관없음
 - _ 글자갯수까지 일치해야함.
 
 
select uname from sungjuk where uname='대한민국';
 --------------------------------------------------------------
--문1) 이름에서 '홍'으로 시작하는 이름을 조회하시오
select uname
from sungjuk
where uname like '홍%';

--문2) 이름에서 '화'로 끝나는 이름을 조회하시오
select uname
from sungjuk
where uname like '%화';

--문3) 이름에 '나'글자 있는 이름을 조회하시오
select uname
from sungjuk
where uname like '%나%';

--문4) 두글자 이름에서 '화'로 끝나는 이름을 조회하시오
select uname
from sungjuk
where uname like '_화';

--문5) 이름 세글자 중에서 가운데 글자가 '나' 있는 행을 조회하시오
select uname
from sungjuk
where uname like '_나_';

--문6) 제목+내용을 선택하고 검색어가 '파스타'일때
select like, content
from sungjuk
where subject like '%파스타%' or content like '%파스타%';

select * from sungjuk;
--문7) 국어점수가 50점 이상인 행에 대해서 총점(tot)과 평균(aver)을 구하시오.

update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where kor>=50;

rollback;
commit;

[NULL] - 비어 있는 값

-- 총점의 갯수를 구하시오
select count(tot) from sungjuk; -- null값은 카운트 되지 않음.

-- 총점에 NULL이 있는 행의 갯수를 구하시오
select count(*) from sungjuk where tot = null; -- null 값 확인 못함
select count(*) from sungjuk where tot is null; -- null값 확인해야 하는 경우. 5

-- 평균에 비어이지 않는 행의 갯수를 구하시오 (NULL이 아닌 값)
select count(*)
from sungjuk
where aver is not null;

select * from sungjuk;
--문8) 비어있는 총점과 평균을 모두 구하시오.
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where tot is null or aver is null;

commit;

select * from sungjuk;