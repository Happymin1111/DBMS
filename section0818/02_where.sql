[sungjuk 테이블 삭제]
 drop table sungjuk;
 
 [sungjuk 테이블 생성]
 create table sungjuk (
    uname varchar(50) not null -- 빈 값을 허용하지 않는다!
                               -- 영문자 50글자 이내에서 입력
                               -- 한글 16글자 이내 입력 (제약조건)
    ,kor  int        not null
    ,eng  int        not null
    ,mat  int        not null
    ,tot  int            null  -- 빈값 허용
    ,aver int                  -- null은 생략가능
 );
 //////////////////////////////////////////////////////////
 
[샘플 데이터 행추가]
insert into sungjuk(uname,kor,eng,mat) values ('홍길동', 70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('무궁화',30,30,40);
insert into sungjuk(uname,kor,eng,mat) values ('진달래',90,90,20);
insert into sungjuk(uname,kor,eng,mat) values ('개나리',100,60,30);
insert into sungjuk(uname,kor,eng,mat) values ('라일락',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('봉선화',80,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',10,65,35);
insert into sungjuk(uname,kor,eng,mat) values ('해바라기',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('나팔꽃',30,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',100,100,100);
commit;
//////////////////////////////////////////////////////////////////////////////

select * from sungjuk;

[where 조건절]
-조건을 만족하는 행들에 대해서
-조건을 만족하는 레코드만 대상으로 조회(select), 수정(update), 삭제(delete) 하기 위해서
--문1) 국어점수가 50점이상 행을 조회하시오  

select uname, kor
from sungjuk
where kor>=50;


--문2) 영어점수가 50점미만 행을 조회하시오  
select uname, eng
from sungjuk
where eng<50;
  
--문3) 이름이 '대한민국' 행을 조회(출력)하시오
select uname,kor,eng,mat
from sungjuk
where uname='대한민국'

--문4) 이름이 '대한민국' 아닌 행을 조회하시오
select uname,kor,eng,mat
from sungjuk
where uname!='대한민국' --좌우가 서로 같지 않다.

select uname,kor,eng,mat
from sungjuk
where uname<>'대한민국' --좌우가 서로 같지 않다.

--문5) 국어, 영어, 수학 세과목의 점수가 모두 90이상 행을 조회하시오
select uname,kor,eng,mat
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

--문6) 국어, 영어, 수학 중에서 한과목이라도 40미만 행을 조회하시오
select uname,kor,eng,mat
from sungjuk
where kor<40 or eng<40 or mat<40;

--문7) 국어점수가 80 ~ 89점 사이 행을 조회하시오
select uname,kor
from sungjuk
where kor>=80 and kor<=89


--문8) 이름이 '무궁화', '봉선화'를 조회하시오
select uname, kor, eng, mat
from sungjuk
where uname='무궁화' or uname='봉선화'


--문9) 국, 영, 수 모두 100점 아닌 행을 조회하시오
select uname,kor,eng,mat
from sungjuk
where not(kor=100 and eng=100 and mat=100);