--1.ȸ������ ���̺�
CREATE TABLE mbsp_tbl(
        mbsp_id             VARCHAR2(15),
        mbsp_name           VARCHAR2(30)            NOT NULL,
        mbsp_email          VARCHAR2(50)            NOT NULL,
        mbsp_password       CHAR(60)               NOT NULL,        -- ��й�ȣ ��ȣȭ ó��.
        mbsp_zipcode        CHAR(5)                 NOT NULL,
        mbsp_addr           VARCHAR2(100)            NOT NULL,
        mbsp_deaddr         VARCHAR2(100)            NOT NULL,
        mbsp_phone          VARCHAR2(15)            NOT NULL,
        mbsp_point          NUMBER DEFAULT 0        NOT NULL,
        mbsp_lastlogin      DATE DEFAULT sysdate    NOT NULL,
        mbsp_datesub        DATE DEFAULT sysdate    NOT NULL,
        mbsp_updatedate     DATE DEFAULT sysdate    NOT NULL
);

--����
ALTER TABLE MBSP_TBL
ADD CONSTRAINT PK_MBSP_ID PRIMARY KEY (MBSP_ID);



--���̵� �ߺ�üũ
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = 'user01';

commit;

INSERT iNTO MBSP_TBL(MBSP_ID, MBSP_NAME, MBSP_EMAIL, MBSP_PHONE, MBSP_ADDR, MBSP_ZIPCODE, MBSP_PASSWORD, MBSP_DEADDR)
VALUES();
        
    SELECT * FROM MBSP_TBL WHERE MBSP_ID = 'user01';
    
    
    MBSP_DEADDR, MBSP_ID, MBSP_EMAIL, MBSP_NAME, MBSP_PHONE, MBSP_ADDR, MBSP_ZIPCODE, MBSP_PASSWORD, MBSP_LASTLOGIN, MBSP_POINT, MBSP_DATESUB, MBSP_UPDATEDATE
    
    
    
    --2.ī�װ� ���̺�

DROP TABLE CATEGORY_TBL;
CREATE TABLE CATEGORY_TBL(
        CGT_CODE            NUMBER    PRIMARY KEY,    -- ī�װ� �ڵ�
        CGT_PARENT_CODE         NUMBER    NULL,           -- ����ī�װ� �ڵ�
        CGT_NAME            VARCHAR2(50)    NOT NULL,
        FOREIGN KEY(CGT_PARENT_CODE) REFERENCES CATEGORY_TBL(CGT_CODE)
);

-- / -> /

-- 1�� ī�װ� : ����(1) �Ｚ(2) ����(3)
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (1,NULL,'����');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (2,NULL,'�Ｚ');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (3,NULL,'����');    
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (50,NULL,'Ŀ����');    
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (50,NULL,'��Ÿ');    

-- 1��ī�װ� ���� : 1
-- 2�� ī�װ� : ������15��ü ������14��ü ������13��ü ������ �����е� �ƺ� ���ÿ�ġ ���þǼ�����/
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (4,1,'������15 Pro');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (5,1,'������15 Pro Max');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME)  
VALUES (6,1,'������15 Pro Plus');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (7,1,'������15');


INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (8,1,'������14 Pro');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (9,1,'������14 Pro Max');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (10,1,'������14 Pro Plus');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (11,1,'������14');


INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (12,1,'������13 Pro');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (13,1,'������13 Pro Max');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (14,1,'������13');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (15,1,'������13 Mini');

INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (16,1,'������ Pro 2����');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (17,1,'������ Pro 1����');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (18,1,'������ 3����');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (19,1,'������ 2����');

/* �����е� 10.9" (10����)
�����е� Air (4����/5����)
�����е� Mini (6����)
�����е� Pro 12.9" (5����/6����)
�����е� Pro 11" (3����/4����)
�����е� Pro 11" (1����)
*/

INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (20,1,'�����е� 10.9" (10����)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (21,1,'�����е� Air (4����/5����)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (22,1,'�����е� Mini (6����)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (23,1,'�����е� Pro 12.9" (5����/6����)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (24,1,'�����е� Pro 11" (3����/4����)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (25,1,'�����е� Pro 11" (1����)');

/*
�ƺ�
�ƺ� Air 15��ġ (2023)
�ƺ� Pro 14��ġ (2021 / 2023)
�ƺ� Pro 16��ġ (2021 / 2023)
�ƺ� Air 13.6��ġ (2022)
�ƺ� Air 13��ġ (2018 - 2020)
�ƺ� Air 13��ġ (2010 - 2017)
�ƺ� Pro 13��ġ (2020 / 2022)
�ƺ� Pro 13��ġ (2016 - 2019)
�ƺ� Pro 15��ġ (2016 - 2019)
�ƺ� Pro 16��ġ (2019)
��� �ƺ� ���̽�
*/

INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (26,1,'�ƺ� Air 15��ġ (2023)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (27,1,'�ƺ� Pro 14��ġ (2021 / 2023)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (28,1,'�ƺ� Pro 16��ġ (2021 / 2023)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (29,1,'�ƺ� Air 13.6��ġ (2022)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (30,1,'�ƺ� Air 13��ġ (2018 - 2020)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (31,1,'�ƺ� Air 13��ġ (2010 - 2017)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (32,1,'�ƺ� Pro 13��ġ (2020 / 2022)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (33,1,'�ƺ� Pro 13��ġ (2016 - 2019)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (34,1,'�ƺ� Pro 15��ġ (2016 - 2019)');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (35,1,'�ƺ� Pro 16��ġ (2019)');

/*
38 / 40 / 41mm
42 / 44 / 45 / 49mm
���� ��ġ ���̽�
*/
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (36,1,'38 / 40 / 41mm');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (37,1,'42 / 44 / 45 / 49mm');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME)  
VALUES (38,1,'���� ��ġ ���̽�');

/*
���� �׼�����
�����±� ���̽�
�Ƽ����� ī�� ����
�Ƽ����� ���͸� �� ���̽�
*/
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (39,1,'�����±� ���̽�');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
VALUES (40,1,'�Ƽ����� ī�� ����');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME)  
VALUES (41,1,'�Ƽ����� ���͸� �� ���̽�');


-- 1��ī�װ� �Ｚ : 2
-- 2��ī�װ� : ������S23��ü ������S22��ü ������S21��ü ������Z�ø�����ü �����ù�����ü
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (12,2,'������S23��ü');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (13,2,'������S22��ü');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (14,2,'������S21��ü');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (15,2,'������Z�ø�����ü');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME)   
    VALUES (16,2,'�����ù�����ü');
    
-- 1��ī�װ� ���� : 3
-- 2��ī�װ� : Pixel 8��ü/Pixel 7��ü/Pixel 6��ü /���Pixel ���̽�

INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (17,3,'Pixel 8��ü');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (18,3,'Pixel 7��ü');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (19,3,'Pixel 6��ü');
INSERT INTO category_tbl (CGT_CODE,CGT_PARENT_CODE,CGT_NAME) 
    VALUES (20,3,'���Pixel ���̽�');
    
    
    
    
    

commit;

CREATE TABLE PRODUCT_TBL(
        PROD_NUM             NUMBER  CONSTRAINT  PK_PROD_NUM         PRIMARY KEY,
        CGT_CODE            NUMBER            NULL,
        PROD_NAME            VARCHAR2(50)            NOT NULL,
        PROD_PRICE           NUMBER                  NOT NULL,
        PROD_DISCOUNT        NUMBER                  NOT NULL,
        PROD_PUBLISHER       VARCHAR2(50)            NOT NULL,
        PROD_CONTENT         VARCHAR2(4000)  /* CLOB */                  NOT NULL,       -- ������ 4000BYTE �ʰ������Ǵ�?
        PROD_UP_FOLDER       VARCHAR2(50)             NOT NULL,
        PROD_IMG             VARCHAR2(50)             NOT NULL,  -- ��¥������ΰ� �����Ͽ� �����̸�����
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