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

<--! 커뮤니티 TABLE-->
CREATE TABLE COMUNITY(
	post_no int not null AUTO_INCREMENT PRIMARY KEY,
	comunity_id char(1) not null DEFAULT 1,
	user_id varchar(20) not null,
	post_title varchar(50) not null,
	post_contact varchar(500) not null,
	post_date datetime not null DEFAULT NOW(),
	gdsThumbImg varchar(200),
    gdsImg varchar(200),
    hit int default 0
)
desc comunity;

<--! 팁 게시판 TABLE-->
CREATE TABLE TIP_COMUNITY(
    post_no int not null AUTO_INCREMENT PRIMARY KEY,
    comunity_id char(1) not null DEFAULT 2,
    user_id varchar(20) not null,
    post_title varchar(50) not null,
    post_contact varchar(500) not null,
    post_date datetime not null DEFAULT NOW(),
    gdsThumbImg varchar(200),
    gdsImg varchar(200),
    hit int default 0
)

desc tip_comunity
<--! 외래키 설정-->
alter table tip_COMUNITY add constraint ut_id foreign key(user_id) references USER(user_id) ON UPDATE CASCADE

<--! 댓글 TABLE-->
CREATE TABLE COMMENT(
	commnet_no int not null AUTO_INCREMENT PRIMARY KEY,
	comunity_id char(1) not null,
	user_id varchar(20) not null,
	post_no int not null ,
	comment_contact varchar(50) not null,
	comment_date datetime not null DEFAULT NOW()
)
select * from comment
<--! 외래키 설정-->
alter table COMMENT add constraint uco_id foreign key(user_id) references USER(user_id) ON UPDATE CASCADE
--alter table COMMENT add constraint uco_no foreign key(post_no) references COMUNITY(post_no) ON UPDATE CASCADE

desc comment

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


<--! 돌봄 헬퍼게시판 TABLE-->
CREATE TABLE CARE_COMUNITY(
    post_no int not null AUTO_INCREMENT PRIMARY KEY,
    comunity_id char(1) not null DEFAULT 3,
    user_id varchar(20) not null,
    post_title varchar(50) not null,
    post_contact varchar(500) not null,
    post_date datetime not null DEFAULT NOW(),
    gdsThumbImg varchar(200),
    gdsImg varchar(200),
    hit int default 0
)
<--! 외래키 설정-->
alter table care_COMUNITY add constraint ur_id foreign key(user_id) references USER(user_id) ON UPDATE CASCADE

select * from care_comunity

desc care_comunity

<--! 돌봄 시터게시판 TABLE-->
CREATE TABLE SITTER_COMUNITY(
    post_no int not null AUTO_INCREMENT PRIMARY KEY,
    comunity_id char(1) default 4,
    user_id varchar(20) not null,
    post_title varchar(50) not null,
    post_contact varchar(500) not null,
    post_date datetime not null DEFAULT NOW(),
    gdsThumbImg varchar(200),
    gdsImg varchar(200),
    hit int default 0
)

desc sitter_comunity
<--! 외래키 설정-->
alter table sitter_COMUNITY add constraint us_id foreign key(user_id) references USER(user_id) ON UPDATE CASCADE


<--! 분양게시판 TABLE-->
CREATE TABLE PARCEL_COMUNITY(
    post_no int not null AUTO_INCREMENT PRIMARY KEY,
    comunity_id char(1) default 5,
    user_id varchar(20) not null,
    post_title varchar(50) not null,
    post_contact varchar(500) not null,
    price int not null ,
    post_date datetime not null DEFAULT NOW(),
    gdsThumbImg varchar(200),
    gdsImg varchar(200),
    hit int default 0
)

select * from parcel_comunity

desc parcel_comunity
<--! 외래키 설정-->
alter table parcel_COMUNITY add constraint up_id foreign key(user_id) references USER(user_id) ON UPDATE CASCADE


-- 테스트 SQL 

select * from (
	select * from comunity c
	union all 
	select * from tip_comunity t
	union all
	select * from CARE_COMUNITY care
	union all
	select * from SITTER_COMUNITY sit
	union all
	select post_no,comunity_id,user_id,post_title,post_contact,post_date,gdsThumbImg,gdsImg,hit from PARCEL_COMUNITY par
	
) ta where ta.user_id = 'soldesk'
	
select * from comunity	
delete from comunity
delete from tip_comunity
delete from CARE_COMUNITY
delete from SITTER_COMUNITY
delete from PARCEL_COMUNITY

drop table comunity
drop table tip_comunity
drop table CARE_COMUNITY
drop table SITTER_COMUNITY
drop table PARCEL_COMUNITY
drop table comment
drop table enquiry
	
	
-- post_no,comunity_id,user_id,post_title,post_contact,post_date,gdsThumbImg,gdsImg,hit

ALTER TABLE 테이블명 MODIFY COLUMN 컬럼명 자료형 AFTER 다른컬럼;

