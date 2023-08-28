● 파일->새로만들기->데이터베이스계층->데이터베이스 파일
   ->파일명   : 04_성적프로시저.sql
   ->저장위치 : E:\java202307\database\section0828
///////////////////////////////////////////////////////////////////////////

● 참조 http://pretyimo.cafe24.com/lectureRead.do?lectureno=192

● sungjuk테이블에서 Create/Read/Update/Delete관련 프로시져

1)행추가 프로시저 (Create)
create or replace procedure sungjukInsert
(
    --매개변수(parameter) 선언
    --in 입력매개변수
    --sungjuk테이블의 uname칼럼과 동일한 타입으로 변수(v_uname)선언
    
    v_uname in sungjuk.uname%type
    ,v_kor in sungjuk.kor%type
    ,v_eng in sungjuk.eng%type
    ,v_mat in sungjuk.mat%type
    ,v_addr in sungjuk.addr%type

)
is
begin
    insert into sungjuk(sno,uname,kor,eng,mat,tot,aver,addr)
    values(sungjuk_seq.nextval, v_uname, v_kor,v_eng,v_mat,(v_kor+v_eng+v_mat), (v_kor+v_eng+v_mat)/3, v_addr);
    commit;
end;

--sungjukInsert 프로시저 실행





execute sungjukInsert('오필승',100, 99, 95, 'Seoul');

--결과확인
select * from sungjuk order by sno desc;

2)행수정 프로시저 (Update)
--문) sno=21 행을 아래 값으로
이름, 국, 영, 수, 주소, 총점, 평균을 수정하는 프로시저를 생성하시오
execute sungjukUpdate('코리아', 50,60,90,'Jeju', 23);

create or replace procedure sungjukupdate
(
 v_uname in sungjuk.uname%type
    ,v_kor in sungjuk.kor%type
    ,v_eng in sungjuk.eng%type
    ,v_mat in sungjuk.mat%type
    ,v_addr in sungjuk.addr%type
    ,v_sno  in sungjuk.addr%type
)
is
begin
    update sungjuk
    set uname=v_uname, kor=v_kor, eng=v_eng, mat=v_mat, tot=v_kor+v_eng+v_mat, aver=(v_kor+v_eng+v_mat)/3, addr=v_addr
    where sno=v_sno;
    commit;
end;    

select * from sungjuk order by sno desc;
///////////////////////////////////////////////////////////////////////////////////

3)행삭제 프로시저 (Delete)

execute sungjukdelete(12);
create or replace procedure sungjukdelete
(
    v_sno in sungjuk.sno%type
)
is
begin
    delete from sungjuk 
    where sno=v_sno;
    commit;
end;    

..


5)전체목록 (Read)
create or replace procedure sungjuklist
(
    v_cursor out sys_refcursor
)
is
    rec sungjuk%rowtype;
begin
    open v_cursor for
    select * from sungjuk order by sno desc;
    LOOP
        exit when v_cursor%NOTFOUND;
        dbms_output.put_line(rec.uname);
        dbms_output.put_line(rec.kor);
        dbms_output.put_line(rec.eng);
        dbms_output.put_line(rec.mat);
        dbms_output.put_line(rec.tot);
        dbms_output.put_line(rec.aver);
        dbms_output.put_line(rec.addr);
        dbms_output.put_line(rec.wdate);
    end LOOP;
end;