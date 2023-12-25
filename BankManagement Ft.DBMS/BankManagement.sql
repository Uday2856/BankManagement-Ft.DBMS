create table branch(bid number(10),bname varchar2(20) primarykey,bcity varchar2(20),bassests number(10));
insert into branch values(&bid,'&bname','&bcity',&bassests);
commit;

create table account(acno number(10) primary key,acname varchar2(20),balance number(10),bname varchar2(20) references branch(bname));
insert into account values(&acno,'&acname',&balance,'&bname');
commit;

create table customer(cname varchar2(20)primary key,cstreet varchar2(20),ccity varchar2(20),cmob number(10));
insert into customer values('&cname','&cstreet','&ccity',&cmob);
commit;

create table depositer(cname varchar2(20) references customer(cname),acno number(10) references account(acno));
insert into depositer values('&cname',&acno);
commit;

create table loan(lno number(10),lamount number(10,2),bname varchar2(20) references branch(bname),primarykey(lno,lamount));
insert into loan values(&lno,&lamount,'&bname');
commit;

create table burrower(cname varchar2(20) references customer(cname),lno number(10) references loan(lno),lamount number(10,2) references loan(lamount));

insert into burrower values('&cname',&lno,&lamount);
commit;
