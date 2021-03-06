
-- Crear una tabla particionada por rango:
CREATE TABLE CARS(YEAR NUMBER, PROVIDER VARCHAR(30)) PARTITION BY RANGE(YEAR) (
  PARTITION P1 VALUES LESS THAN(2000), PARTITION P2 VALUES LESS THAN(2005), PARTITION P3 VALUES LESS THAN(2010), PARTITION P4 VALUES LESS THAN(2015), PARTITION P5 VALUES LESS THAN(2020));

-- Algunos insert para la tabla:
INSERT INTO CARS VALUES(1999, 'FORD');
INSERT INTO CARS VALUES(2003, 'MAZDA');
INSERT INTO CARS VALUES(2008, 'NISSAN');


-- Crear una tabla particionada por lista
CREATE TABLE CARS_BYLIST(YEAR NUMBER, PROVIDER VARCHAR(30)) PARTITION BY LIST(YEAR) (PARTITION P1 VALUES(2000, 2001, 2002, 2003, 2004), PARTITION P2 VALUES(2005, 2006, 2007, 2008, 2009), PARTITION P3 VALUES(2010, 2011, 2012, 2013, 2014))

INSERT INTO CARS_BYLIST VALUES(2001, 'FORD');
INSERT INTO CARS_BYLIST VALUES(2003, 'MAZDA');
INSERT INTO CARS_BYLIST VALUES(2007, 'NISSAN');
INSERT INTO CARS_BYLIST VALUES(2014, 'BMW');


-- Crear una tabla particionada por hash
CREATE TABLE CARS_BYHASH(YEAR NUMBER, PROVIDER VARCHAR(30)) PARTITION BY HASH(YEAR) PARTITIONS 4;

INSERT INTO CARS_BYHASH VALUES(2001, 'NISSAN');
INSERT INTO CARS_BYHASH VALUES(2002, 'BMW');
INSERT INTO CARS_BYHASH VALUES(2015, 'FORD');
INSERT INTO CARS_BYHASH VALUES(2009, 'MAZDA');


-- Tabla particionada por multiples columnas
CREATE TABLE CARS_BYMULTCOLS(YEAR NUMBER, MONTH NUMBER, PROVIDER VARCHAR(30)) PARTITION BY RANGE(YEAR, MONTH) (PARTITION B2005_1S VALUES LESS THAN(2005, 6), PARTITION B2005_2S VALUES LESS THAN(2005, 12), PARTITION B2006_1S VALUES LESS THAN(2006, 6), PARTITION B2006_2S VALUES LESS THAN(2006, 12));

INSERT INTO CARS_BYMULTCOLS VALUES(2005, 4, 'FORD');
INSERT INTO CARS_BYMULTCOLS VALUES(2005, 9, 'MAZDA');
INSERT INTO CARS_BYMULTCOLS VALUES(2006, 2, 'BMW');
INSERT INTO CARS_BYMULTCOLS VALUES(2006, 10, 'NISSAN');


-- Tabla subparicionada
CREATE TABLE CARS_SUBPART(YEAR NUMBER, MONTH NUMBER, PROVIDER VARCHAR(30)) PARTITION BY RANGE(YEAR) SUBPARTITION BY LIST(MONTH) SUBPARTITION TEMPLATE( SUBPARTITION C1 VALUES(1,2,3,4), SUBPARTITION C2 VALUES(5,6,7,8), SUBPARTITION C3 VALUES(9,10,11,12)) ( PARTITION B2005 VALUES LESS THAN(2005), PARTITION B2010 VALUES LESS THAN(2010), PARTITION B2015 VALUES LESS THAN(2015));

INSERT INTO CARS_SUBPART VALUES(2003, 2, 'MAZDA');
INSERT INTO CARS_SUBPART VALUES(2003, 12, 'FORD');
INSERT INTO CARS_SUBPART VALUES(2014, 3, 'NISSAN');
INSERT INTO CARS_SUBPART VALUES(2011, 7, 'BMW');

-- Consultar subparticiones de una tabla
SELECT TABLE_NAME, PARTITION_NAME, SUBPARTITION_NAME FROM USER_TAB_SUBPARTITIONS;





