�� ���� -> ���� ����� -> �����ͺ��̽����� -> �����ͺ��̽� ����
 -> ���ϸ� : 01_nvl�Լ�.sql
 -> ������ġ : E:\java202307\database\section0822
 //////////////////////////////////////////////////////////////
 
  �� ���� http://pretyimo.cafe24.com/lectureRead.do?lectureno=185


�� nvl() �Լ� - null ���� �ٸ� ������ �ٲ�  

����) �ּҰ� 'Incheon'�� ���� �������� �ִ�,�ο����� ��ȸ�Ͻÿ�
 select max(kor),count(*)
 from sungjuk
 where addr='Incheon';           --�ִ밪 (null), �ο���(0)
  
 select count(*)+1               --0+1
 from sungjuk
 where addr='Incheon'; 
 
 select max(kor)+1               --null+1  -> null���� ������ �� ����.
 from sungjuk
 where addr='Incheon';
 
 --null ���̸� 0���� ��ü��
 select nvl(max(kor),0)
 from sungjuk
 where addr='Incheon';
 
select nvl(max(kor),0)+1 as MAX_KOR
 from sungjuk
 where addr='Incheon';
 ///////////////////////////////////////////////////////////////////////////
 
 
 
 
select * from sungjuk order by sno desc;

����) sungjuk���̺� �Ʒ� �����͸� ���߰� �Ͻÿ�.

sno : max(sno) + 1;
     �� max()�� null �̸� 0���� �ٲ��� ����Ѵ�.
     
--insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
--values (nvl(max(sno)+1,0),'�����',100,100,100,'Seoul',sysdate);

--1) snoĮ������ ���� ū�� ��������.
select max(sno) from sungjuk;

--2) ���� 1)����� null�� ������ 0���� �ٲٱ�
select nvl(max(sno),0) from sungjuk;

--3) 2)����� +1 �����ϱ�
select nvl(max(sno),0)+1 from sungjuk;

--4) ���߰�
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values((select nvl(max(sno),0)+1 from sungjuk),'�����',100,100,100,'Seoul',sysdate );

select * from sungjuk order by sno desc;
commit;