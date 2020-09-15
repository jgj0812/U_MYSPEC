-- 테이블
-- 관리자
CREATE TABLE admin (
admin_id VARCHAR2(20 CHAR) PRIMARY KEY,		-- 관리자 ID
admin_pwd VARCHAR2(20 CHAR)					-- 관리자 비밀번호
);

-- 개인회원
CREATE TABLE person_user (
person_id VARCHAR2(20 CHAR) PRIMARY KEY,	-- 개인회원 ID
person_pwd VARCHAR2(20 CHAR),				-- 개인회원 비밀번호
person_nick VARCHAR2(20 CHAR),				-- 개인회원 닉네임
person_birth DATE,							-- 생년월일
person_email VARCHAR2(200 CHAR),			-- 개인회원 이메일
person_phone VARCHAR2(20 CHAR)				-- 개인회원 연락처
);

-- 단체회원
CREATE TABLE org_user (
org_id VARCHAR2(20 CHAR) PRIMARY KEY,		-- 단체회원 ID
org_pwd VARCHAR2(20 CHAR),					-- 단체회원 비밀번호
org_name VARCHAR2(20 CHAR),					-- 기업이름
org_type NUMBER,							-- 기업형태
org_manager VARCHAR2(20 CHAR),				-- 담당자 이름
org_email VARCHAR2(200 CHAR),				-- 담당자 이메일
org_phone VARCHAR2(20 CHAR)					-- 담당자 연락처
);

-- 대외활동, 공모전
CREATE TABLE activity (
act_num NUMBER PRIMARY KEY,					-- 활동 글 번호
act_type NUMBER,							-- 활동종류 대외활동, 공모전
act_thumb VARCHAR2(200 CHAR),				-- 썸네일 이미지
act_post VARCHAR2(200 CHAR),				-- 포스터 이미지
act_title VARCHAR2(200 CHAR),				-- 활동 제목
act_hits NUMBER DEFAULT 0,					-- 조회수
act_org VARCHAR2(20 CHAR),					-- FK 단체회원 ID 
act_target VARCHAR2(20 CHAR),				-- 참여대상
act_start DATE,								-- 시작일
act_end DATE,								-- 종료일
act_pop NUMBER,								-- 모집인원
act_reg NUMBER,								-- 모임지역
act_field NUMBER,							-- 활동분야
act_home VARCHAR2(200 CHAR),				-- 홈페이지
act_content VARCHAR2(2000 CHAR),			-- 상세내용
act_award NUMBER,							-- 시상규모
act_approve NUMBER DEFAULT 0,				-- 승인여부
CONSTRAINT activity_fk1 FOREIGN KEY (act_org) REFERENCES org_user (org_id) ON DELETE CASCADE
);

-- 대외활동 관심분야
CREATE TABLE act_interest (
interest_act NUMBER,						-- 관심분야
interest_num NUMBER,						-- 값
CONSTRAINT act_interest_pk PRIMARY KEY (interest_act, interest_num),
CONSTRAINT act_interest_fk1 FOREIGN KEY (interest_act) REFERENCES activity (act_num) ON DELETE CASCADE
);

-- 대외활동, 공모전 활동혜택
CREATE TABLE act_reward (
reward_act NUMBER,							-- 활동혜택
reward_num NUMBER,							-- 값
CONSTRAINT reward_pk PRIMARY KEY (reward_act, reward_num),
CONSTRAINT reward_fk1 FOREIGN KEY (reward_act) REFERENCES activity (act_num) ON DELETE CASCADE
);

-- 대외활동 문의
CREATE TABLE act_reply (
rep_num NUMBER PRIMARY KEY,					-- 댓글 번호
rep_act NUMBER,								-- FK 활동 글번호
rep_person VARCHAR2(20 CHAR),				-- FK 개인회원 ID
rep_date DATE,								-- 댓글 작성일
rep_content VARCHAR2(200 CHAR),				-- 댓글 내용
rep_parent NUMBER,							-- 부모 댓글번호
rep_org VARCHAR2(20 CHAR),					-- FK 단체회원 ID
CONSTRAINT act_reply_fk1 FOREIGN KEY (rep_act) REFERENCES activity (act_num) ON DELETE CASCADE,
CONSTRAINT act_reply_fk2 FOREIGN KEY (rep_person) REFERENCES person_user (person_id) ON DELETE CASCADE,
CONSTRAINT act_reply_fk3 FOREIGN KEY (rep_org) REFERENCES org_user (org_id) ON DELETE CASCADE
);

-- 커뮤니티 게시판
CREATE TABLE community (
comm_num NUMBER PRIMARY KEY,				-- 글 번호
comm_type NUMBER,							-- 글 종류 공지사항 : 0, 일반글 : 1
comm_title VARCHAR2(200 CHAR),				-- 글 제목
comm_person VARCHAR2(20 CHAR),				-- FK 개인회원 ID
comm_date DATE,								-- 글 작성일
comm_hits NUMBER,							-- 조회수
comm_content VARCHAR2(2000 CHAR),			-- 글 내용
comm_admin VARCHAR2(20 CHAR),				-- FK 관리자 ID
CONSTRAINT community_fk1 FOREIGN KEY (comm_person) REFERENCES person_user (person_id) ON DELETE CASCADE,
CONSTRAINT community_fk2 FOREIGN KEY (comm_admin) REFERENCES admin (admin_id) ON DELETE CASCADE
);

-- 커뮤니티 게시판 댓글
CREATE TABLE comm_reply (
rep_num NUMBER PRIMARY KEY,					-- 댓글 번호
rep_comm NUMBER,							-- FK 글 번호
rep_person VARCHAR2(20 CHAR),				-- FK 개인회원 ID
rep_date DATE,								-- 댓글 작성일
rep_content VARCHAR2(200 CHAR),				-- 댓글 내용
rep_parent NUMBER,							-- 부모 댓글번호
rep_admin VARCHAR2(20 CHAR),				-- FK 관리자 ID
CONSTRAINT reply_fk1 FOREIGN KEY (rep_comm) REFERENCES community (comm_num) ON DELETE CASCADE,
CONSTRAINT reply_fk2 FOREIGN KEY (rep_person) REFERENCES person_user (person_id) ON DELETE CASCADE,
CONSTRAINT reply_fk3 FOREIGN KEY (rep_admin) REFERENCES admin (admin_id) ON DELETE CASCADE
);

-- 스크랩
CREATE TABLE scrap (
scrap_person VARCHAR2(20 CHAR),				-- 스크랩한 ID
scrap_num NUMBER,							-- 스크랩한 글번호
CONSTRAINT scrap_pk PRIMARY KEY (scrap_person, scrap_num),
CONSTRAINT scrap_fk1 FOREIGN KEY (scrap_person) REFERENCES person_user (person_id) ON DELETE CASCADE,
CONSTRAINT scrap_fk2 FOREIGN KEY (scrap_num) REFERENCES activity (act_num) ON DELETE CASCADE
);

-- 시퀀스
-- 대외활동, 공모전 시퀀스
CREATE SEQUENCE  "SCOTT"."ACT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
-- 커뮤니티 시퀀스
CREATE SEQUENCE  "SCOTT"."COMMUNITY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
-- 커뮤니티 댓글 시퀀스
CREATE SEQUENCE  "SCOTT"."COMM_REPLY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
-- 대외활동 문의 시퀀스
CREATE SEQUENCE  "SCOTT"."ACT_REPLY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE;