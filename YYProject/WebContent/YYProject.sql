create table member(
	name varchar2(100) not null,
	id varchar2(100) primary key,
	password varchar2(100) not null,
	email varchar2(100) not null,
	reg_date date default sysdate	/* default : sysdate값을 자동으로 넣어준다 -> dao insert에 기입할 필요 x */
);

create table food_board(
	bNum number primary key,
	bDate date default sysdate,
	bName varchar2(100) not null,
	bTel varchar2(100) not null,
	bTime varchar2(100) not null,
	bImg varchar2(1000) not null,
	bAdd1 varchar2(1000) not null,
	bAdd2 varchar2(1000) not null,
	bLocation varchar2(1000) not null,
	bKind varchar2(1000),
	bMenu1_Img varchar2(1000) not null,
	bMenu2_Img varchar2(1000) not null,
	bMenu3_Img varchar2(1000) not null,
	bMenu1_Detail varchar2(1000) not null,
	bMenu2_Detail varchar2(1000) not null,
	bMenu3_Detail varchar2(1000) not null,
	bInfo varchar2(1000) not null,
	bHash varchar2(1000) not null,
	bStar number not null
);

create table y_comment(
   cNum number primary key, /*댓글 번호로 불러와야 한다.*/
   cId varchar2(100) not null, /*작성자 아이디*/
   cContent varchar2(500) not null, /*게시글 내용*/
   cStar number not null,
   cReg_date date default sysdate, /*게시글 등록일*/
   cReg_flag number not null /*어느 게시글에 댓글이 달렸는지 알기위해서 */
);

create sequence fb_seq;	/* number에다 붙여줌 자동으로 0 ~ 숫자붙게 -> getNext()안 써도됨!! */
create sequence yc_seq;

select * from member;
select * from food_board;
select * from y_comment;

drop table member;
drop table food_board;
drop table y_comment;

delete member;
