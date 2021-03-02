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
	user_id varchar(20) not null,
	post_title varchar(50) not null,
	post_contact varchar(500) not null,
	post_date datetime not null DEFAULT NOW()
)
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


<--! 데이터 입력,수정등등 시험 해본것 ㅎ..--!>
select * from user
select * from comunity
select * from comment
insert into user(user_id,user_passwd,user_name,user_birth,user_addr,user_phone,user_sex,user_email,user_date) values("leejaeho","passwd","name","1996-07-31","address","01012341234","1","email",NOW())
insert into comunity(user_id,post_title,post_contact,post_date) values("leejaeho","title","contact",NOW())
insert into comment(user_id,comment_contact) values("leejaeho","content")
drop table user
drop table comment
drop table comunity
drop table enquiry

select user_id, user_passwd from user where user_id = 1 and user_passwd = 1;
select user_id , user_passwd from user where user_id = #{username} and user_passwd = #{password}

select * from user where user_id=1;
select * from user where user_id=#{user_id}

insert into user(user_id,user_passwd,user_name,user_birth,user_addr,user_phone,user_sex,user_email,user_date) 
values("leesemin","1234","이세민","1996-03-07","주소","01012341234","1","email",NOW())

select * from ENQUIRY
