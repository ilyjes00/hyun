--1.회원가입 테이블
CREATE TABLE mbsp_tbl(
        mbsp_id             VARCHAR2(15),
        mbsp_name           VARCHAR2(30)            NOT NULL,
        mbsp_email          VARCHAR2(50)            NOT NULL,
        mbsp_password       CHAR(60)               NOT NULL,        -- 비밀번호 암호화 처리.
        mbsp_zipcode        CHAR(5)                 NOT NULL,
        mbsp_addr           VARCHAR2(100)            NOT NULL,
        mbsp_deaddr         VARCHAR2(100)            NOT NULL,
        mbsp_phone          VARCHAR2(15)            NOT NULL,
        mbsp_point          NUMBER DEFAULT 0        NOT NULL,
        mbsp_lastlogin      DATE DEFAULT sysdate    NOT NULL,
        mbsp_datesub        DATE DEFAULT sysdate    NOT NULL,
        mbsp_updatedate     DATE DEFAULT sysdate    NOT NULL
);

--실행
ALTER TABLE MBSP_TBL
ADD CONSTRAINT PK_MBSP_ID PRIMARY KEY (MBSP_ID);



--아이디 중복체크
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = 'user01';

commit;

INSERT iNTO MBSP_TBL(MBSP_ID, MBSP_NAME, MBSP_EMAIL, MBSP_PHONE, MBSP_ADDR, MBSP_ZIPCODE, MBSP_PASSWORD, MBSP_DEADDR)
VALUES();
        
    SELECT * FROM MBSP_TBL WHERE MBSP_ID = 'user01';
    
    
    MBSP_DEADDR, MBSP_ID, MBSP_EMAIL, MBSP_NAME, MBSP_PHONE, MBSP_ADDR, MBSP_ZIPCODE, MBSP_PASSWORD, MBSP_LASTLOGIN, MBSP_POINT, MBSP_DATESUB, MBSP_UPDATEDATE
    
    
    
    --2.카테고리 테이블

DROP TABLE CATEGORY_TBL;
CREATE TABLE CATEGORY_TBL(
        CGT_CODE            NUMBER    PRIMARY KEY,    -- 카테고리 코드
        CGT_PARENT_CODE         NUMBER    NULL,           -- 상위카테고리 코드
        CGT_NAME            VARCHAR2(50)    NOT NULL,
        FOREIGN KEY(CGT_PARENT_CODE) REFERENCES CATEGORY_TBL(CGT_CODE)
);

-- / -> /

-- 1차 카테고리 : 애플(1) 삼성(2) 구글(3)
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (1,NULL,'애플');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (2,NULL,'삼성');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (3,NULL,'구글');    
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (50,NULL,'커스텀');    
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (50,NULL,'기타');    

-- 1차카테고리 애플 : 1
-- 2차 카테고리 : 아이폰15전체 아이폰14전체 아이폰13전체 에어팟 아이패드 맥북 애플워치 애플악세서리/
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (4,1,'아이폰15 Pro');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (5,1,'아이폰15 Pro Max');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME)  
VALUES (6,1,'아이폰15 Pro Plus');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (7,1,'아이폰15');


INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (8,1,'아이폰14 Pro');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (9,1,'아이폰14 Pro Max');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (10,1,'아이폰14 Pro Plus');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (11,1,'아이폰14');


INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (12,1,'아이폰13 Pro');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (13,1,'아이폰13 Pro Max');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (14,1,'아이폰13');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (15,1,'아이폰13 Mini');

INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (16,1,'에어팟 Pro 2세대');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (17,1,'에어팟 Pro 1세대');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (18,1,'에어팟 3세대');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (19,1,'에어팟 2세대');

/* 아이패드 10.9" (10세대)
아이패드 Air (4세대/5세대)
아이패드 Mini (6세대)
아이패드 Pro 12.9" (5세대/6세대)
아이패드 Pro 11" (3세대/4세대)
아이패드 Pro 11" (1세대)
*/

INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (20,1,'아이패드 10.9" (10세대)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (21,1,'아이패드 Air (4세대/5세대)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (22,1,'아이패드 Mini (6세대)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (23,1,'아이패드 Pro 12.9" (5세대/6세대)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (24,1,'아이패드 Pro 11" (3세대/4세대)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (25,1,'아이패드 Pro 11" (1세대)');

/*
맥북
맥북 Air 15인치 (2023)
맥북 Pro 14인치 (2021 / 2023)
맥북 Pro 16인치 (2021 / 2023)
맥북 Air 13.6인치 (2022)
맥북 Air 13인치 (2018 - 2020)
맥북 Air 13인치 (2010 - 2017)
맥북 Pro 13인치 (2020 / 2022)
맥북 Pro 13인치 (2016 - 2019)
맥북 Pro 15인치 (2016 - 2019)
맥북 Pro 16인치 (2019)
모든 맥북 케이스
*/

INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (26,1,'맥북 Air 15인치 (2023)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (27,1,'맥북 Pro 14인치 (2021 / 2023)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (28,1,'맥북 Pro 16인치 (2021 / 2023)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (29,1,'맥북 Air 13.6인치 (2022)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (30,1,'맥북 Air 13인치 (2018 - 2020)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (31,1,'맥북 Air 13인치 (2010 - 2017)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (32,1,'맥북 Pro 13인치 (2020 / 2022)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (33,1,'맥북 Pro 13인치 (2016 - 2019)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (34,1,'맥북 Pro 15인치 (2016 - 2019)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (35,1,'맥북 Pro 16인치 (2019)');

/*
38 / 40 / 41mm
42 / 44 / 45 / 49mm
애플 워치 케이스
*/
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (36,1,'38 / 40 / 41mm');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (37,1,'42 / 44 / 45 / 49mm');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME)  
VALUES (38,1,'애플 워치 케이스');

/*
애플 액세서리
에어태그 케이스
맥세이프 카드 지갑
맥세이프 배터리 팩 케이스
*/
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (39,1,'에어태그 케이스');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (40,1,'맥세이프 카드 지갑');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME)  
VALUES (41,1,'맥세이프 배터리 팩 케이스');


-- 1차카테고리 삼성 : 2
-- 2차카테고리 : 갤럭시S23전체 갤럭시S22전체 갤럭시S21전체 갤럭시Z시리즈전체 갤럭시버즈전체
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (12,2,'갤럭시S23전체');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (13,2,'갤럭시S22전체');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (14,2,'갤럭시S21전체');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (15,2,'갤럭시Z시리즈전체');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME)   
    VALUES (16,2,'갤럭시버즈전체');
    
-- 1차카테고리 구글 : 3
-- 2차카테고리 : Pixel 8전체/Pixel 7전체/Pixel 6전체 /모든Pixel 케이스

INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (17,3,'Pixel 8전체');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (18,3,'Pixel 7전체');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (19,3,'Pixel 6전체');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (20,3,'모든Pixel 케이스');
    
    
    
    
    

commit;

CREATE TABLE PRODUCT_TBL(
        PROD_NUM             NUMBER  CONSTRAINT  PK_PROD_NUM         PRIMARY KEY,
        CGT_CODE            NUMBER            NULL,
        PROD_NAME            VARCHAR2(50)            NOT NULL,
        PROD_PRICE           NUMBER                  NOT NULL,
        PROD_DISCOUNT        NUMBER                  NOT NULL,
        PROD_PUBLISHER       VARCHAR2(50)            NOT NULL,
        PROD_CONTENT         VARCHAR2(4000)  /* CLOB */                  NOT NULL,       -- 내용이 4000BYTE 초과여부판단?
        PROD_UP_FOLDER       VARCHAR2(50)             NOT NULL,
        PROD_IMG             VARCHAR2(50)             NOT NULL,  -- 날짜폴더경로가 포함하여 파일이름저장
        PROD_AMOUNT          NUMBER                  NOT NULL,
        PROD_BUY             CHAR(1)                 NOT NULL,
        PROD_DATE            DATE DEFAULT SYSDATE    NOT NULL,
        PROD_UPDATEDATE      DATE DEFAULT SYSDATE    NOT NULL,
        FOREIGN KEY(CGT_CODE) REFERENCES CATEGORY_TBL(CGT_CODE)
);


--pro_img, cg_code, pro_publisher, pro_price, pro_name, pro_num, pro_up_folder, pro_discount, pro_content, pro_buy, pro_amount, pro_date, pro_updatedate

cg_code,cg_parent_code,cg_name


INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (1,NULL,'TOP');