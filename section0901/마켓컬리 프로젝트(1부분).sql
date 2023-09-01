/* ����� (����⼺��) */
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
/*�����ϴ� ���� ���̺� �����*/

create table qna (
     jno          number            not null
    ,jcate        varchar2(100)     not null
    ,jjemok       varchar2(100)     not null
) ;    

select * from qna;
drop table qna;

/*�����ϴ� ���� ��� �����*/
insert into qna(jno, jcate, jjemok)
values (185,'���/��ȯ/ȯ��','��ȯ(��ǰ)');

insert into qna(jno, jcate, jjemok)
values (184,'�����ϱ�','�����ϱ� �ֹ�');

insert into qna(jno, jcate, jjemok)
values (183,'����','������');

insert into qna(jno, jcate, jjemok)
values (182,'ȸ��','���̵�,��й�ȣ');

insert into qna(jno, jcate, jjemok)
values (181,'�̺�Ʈ/����/������','������ ����');

///////////////////////////////////////////////////////////////////////



/* ���� ���� ���̺� ����� */
create table coujong (
     cu_co         varchar2(4000)    primary key
    ,cu_hal        number(30)        not null
    ,cu_name       varchar2(100)     not null
    ,cu_sajo       varchar2(200)     not null
) ;    

select * from coujong;
drop table coujong;

/* ���� ���� ��� ����� */
insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo1', 5000, '5000�� ����', '�ջ�ݾ� 50000�� �̻� ����');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo2', 10000, '�ű԰���������', '�ű԰�');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo3', 3000, '�ø�����', '�ſ�1������');

insert into coujong(cu_co, cu_hal, cu_name, cu_sajo)
values ('coo4', 10000, 'ģ���ʴ� ����', 'ģ���ʴ�ID ����/ID ���');

////////////////////////////////////////////////////////////////////////




/*�ֹ��� ���̺� ����� */
create table jumun (
     orderid       varchar2(20)   
    ,id            varchar2(30)     /*�ܷ�Ű*/
    ,hap           int             not null
    ,cu_co         varchar2(4000)   /*�ܷ�Ű*/
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
/*�ֹ��� ��� ����� */
insert into jumun(orderid, id, hap, cu_co,reserves_id, jukrip, ju_hal, beasong, totfee, sudan)
values ('202308291718','a123',18000,'coo4','a123_point',0,10000,3000,11000,'ī��');

insert into jumun(orderid, id, hap, cu_co,reserves_id, jukrip, ju_hal, beasong, totfee, sudan)
values ('202308301053','b123',66800,'coo1','b123_point',200,5200,3000,0,'������ü');

//////////////////////////////////////////////////////////////////////////////

/* ����� insert �ϱ�.*/

////////////////////////////////////////////////////////////////////



