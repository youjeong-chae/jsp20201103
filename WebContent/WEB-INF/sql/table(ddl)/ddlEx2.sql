-- 테이블 변경
-- ALTER TABLE 
-- 컬럼 추가, 컬럼 변경, 컬럼 삭제

-- 컬럼 추가
-- ALTER TABLE table_name ADD (new_col DATATYPE,,,);

-- 책 예제(210쪽)
DESC dept20;
ALTER TABLE dept20
ADD (birth date);

-- 컬럼 변경
-- ALTER TABLE tname MODIFY (colName type,,,);
-- 책 예제 (211쪽)
ALTER TABLE dept20
MODIFY (ename VARCHAR2(5));
DESC dept20;
/*
INSERT INTO dept20
(ename) VALUES ('abcdefghij');
commit;
select * FROM dept20;
*/
