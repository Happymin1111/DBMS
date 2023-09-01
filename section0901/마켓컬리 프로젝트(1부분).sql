/* 멤버십 (만들기성공) */
create table membership (
     id           varchar2(30)      primary key
    ,password     varchar2(256)     not null
    ,email        varchar2(256)     not null
    ,birth        date              not null
    ,fm           varchar2(10)      not null
    ,phone        varchar2(12)      not null
    ,adnumber     int               not null
    ,address      varchar2(4000)    not null
    ,adadd        varchar2(4000)    not null
    ,wdate        date              not null
    ,friendID     varchar2(30)
) ;    

select * from membership;
drop table membership;
/*자주하는 질문 테이블 만들기*/

create table qna (
     jno          number            not null
    ,jcate        varchar2(100)     not null
    ,jjemok       varchar2(100)     not null
) ;    

select * from qna;
drop table qna;

/*자주하는 질문 목록 만들기*/
insert into qna(jno, jcate, jjemok)
values (185,'취소/교환/환불','교환(반품)');

insert into qna(jno, jcate, jjemok)
values (184,'선물하기','선물하기 주문');

insert into qna(jno, jcate, jjemok)
values (183,'포장','포장재');

insert into qna(jno, jcate, jjemok)
values (182,'회원','아이디,비밀번호');

insert into qna(jno, jcate, jjemok)
values (181,'이벤트/쿠폰/적립금','적립금 언제');

///////////////////////////////////////////////////////////////////////



/* 쿠폰 종류 테이블 만들기 */
create table coujong (
     cu_co         varchar2(4000)    primary key
    ,cu_hal        number(30)        not null
    ,cu_name       varchar2(100)     not null
    ,cu_sajo       varchar2(200)     not null
) ;    

select * from coujong;
drop table coujong;

/* 쿠폰 종류 목록 만들기 */
insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo1', 5000, '5000원 할인', '합산금액 50000원 이상 구매');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo2', 10000, '신규고객전용쿠폰', '신규고객');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo3', 3000, '컬리데이', '매월1일지급');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo4', 10000, '친구초대 할인', '친구초대ID 기재/ID 언급');

////////////////////////////////////////////////////////////////////////




/*주문서 테이블 만들기 */
create table jumun (
     orderid       varchar2(20)   
    ,id            varchar2(30)     /*외래키*/
    ,hap           int             not null
    ,cu_co         varchar2(4000)   /*외래키*/
    ,reserves_id   varchar2(100)   
    ,jukrip        int             not null
    ,ju_hal        int             not null
    ,beasong       int             not null
    ,totfee        number          not null
    ,sudan         varchar2(100)   not null
    ,constraint jumun_PK primary key(orderid, reserves_id)
    ,constraint jumun foreign key(cu_co) references coujong(cu_co)
    on delete cascade
    ,constraint jumun2 foreign key(id) references membership(id) 
    on delete cascade
);    

select * from jumun;
drop table jumun;
/*주문서 목록 만들기 */
insert into jumun(orderid, id, hap, cu_co,reserves_id, jukrip, ju_hal, beasong, totfee, sudan)
values ('202308291718','a123',18000,'coo4','a123_point',0,10000,3000,11000,'카드');

insert into jumun(orderid, id, hap, cu_co,reserves_id, jukrip, ju_hal, beasong, totfee, sudan)
values ('202308301053','b123',66800,'coo1','b123_point',200,5200,3000,0,'계좌이체');

//////////////////////////////////////////////////////////////////////////////

/* 멤버시 insert 하기.*/

////////////////////////////////////////////////////////////////////



