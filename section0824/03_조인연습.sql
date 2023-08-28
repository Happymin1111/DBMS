�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 03_���ο�������.sql
   ->������ġ : E:\java202307\database\section0824
///////////////////////////////////////////////////////////////////////////


�� [���̺� ���� ���� ����]

��1) ������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�.
select * from tb_sugang;

-- �������̺� + �л����̺�
select SU.*, UNAME, address
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno;

-- '����'�� ��ȸ�ϱ�
select SU.*, UNAME, address
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno
where address = '����';

-- ������ ���� ���̺��� �̸��� AA��� �����ϰ�, �ٽ� �簡���� �� �ִ�.
select AA.hakno, AA.gcode, AA.uname, AA.address
from(
        select SU.hakno, SU.gcode, UNAME, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
    ) AA;
    
-- ORA-00904: "AA"."EMAIL": �������� �ĺ���
-- ST���̺��� e-mailĮ���� �������� �ʾ���.
select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email
from(
        select SU.hakno, SU.gcode, UNAME, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
    ) AA;
    
select AA.hakno, AA.gcode, AA.uname, AA.address
from(
        select SU.hakno, SU.gcode, UNAME, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
    ) AA
where AA.address='����';

-- AA��Ī ��������
select hakno, gcode, uname, address
from(
        select SU.hakno, SU.gcode, UNAME, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
    )
where address='����';

-- AA���̺��� ��� Į��
select *
from(
        select SU.hakno, SU.gcode, UNAME, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
    )
where address='����';

/////////////////////////////////////////////////////////////////////////////////

����2 ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
        d001	HTML	2��
        d002	���伥	1��
        d003	�Ϸ���Ʈ	1��
        p001	JAVA	4��
        p002	Oracle	2��
        p003	JSP     2��
        p004	Python	1��
        p005	AJAX	1��

select GW.gname, count(*)    
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode
group by GW.gname;

select GW.gcode, GW.gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

select *
from (select GW.gcode, GW.gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode) AA;

��2) 
select * from tb_sugang order by gcode;

2)
select gcode, count(*)
from tb_sugang group by gcode;

3) 
select AA.gcode, GW.gname, concat(AA.cnt, '��')
from(select gcode, count(*) as cnt
from tb_sugang group by gcode) AA inner join tb_gwamok GW
on AA.gcode = GW.gcode
order by AA.gcode;
////////////////////////////////////////////////////////////////////////

��3) ������û�� �� �л����� �й�, �̸� ��ȸ
     g1001  ȫ�浿
     g1002  ȫ�浿
     g1005  ���޷�
     g1006  ������

��4)������û�� ���� ���� �л����� �й�, �̸� ��ȸ
     g1003  ������
     g1004  ȫ�浿
    

select ST.hakno,ST.uname
from tb_sugang SU inner join tb_student ST
on SU.hakno=ST.hakno
where gcode is not null;

select ST.hakno,ST.uname
from tb_sugang SU inner join tb_student ST
on SU.hakno=ST.hakno;
where gcode is not null;
     
 ��3) ������û�� �� �л����� �й�, �̸� ��ȸ
 g1001  ȫ�浿
 g1002  ȫ�浿
 g1005  ���޷�
 g1006  ������

--1)
select hakno from tb_sugang order by hakno;
select distinct hakno from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno;

--2)
select hakno, uname
from tb_student
where hakno='g1001' or hakno='g1002' or hakno='g1005' or hakno='g1006';

select hakno, uname
from tb_student
where hakno in ('g1001','g1002','g1005','g1006');

--3) 1)�� ����� �������� ���·� ��ȸ
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang group by hakno);

4)
select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang group by hakno);

/////////////////////////////////////////////////////////////////////////////////

��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python
     
     select hakno, GW.gcode, GW.gname
     from tb_sugang SU inner join tb_gwamok GW
     on SU.gcode = GW.gcode
     where hakno = 'g1001'
     order by GW.gcode;
     
-- 1) �й� g1001 ������û ���
select * from tb_sugang where hakno='g1001';

-- 2) �������̺� + �������̺� ����
select SU.hakno, SU.gcode, GW.gcode, GW.gname
from tb_sugang SU inner join tb_gwamok GW
on SU.gcode = GW.gcode;

-- 3) �й� g1001�� ��û�� ������ ��ȸ�ϱ�.
select SU.hakno, SU.gcode, GW.gcode, GW.gname
from tb_sugang SU inner join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno='g1001';

-- 4) �����ڵ庰 ���� �ϱ�.
select SU.hakno, SU.gcode, GW.gcode, GW.gname
from tb_sugang SU inner join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno='g1001'
order by SU.gcode;

-- 5) �ߺ��Ǵ� Į������ ��Ī �����ϱ�
select hakno, SU.gcode, GW.gcode, gname
from tb_sugang SU inner join tb_gwamok GW
on SU.gcode = GW.gcode
where hakno='g1001'
order by SU.gcode;



��6) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
        g1001	ȫ�浿	14����
        g1002	ȫ�浿	8����
        g1005	���޷�	12����
        g1006	������	3����
    
    select AA.hakno, ST.uname, concat(AA.ent, '����')
    from(    
        select hakno, sum(GW.ghakjum) as ent
        from tb_sugang SU JOIN tb_gwamok GW
        on SU.gcode=GW.gcode
        group by hakno) AA 
    inner join tb_student ST 
    on AA.hakno = ST.hakno;
    
    
SELECT HAKNO
    , (SELECT UNAME
         FROM TB_STUDENT ST
        WHERE ST.HAKNO = AA.HAKNO) AS UNAME
    , CONCAT(HAP, '����')           AS HAP
 FROM (
       SELECT SU.HAKNO, SUM(GW.GHAKJUM) AS HAP
         FROM TB_SUGANG SU
              JOIN TB_GWAMOK GW ON GW.GCODE = SU.GCODE
        GROUP BY SU.HAKNO
      ) AA;
       
��4)�� �� �ٸ� ���
--1) �������̺� + �л����̺� + �������̺� = 3�� ���̺� �Ѳ����� ����
select SU.hakno, SU.gcode, ST.uname, GW.ghakjum
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno inner join tb_gwamok GW
on SU.gcode = GW.gcode
order by SU.hakno;

--2) 1���׷�(�й�), 2���׷�(�̸�)���� �׷�ȭ�ϰ�, ������ ���ϱ�.
select SU.hakno, ST.uname, sum(GW.ghakjum) || '����' as hap
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno inner join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, ST.uname;
//////////////////////////////////////////////////////////////////////////


    
--1) �������̺��� �й����� ��ȸ
select hakno, gcode from tb_sugang order by hakno;

--2) �������̺� �����ڵ尡 ��ġ�ϴ� ������ �������̺��� �����ͼ� ���̱�
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;
        
--3) 2)�� ����� AA���̺�� �����,
select AA.hakno, sum(AA.ghakjum)
from (
        select SU.hakno, SU.gcode, GW.ghakjum
        from tb_sugang SU join tb_gwamok GW
        on SU.gcode=GW.gcode) AA
group by AA.hakno;

--3)�� ������� Į���� �ٽ� �ο��ϱ�
select AA.hakno, sum(AA.ghakjum) as hap
from (select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode) AA
group by AA.hakno;

--4) 3�� ����� BB ���̺�� �����,
select BB.hakno, ST.uname, concat(BB.hap, '����')
from(
        select AA.hakno, sum(AA.ghakjum) as hap
        from (select SU.hakno, SU.gcode, GW.ghakjum
        from tb_sugang SU join tb_gwamok GW
        on SU.gcode=GW.gcode) AA
        group by AA.hakno
        ) BB inner join tb_student ST
on BB.hakno = ST.hakno;

        
��7) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
     ���� 2��
     ���� 2��

select SU.hakno, concat(count(*),'��')
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
group by SU.hakno;

--1) �������̺� ��ȸ
select * from tb_sugang order by hakno;

--2) ���� ��û�� �л����� ��� ��ȸ (�й�)
select hakno from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno;
select hakno, count(*) from tb_sugang group by hakno;

--3) ������û�� �й�(AA)���� �ּҸ� �л����̺��� ��������
select AA.hakno, ST.address
from(
       select hakno from tb_sugang group by hakno
    ) AA inner join tb_student ST
on AA.hakno = ST.hakno;    

--4) 3)�� ����� BB���̺�� ���� ��, �ּҺ� ���� ��ȸ
select BB.address, count(*)
from(
        select AA.hakno, ST.address
        from(
               select hakno from tb_sugang group by hakno
            ) AA inner join tb_student ST
        on AA.hakno = ST.hakno  
    ) BB
group by BB.address;