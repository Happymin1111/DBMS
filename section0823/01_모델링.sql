● 파일->새로만들기->데이터베이스계층->데이터베이스 파일
   ->파일명   : 01_모델링.sql
   ->저장위치 : E:\java202307\database\section0823
////////////////////////////////////////////////////////////////////////////////

※ 참조
  - [NCS 학습 모듈] - 데이터 입출력 구현
  - http://pretyimo.cafe24.com/lectureRead.do?lectureno=186
  
  
● [관계형 DB 모델링 연습]
  - 업무분석
  - ER-WIN : 관계형 DB 모델링을 도식화할 수 있는 프로그램
  
  
● [학사관리 업무분석]

  - 학생이 수강신청을 하고, 수강신청 과목 목록, 수강신청 과목의 총학점
  - 해당 과목을 수강신청한 학생 목록
  - 학생, 과목, 수강신청
  
  
  예) 다 : 다 (N:M) 관계    -> 반드시 교차테이블이 있어야 함
  
     학생 -------------- 과목
      1                  N
      N                  1
 
 
     학생 -----수강----- 과목 
     회원 -----예매----- 영화
     회원 -----구매----- 상품
      1   ---- N -----  1  
////////////////////////////////////////////////////////////////////////////////


● [개체 무결성]

  - 기본키에 속해 있는 속성은 NULL값을 가지지 못한다
  - 기본키는 레코드간에 유일한 식별자이므로 물리적으로 NULL값이 올 수 없다
  
  
  
● [참조 무결성 제약조건]

  - foreign key 제약조건
  - 동일한 테이블 또는 다른 테이블에서 기본키 또는 고유키를 참조하는 제약 조건
  - on delete cascade  부모테이블의 행이 삭제되는 경우 자식테이블의 종속행을 삭제
  - on delete set null 부모테이블의 행이 삭제되는 경우 종속 외래키 값을 null로 변환
  - 부모:Primary Key 기본키 <---> 자식:Foreign Key 외래키  

   예) 수강테이블 제약조건
    create table tb_sugang(
       sno    number(3)  not null
      ,hakno  char(5)    not null
      ,gcode  char(4)    not null
      ,primary key(sno)                                 --sno칼럼 기본키
      ,foreign key(hakno) references tb_student(hakno)  --hakno칼럼은 부모테이블(학생)의 hakno 참조
      ,foreign key(gcode) references tb_gwamok(gcode)   --gcode칼럼은 부모테이블(과목)의 gcode 참조
       on update cascade                                --부모테이블의 값이 수정되면 자식테이블 값도 같이 수정
       on delete no action                              --부모테이블의 행이 삭제되더라도 자식테이블은 삭제되지 않음
    );
