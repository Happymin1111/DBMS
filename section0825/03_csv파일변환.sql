�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 03_csv���Ϻ�ȯ.sql
   ->������ġ : E:\java202307\database\section0825
///////////////////////////////////////////////////////////////////////////

�� [CSV ����]
   - ��� �����Ͱ� ,�� ���еǾ� �ִ� ����
   
�� [CSV ������ �����ͺ��̽��� ��������]
   - �������������� http://data.go.kr/ Ȱ��

��1) ���θ� �����ȣ ���̺� �����ϱ�..


--1) zipdoro.csv �غ� (258267��)

--2)zipdoro.csv ������ �����ϴ� zipdoro ���̺� ����
create table zipdoro (
    zipno           char(5)--�����ȣ
    ,zipaddress     varchar2(4000)--�ּ�
);

drop table zipdoro; --���̺� ����

--3) -zipdoro ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
     -zipdoro ���̺� ��Ŭ�� -> export      (��������)
     
--4)��ü �� ���� ��ȸ�ϱ�
select count(*) from zipdoro;

��2) �ѱ����� ���ߵ��б���ġ.csv�� ��ȯ�ؼ� ���̺� �����Ͻÿ�. (11873��)

create table korsch (
    schcode       varchar2(40) -- �б�ID
    ,schname       varchar2(100) -- �б��̸�
    ,schclass      varchar2(100) -- �б��ޱ���
    ,schaddress    varchar2(100) -- �б��ּ�
    ,schcreate     DATE    -- ��������
    ,schalter      DATE    -- ��������
    ,schwedo       number(20,10)   -- ����
    ,schkyeong     number(20,10)   -- �浵
);
drop table korsch;

select * from korsch;

--����1) ����ִ� ��(null)�� ã���ÿ�

--����2) �� �õ��� �ʵ��б�, ���б� ������ ���Ͻÿ�

from korsch
g
