CREATE TABLE admin (
admin_id VARCHAR2(20 CHAR) PRIMARY KEY,
admin_pwd VARCHAR2(20 CHAR)
);

CREATE TABLE person_user (
person_id VARCHAR2(20 CHAR) PRIMARY KEY,
person_pwd VARCHAR2(20 CHAR),
person_nick VARCHAR2(20 CHAR),
person_birth DATE,
person_email VARCHAR2(200 CHAR),
person_phone VARCHAR2(20 CHAR)
);

CREATE TABLE org_user (
org_id VARCHAR2(20 CHAR) PRIMARY KEY,
org_pwd VARCHAR2(20 CHAR),
org_name VARCHAR2(20 CHAR),
org_type NUMBER,
org_manager VARCHAR2(20 CHAR),
org_email VARCHAR2(200 CHAR),
org_phone VARCHAR2(20 CHAR)
);

CREATE TABLE activity (
act_num NUMBER PRIMARY KEY,
act_type NUMBER,
act_thumb VARCHAR2(200 CHAR),
act_post VARCHAR2(200 CHAR),
act_title VARCHAR2(200 CHAR),
act_hits NUMBER,
act_org VARCHAR2(20 CHAR),
act_target VARCHAR2(20 CHAR),
act_start DATE,
act_end DATE,
act_pop NUMBER,
act_reg NUMBER,
act_field NUMBER,
act_home VARCHAR2(200 CHAR),
act_content VARCHAR2(2000 CHAR),
act_award NUMBER,
act_approve NUMBER
CONSTRAINT activity_fk1 FOREIGN KEY (act_org) REFERENCES org_user (org_id)
);

CREATE TABLE act_interest (
interest_act NUMBER,
interest_num NUMBER,
CONSTRAINT interest_fk1 FOREIGN KEY (interest_act) REFERENCES activity (act_num)
);

CREATE TABLE act_reward (
reward_act NUMBER,
reward_num NUMBER,
CONSTRAINT reward_fk1 FOREIGN KEY (reward_act) REFERENCES activity (act_num)
);

CREATE TABLE act_reply (
rep_num NUMBER PRIMARY KEY,
rep_act NUMBER,
rep_person VARCHAR2(20 CHAR),
rep_date DATE,
rep_content VARCHAR2(200 CHAR),
rep_step NUMBER,
rep_ref NUMBER,
rep_level NUMBER,
CONSTRAINT act_reply_fk1 FOREIGN KEY (rep_act) REFERENCES activity (act_num) ON DELETE CASCADE,
CONSTRAINT act_reply_fk2 FOREIGN KEY (rep_person) REFERENCES person_user (person_id)
);

CREATE TABLE community (
comm_num VARCHAR2(20 CHAR) PRIMARY KEY,
comm_type NUMBER,
comm_title VARCHAR2(200 CHAR),
comm_person VARCHAR2(20 CHAR),
comm_date DATE,
comm_hits NUMBER,
comm_content VARCHAR2(2000 CHAR),
comm_admin VARCHAR2(20 CHAR),
CONSTRAINT community_fk1 FOREIGN KEY (comm_person) REFERENCES person_user (person_id),
CONSTRAINT community_fk2 FOREIGN KEY (comm_admin) REFERENCES admin (admin_id)
);

CREATE TABLE comm_reply (
rep_num NUMBER PRIMARY KEY,
rep_comm NUMBER,
rep_person VARCHAR2(20 CHAR),
rep_date DATE,
rep_content VARCHAR2(200 CHAR),
rep_step NUMBER,
rep_ref NUMBER,
rep_level NUMBER,
rep_admin VARCHAR2(20 CHAR),
CONSTRAINT reply_fk1 FOREIGN KEY (rep_comm) REFERENCES community (comm_num) ON DELETE CASCADE,
CONSTRAINT reply_fk2 FOREIGN KEY (rep_person) REFERENCES person_user (person_id),
CONSTRAINT reply_fk3 FRREIGN KEY (rep_admin) REFERENCES admin (admin_id)
);
