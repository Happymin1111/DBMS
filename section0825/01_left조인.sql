�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 01_left����.sql
   ->������ġ : E:\java202307\database\section0825
///////////////////////////////////////////////////////////////////////////

�� [left join �� right join]

-- �л����̺��� ��� ���� ��������, �������̺��� �й��� ��ġ�ϴ� �ุ ��������.
select ST.*,SU.*
from tb_student ST left join tb_sugang SU
on ST.hakno = SU.hakno;

01)left join�� �̿��ؼ� ������û�� ���� �ʴ� �й� �̸� �����ڵ带 ��ȸ�Ͻÿ�
select ST.hakno,uname,gcode
from tb_student ST left join tb_sugang SU
on ST.hakno = SU.hakno
where sno is null;

02)right join�� �̿��ؼ� ������û�� ���� �ʴ� �й� �̸� �������� ��ȸ�Ͻÿ�.
select ST.hakno,uname,gcode
from tb_sugang SU right join tb_student ST
on SU.hakno = ST.hakno
where sno is null;

�� [ (+)��ȣ�� �̿��� ���̺� ���� ] 
   (+)��ȣ�� ��ġ���� �ʴ� ���� �����ϴ� ���� �ʿ� ���δ�
   
select ST.hakno, ST.uname, SU.gcode, SU.hakno
from tb_student ST, tb_sugang SU
where ST.hakno=SU.hakno(+);    --left join

select SU.hakno, SU.gcode, ST.uname, ST.hakno
from tb_sugang SU, tb_student ST
where SU.hakno(+)=ST.hakno;  --right join