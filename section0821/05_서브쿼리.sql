�� ���� -> ���� ����� -> �����ͺ��̽����� -> �����ͺ��̽� ����
 -> ���ϸ� : 05_��������.sql
 -> ������ġ : E:\java202307\database\section0821
 //////////////////////////////////////////////////////////////
 
 �� [��������]
  - SQL �� �� �� �ٸ� SQL��
  - ���̺� ������ �ٽ� �ѹ� �������� ���� �� ��ȸ �� �˻�
  
-- ���������� ����� ��ȸ�Ͻÿ�.
select kor from sungjuk;
select round(avg(kor),0) from sungjuk; --66
select round(avg(kor),0) as avg_kor from sungjuk;

��1) �������� ���(66)���� ���� ���� ������ ��ȸ�Ͻÿ�.
select uname, kor
from sungjuk
where kor>=66;

select uname, kor
from sungjuk
where kor>=(select round(avg(kor),0) from sungjuk);

��2) ���������� �������� ��պ��� ���� ����, �̸�, ���������� ��ȸ�Ͻÿ�.
select addr, uname, kor
from sungjuk
where kor>=(select round(avg(kor),0) from sungjuk where addr='Seoul');

-- ���� ������ �������� ����� ���Ͻÿ�.
select kor from sungjuk where addr='Seoul';
select avg(kor) from sungjuk where addr='Seoul'; //72.5
select round(avg(kor),0) from sungjuk where addr='Seoul'; //73

select addr, uname, kor from sungjuk where kor>=73;

select addr, uname, kor 
from sungjuk 
where kor>=(select round(avg(kor),0) from sungjuk where addr='Seoul');

��3) ���������� �������� ��պ��� ���� ���������� �ٸ� ������ �ִ��� ��ȸ�Ͻÿ�.
-- ��2) ��������� ���������� �����Ͻÿ�.
select addr, uname, kor 
from sungjuk
where kor>=(select round(avg(kor),0) from sungjuk where addr='Seoul')
and addr<>'Seoul';

��4) ���������� �ּҰ����� ���� ������ ���� �Ǵ� ���� ������ �ִ��� ��ȸ�Ͻÿ�.
select uname, kor, mat, eng
from sungjuk
where mat<=(select min(kor) from sungjuk) or eng<=(select min(kor) from sungjuk);






