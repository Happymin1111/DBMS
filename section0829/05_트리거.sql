● 파일->새로만들기->데이터베이스계층->데이터베이스 파일
   ->파일명   : 05_트리거.sql
   ->저장위치 : E:\java202307\database\section0829
///////////////////////////////////////////////////////////////////////////

● 트리거 Trigger
    -방아쇠, 데이터베이스에서의 연쇄적인 동작을 정의함
    -insert, update, delete문이 실행될 때 묵시적으로 수행되는 프로시저
    
-- 콘솔창 출력 dbms_output.put_line을 사용함
set serveroutput on;
/////////////////////////////////////////////

--국어점수가 추가 수정 삭제가 되면 국어평균도 달라지며
--바뀐 국어평균 값을 출력한다.


create or replace trigger kor_trigger
after
    insert or update or delete on sungjuk
declare
    avg_kor number;
begin
    select avg(kor) into avg_kor from sungjuk;
    dbms_output.put_line('국어평균:' || avg_kor);
end;        

select * from sungjuk order by sno desc;

-- 행추가
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval, '이순신', 100, 100, 100, 'Seoul', sysdate); --국어평균 71.53

--행수정
update sungjuk set kor=0 where sno=41; --국어평균 63.84

--행삭제
delete from sungjuk where sno=11; --국어평균 65.625

commit;

