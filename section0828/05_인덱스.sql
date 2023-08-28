● 파일->새로만들기->데이터베이스계층->데이터베이스 파일
   ->파일명   : 05_인덱스.sql
   ->저장위치 : E:\java202307\database\section0828
///////////////////////////////////////////////////////////////////////////

● [인덱스 생성]
- 형식) create index 인덱스명 on 테이블명(칼럼명)

● [인덱스 삭제]
- 형식) drop index 인덱스명
///////////////////////////////////////////////////////////////

● [연습1] - PK가 없는 테이블
--테이블생성
create table emp2(
   id        number(5)    
  ,name     varchar2(25)
  ,salary   number(7, 2)
  ,phone    varchar2(15)
  ,dept_id  number(7)
);

--행추가 
insert into emp2(id,name) values (10,'kim');
insert into emp2(id,name) values (20,'park');
insert into emp2(id,name) values (30,'hong');
commit;

-- 인덱스 생성전
select * from emp2 where name='hong'; --커서 여기에 놓고 F10
--F10 계획설명 보기 -> full scan cost 2

-- 인덱스 생성후
create index emp2_name_idx on emp2(name);

select * from emp2 where name='kim'; -- 커서 여기에 놓고 F10
--F10 계획설명 보기 -> full scan cost 2 <= 전체 행 갯수가 많이 않아서 차이가 별로 없음.

-- 인덱스 삭제
drop index emp2_name_idx;
///////////////////////////////////////////////////////////////////////




● [연습2] - PK가 있는 테이블

--PK는 인덱스가 자동으로 생성되면서 정렬된다.
create table emp3 (
   no    number       primary key
  ,name varchar2(10)
  ,sal  number
);

select * from emp3 where no=3; -- 커서 여기에 놓고 F10
--F10 계획설명 보기 -> unique scan, cost 1
//////////////////////////////////////////////////////////////////////



● [연습3] 100만건의 행을 대상으로 cost 비교
create table emp4 (
   no    number       primary key
  ,name varchar2(10)
  ,sal  number
);

프로시저를 이용해서 100만행 추가하기 ######################################
declare  --선언문
    --변수선언
    i     number      := 1;      --i변수에 1 대입 := 연산자
    name  varchar(20) := 'kim';
    sal   number      := 0;
begin
-- T-SQL문
    while i<=1000000 loop
        if i mod 2 = 0 then
            name := 'kim'  || to_char(i);
            sal  := 300;
        elsif i mod 3 = 0 then
            name := 'park' || to_char(i);
            sal  := 400;
        elsif i mod 5 = 0 then
            name := 'hong' || to_char(i);
            sal  := 500;
        else
            name := 'shin' || to_char(i);
            sal  := 250;
        end if;
insert into emp4(no, name, sal) values (i, name, sal); --행추가
        i := i+1;
    end loop;
end;
#######################################################################

commit;
select count(*) from emp4;
select * from emp4;

--1)인덱스를 사용하지 않는 경우
select * from emp4 where name='kim466'; -- 실행하고 난 후 여기에 커서 놓고 F10 계획설명
                                        -- FULL scan, COST 907
select * from emp4 where no=466;        -- FULL scan, COST 905
select * from emp4 where sal>300;       -- FULL scan, COST 909

--2)인덱스를 사용한 경우

--name칼럼을 기준으로 인덱스 생성
create index emp4_name_idx on emp4(name);

select * from emp4 where name='kim466'; -- 실행하고 난 후 여기에 커서 놓고 F10계획설명
                                        -- RANGE SCAN, COST 3
                                        
--name칼럼과 sal칼럼을 기준으로 인덱스 생성
create index emp4_name_sal_idx on emp4(name,sal);
select * from emp4 where name='kim466' and sal>200;


-- 인덱스 데이터 사전
select * from user_indexes;
select * from user_indexes where index_name like 'EMP4%';