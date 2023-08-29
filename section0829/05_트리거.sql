�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 05_Ʈ����.sql
   ->������ġ : E:\java202307\database\section0829
///////////////////////////////////////////////////////////////////////////

�� Ʈ���� Trigger
    -��Ƽ�, �����ͺ��̽������� �������� ������ ������
    -insert, update, delete���� ����� �� ���������� ����Ǵ� ���ν���
    
-- �ܼ�â ��� dbms_output.put_line�� �����
set serveroutput on;
/////////////////////////////////////////////

--���������� �߰� ���� ������ �Ǹ� ������յ� �޶�����
--�ٲ� ������� ���� ����Ѵ�.


create or replace trigger kor_trigger
after
    insert or update or delete on sungjuk
declare
    avg_kor number;
begin
    select avg(kor) into avg_kor from sungjuk;
    dbms_output.put_line('�������:' || avg_kor);
end;        

select * from sungjuk order by sno desc;

-- ���߰�
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval, '�̼���', 100, 100, 100, 'Seoul', sysdate); --������� 71.53

--�����
update sungjuk set kor=0 where sno=41; --������� 63.84

--�����
delete from sungjuk where sno=11; --������� 65.625

commit;

