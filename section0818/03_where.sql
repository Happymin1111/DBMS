�� ���� -> ���� ����� -> �����ͺ��̽����� -> �����ͺ��̽� ����
 -> ���ϸ� : 03_where.sql
 -> ������ġ : E:\java202307\database\section0818
 //////////////////////////////////////////////////////////////
 
�� [between A and B] ������ - A���� B����
-- ���������� 80�� ~ 89�� ���� ���� ��ȸ �Ͻÿ�

select uname, kor
from sungjuk
where kor between 80 and 89;

�� [in] ������ - ��Ͽ��� ã��
-- �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname in ('����ȭ', '����ȭ');

-- �������� 10, 30, 50���� ��ȸ �Ͻÿ�
select uname, kor
from sungjuk
where kor in(10,30,50);

�� [LIKE ������]
 - ���ڿ� �����Ϳ��� ����� ������ �˻��Ҷ�
 - % ���ڰ����� �������
 - _ ���ڰ������� ��ġ�ؾ���.
 
 
select uname from sungjuk where uname='���ѹα�';
 --------------------------------------------------------------
--��1) �̸����� 'ȫ'���� �����ϴ� �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like 'ȫ%';

--��2) �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '%ȭ';

--��3) �̸��� '��'���� �ִ� �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '%��%';

--��4) �α��� �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '_ȭ';

--��5) �̸� ������ �߿��� ��� ���ڰ� '��' �ִ� ���� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '_��_';

--��6) ����+������ �����ϰ� �˻�� '�Ľ�Ÿ'�϶�
select like, content
from sungjuk
where subject like '%�Ľ�Ÿ%' or content like '%�Ľ�Ÿ%';

select * from sungjuk;
--��7) ���������� 50�� �̻��� �࿡ ���ؼ� ����(tot)�� ���(aver)�� ���Ͻÿ�.

update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where kor>=50;

rollback;
commit;

[NULL] - ��� �ִ� ��

-- ������ ������ ���Ͻÿ�
select count(tot) from sungjuk; -- null���� ī��Ʈ ���� ����.

-- ������ NULL�� �ִ� ���� ������ ���Ͻÿ�
select count(*) from sungjuk where tot = null; -- null �� Ȯ�� ����
select count(*) from sungjuk where tot is null; -- null�� Ȯ���ؾ� �ϴ� ���. 5

-- ��տ� ������� �ʴ� ���� ������ ���Ͻÿ� (NULL�� �ƴ� ��)
select count(*)
from sungjuk
where aver is not null;

select * from sungjuk;
--��8) ����ִ� ������ ����� ��� ���Ͻÿ�.
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where tot is null or aver is null;

commit;

select * from sungjuk;