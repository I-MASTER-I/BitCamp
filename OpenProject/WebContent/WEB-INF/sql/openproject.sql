-- Member Table create
-- 2018.09.21
-- by 유영진

DROP TABLE member;

CREATE TABLE member (
    idx         NUMBER PRIMARY KEY,
    userid      VARCHAR2(20) NOT NULL UNIQUE, -- 영문 아이디, 중복 X
    password    VARCHAR2(16) NOT NULL,
    username    VARCHAR2(20) NOT NULL,
    userphoto   VARCHAR2(50) DEFAULT 'default.jpg',
    regdate     TIMESTAMP DEFAULT SYSDATE
);


-- DML : INSERT
INSERT INTO member (idx, USERID, PASSWORD, USERNAME )
VALUES (3, 'testers111', '1111', 'scott');

-- DML : UPDATE
UPDATE member
set password='', username=''
where idx = 1
;

-- DML : DELETE
DELETE FROM MEMBER 
WHERE IDX = 1
;

-- SELECT 
select * from member;





