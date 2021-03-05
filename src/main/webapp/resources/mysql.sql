<--! 유저 TABLE-->
CREATE TABLE USER(
	user_id varchar(20) not null  PRIMARY KEY,
	user_passwd varchar(20) not null,
	user_name varchar(20) not null,
	user_birth date ,
	user_addr varchar(50) not null,
	user_phone char(11) not null,
	user_sex char(2) not null,
	user_email varchar(50) not null,
	user_date datetime not null DEFAULT NOW()
)

<--! 고객센터 TABLE-->
CREATE TABLE ENQUIRY(
	enquiry_no int not null AUTO_INCREMENT PRIMARY KEY,
	user_id varchar(20) not null,
	enquiry_title varchar(50) not null,
	enquiry_contact varchar(500) not null,
	enquiry_date datetime not null DEFAULT NOW()
)
<--! 외래키 설정-->
alter table ENQUIRY add constraint ue_id foreign key(user_id) references USER(user_id) ON UPDATE CASCADE

desc enquiry

<--! 커뮤니티 TABLE-->
CREATE TABLE COMUNITY(
	post_no int not null AUTO_INCREMENT PRIMARY KEY,
	comunity_id char(1) not null DEFAULT 1,
	user_id varchar(20) not null,
	post_title varchar(50) not null,
	post_contact varchar(500) not null,
	post_date datetime not null DEFAULT NOW()
)

alter table comunity add (gdsThumbImg varchar(200));
alter table comunity add (gdsImg varchar(200));
desc comunity;

<--! 팁 게시판 TABLE-->
CREATE TABLE TIP_COMUNITY(
    post_no int not null AUTO_INCREMENT PRIMARY KEY,
    comunity_id char(1) not null DEFAULT 2,
    user_id varchar(20) not null,
    post_title varchar(50) not null,
    post_contact varchar(500) not null,
    post_date datetime not null DEFAULT NOW()
)

alter table tip_comunity add(Hit int Default 0);
alter table tip_comunity add (gdsThumbImg varchar(200));
alter table tip_comunity add (gdsImg varchar(200));

desc tip_comunity
<--! 외래키 설정-->
alter table tip_COMUNITY add constraint ut_id foreign key(user_id) references USER(user_id) ON UPDATE CASCADE


alter table comunity add(Hit int Default 0);
<--! 외래키 설정-->
alter table COMUNITY add constraint uc_id foreign key(user_id) references USER(user_id) ON UPDATE CASCADE

<--! 댓글 TABLE-->
CREATE TABLE COMMENT(
	commnet_no int not null AUTO_INCREMENT PRIMARY KEY,
	user_id varchar(20) not null,
	post_no int not null ,
	comment_contact varchar(50) not null,
	comment_date datetime not null DEFAULT NOW()
)
<--! 외래키 설정-->
alter table COMMENT add constraint uco_id foreign key(user_id) references USER(user_id) ON UPDATE CASCADE
alter table COMMENT add constraint uco_no foreign key(post_no) references COMUNITY(post_no) ON UPDATE CASCADE


<--! 돌봄 헬퍼게시판 TABLE-->
CREATE TABLE CARE_COMUNITY(
    post_no int not null AUTO_INCREMENT PRIMARY KEY,
    user_id varchar(20) not null,
    post_title varchar(50) not null,
    post_contact varchar(500) not null,
    post_date datetime not null DEFAULT NOW()
)

alter table care_comunity add(Hit int Default 0);
alter table care_comunity add (gdsThumbImg varchar(200));
alter table care_comunity add (gdsImg varchar(200));

desc care_comunity
<--! 외래키 설정-->
alter table care_COMUNITY add constraint ur_id foreign key(user_id) references USER(user_id) ON UPDATE CASCADE

<--! 돌봄 시터게시판 TABLE-->
CREATE TABLE SITTER_COMUNITY(
    post_no int not null AUTO_INCREMENT PRIMARY KEY,
    user_id varchar(20) not null,
    post_title varchar(50) not null,
    post_contact varchar(500) not null,
    post_date datetime not null DEFAULT NOW()
)

alter table sitter_comunity add(Hit int Default 0);
alter table sitter_comunity add (gdsThumbImg varchar(200));
alter table sitter_comunity add (gdsImg varchar(200));

desc sitter_comunity
<--! 외래키 설정-->
alter table sitter_COMUNITY add constraint us_id foreign key(user_id) references USER(user_id) ON UPDATE CASCADE


<--! 데이터 입력,수정등등 시험 해본것 ㅎ..--!>
select * from user
select * from comunity
select * from TIP_COMUNITY
select * from comment
insert into user(user_id,user_passwd,user_name,user_birth,user_addr,user_phone,user_sex,user_email,user_date) values("leejaeho","passwd","name","1996-07-31","address","01012341234","1","email",NOW())
insert into comunity(user_id,post_title,post_contact,post_date) values("leejaeho","title","contact",NOW())
insert into comment(user_id,comment_contact) values("leejaeho","content")
drop table user
drop table comment
drop table comunity
drop table enquiry
drop table TIP_COMUNITY

insert into comunity (user_id, post_title,post_contact) values("leesemin","제목입니다.","내용입니다.");
insert into tip_comunity (user_id, post_title,post_contact) values("leesemin","제목입니다.","내용입니다.");

select user_id, user_passwd from user where user_id = 1 and user_passwd = 1;
select user_id , user_passwd from user where user_id = #{username} and user_passwd = #{password}

select * from user where user_id=1;
select * from user where user_id=#{user_id}

insert into user(user_id,user_passwd,user_name,user_birth,user_addr,user_phone,user_sex,user_email,user_date) 
values("leesemin","1234","이세민","1996-03-07","주소","01012341234","1","email",NOW())

select * from ENQUIRY

 select *
   from tip_comunity
   order by hit desc limit 5;
   
select * from comunity where user_id = 'test'  
select * from tip_comunity where user_id = 'test'
   
 select * from COMUNITY as c
 INNER JOIN TIP_COMUNITY as t
where c.user_id = t.user_id;

 select * from COMUNITY as c
 LEFT JOIN TIP_COMUNITY as t
on c.user_id = t.user_id
where c.user_id = t.user_id;


select * from COMUNITY as c 
FULL OUTER JOIN TIP_COMUNITY as t
ON c.user_id = t.user_id
WHERE c.user_id is null
OR t.user_id is null

select * from Comunity c
full outer join tip_comunity t
on c.user_id = t.user_id;

select * from comunity c
left join tip_comunity t
on c.user_id = 'test'
where c.user_id = 'test'

select * from (
	select * from comunity c
	union all 
	select * from tip_comunity t
) ta where ta.user_id = 'test'

select * from (
	select * from comunity c
	union all 
	select * from tip_comunity t
) ta where ta.user_id = 'leesemin'

	

 
 where COMUNITY.user_id = TIP_COMUNITY.user_id;