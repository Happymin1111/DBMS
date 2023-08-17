● 파일 -> 새로 만들기 -> 데이터베이스계층 -> 데이터베이스 파일
 -> 파일명 : 20230817_03commit.sql
 -> 저장위치 : E:\java202307\database\section0817
 /////////////////////////////////////////////////////////
 
 * SQL Developer툴에서 자동커밋 설정해 놓을 수 있다.
  도구 -> 환경설정 -> 데이터베이스 -> 객체뷰어 -> 자동커밋설정
 
 [명령어 완료와 취소]
 - insert, update, delete 명령어를 사용하는 경우, 명령어 취소와 명령어 완료를 선택할 수 있다.
 - commit : 명령어 완료
 - rollback : 명령어 취소
 
 
 [전체 행 삭제]
 delete from sungjuk;
 
 [전체 행 조회]
 select * from sungjuk;
 
 commit;
 rollback;
 
 update sungjuk set tot=kor+eng+mat;
 update sungjuk set aver=(kor+eng+mat)/3;
 
 
 