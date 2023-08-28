�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 04_�������ν���.sql
   ->������ġ : E:\java202307\database\section0828
///////////////////////////////////////////////////////////////////////////

�� ���� http://pretyimo.cafe24.com/lectureRead.do?lectureno=192

�� sungjuk���̺��� Create/Read/Update/Delete���� ���ν���

1)���߰� ���ν��� (Create)
create or replace procedure sungjukInsert
(
    --�Ű�����(parameter) ����
    --in �Է¸Ű�����
    --sungjuk���̺��� unameĮ���� ������ Ÿ������ ����(v_uname)����
    
    v_uname in sungjuk.uname%type
    ,v_kor in sungjuk.kor%type
    ,v_eng in sungjuk.eng%type
    ,v_mat in sungjuk.mat%type
    ,v_addr in sungjuk.addr%type

)
is
begin
    insert into sungjuk(sno,uname,kor,eng,mat,tot,aver,addr)
    values(sungjuk_seq.nextval, v_uname, v_kor,v_eng,v_mat,(v_kor+v_eng+v_mat), (v_kor+v_eng+v_mat)/3, v_addr);
    commit;
end;

--sungjukInsert ���ν��� ����





execute sungjukInsert('���ʽ�',100, 99, 95, 'Seoul');

--���Ȯ��
select * from sungjuk order by sno desc;

2)����� ���ν��� (Update)
--��) sno=21 ���� �Ʒ� ������
�̸�, ��, ��, ��, �ּ�, ����, ����� �����ϴ� ���ν����� �����Ͻÿ�
execute sungjukUpdate('�ڸ���', 50,60,90,'Jeju', 23);

create or replace procedure sungjukupdate
(
 v_uname in sungjuk.uname%type
    ,v_kor in sungjuk.kor%type
    ,v_eng in sungjuk.eng%type
    ,v_mat in sungjuk.mat%type
    ,v_addr in sungjuk.addr%type
    ,v_sno  in sungjuk.addr%type
)
is
begin
    update sungjuk
    set uname=v_uname, kor=v_kor, eng=v_eng, mat=v_mat, tot=v_kor+v_eng+v_mat, aver=(v_kor+v_eng+v_mat)/3, addr=v_addr
    where sno=v_sno;
    commit;
end;    

select * from sungjuk order by sno desc;
///////////////////////////////////////////////////////////////////////////////////

3)����� ���ν��� (Delete)

execute sungjukdelete(12);
create or replace procedure sungjukdelete
(
    v_sno in sungjuk.sno%type
)
is
begin
    delete from sungjuk 
    where sno=v_sno;
    commit;
end;    

..


5)��ü��� (Read)
create or replace procedure sungjuklist
(
    v_cursor out sys_refcursor
)
is
    rec sungjuk%rowtype;
begin
    open v_cursor for
    select * from sungjuk order by sno desc;
    LOOP
        exit when v_cursor%NOTFOUND;
        dbms_output.put_line(rec.uname);
        dbms_output.put_line(rec.kor);
        dbms_output.put_line(rec.eng);
        dbms_output.put_line(rec.mat);
        dbms_output.put_line(rec.tot);
        dbms_output.put_line(rec.aver);
        dbms_output.put_line(rec.addr);
        dbms_output.put_line(rec.wdate);
    end LOOP;
end;