● 파일->새로만들기->데이터베이스계층->데이터베이스 파일
   ->파일명   : 06_function.sql
   ->저장위치 : E:\java202307\database\section0829
///////////////////////////////////////////////////////////////////////////

● function 함수

select * from sungjuk order by sno desc;

--연습) sno=41의 국어점수에 5점을 더하고 수정된 국어점수 반환하는 함수를 생성하시오.
create or replace function fn_update(v_sno number)
    return number -- 반환되는 자료형
is
    v_kor number;
begin
    update sungjuk set kor=kor+5 where sno=v_sno;
    select kor into v_kor from sungjuk where sno=v_sno;
    return v_kor; -- 인상된 국어점수 반환
end;

--위의 fn_update함수는 명령프롬프트에서 테스트 하세요.
돋보기 검색
-> cmd 명령프롬프트
-> sqlplus system/1234
SQL>var korea number;
SQL>execute :korea := fn_update(10);
SQL>print korea;

commit;