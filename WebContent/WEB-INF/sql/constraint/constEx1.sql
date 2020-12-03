-- 제약사항 Constraint (248 쪽 표)
-- not null : 컬럼의 값이 null은 안됨
-- unique : 유일한 값만 저장
-- check : 지정된 값(범위)만 가능
-- foreign key(외래키, 참조키) 
--    : 다른 table에 있는 값만 가능
-- primary key (주요키, 주키, 키) :
--    : not null + unique


-- not null
CREATE TABLE const01 (
    name VARCHAR2(30) NOT NULL,
    age NUMBER
);
INSERT INTO const01 
VALUES ('abc', 30);
INSERT INTO const01
VALUES (NULL, 40); --x
INSERT INTO const01
VALUES ('a', NULL);
INSERT INTO const01 (age)
VALUES (50); -- x
INSERT INTO const01 (name, age)
VALUES ('', 30); -- x
INSERT INTO const01 (name, age)
VALUES (' ', 30);

SELECT * FROM const01;


-- UNIQUE
CREATE TABLE const02
(
    email VARCHAR2(30) UNIQUE,
    name VARCHAR2(30)
);

INSERT INTO const02 (email, name)
VALUES ('a', 'b');
INSERT INTO const02 (email, name)
VALUES ('a', 'c'); -- x
INSERT INTO const02 (email, name)
VALUES ('c', 'b');
INSERT INTO const02 (name)
VALUES ('c');
INSERT INTO const02 (name)
VALUES ('c');
SELECT * FROM const02;

-- CHECK
CREATE TABLE const03
(
name VARCHAR2(30),
age NUMBER CHECK (age > 0)
);
INSERT INTO const03 (name, age)
VALUES ('a', 30);
INSERT INTO const03 (name, age)
VALUES ('b', 0); -- x
INSERT INTO const03 (name)
VALUES ('c');
SELECT * FROM const03;

COMMIT;


-- 제약사항 여러 개 사용 가능
CREATE TABLE const04
(
email VARCHAR2(30) 
  NOT NULL UNIQUE CHECK(email LIKE '%@%'),
name VARCHAR2(30)
);
INSERT INTO const04 (email, name)
VALUES (null, 'a');
INSERT INTO const04 (email, name)
VALUES ('a', 'b');
INSERT INTO const04 (email, name)
VALUES ('a@g', 'c');
INSERT INTO const04 (email, name)
VALUES ('a@g', 'd');
SELECT * FROM const04;
COMMIT;

