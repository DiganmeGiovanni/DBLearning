BEGIN
	FOR i IN 1..1000 LOOP
	  INSERT INTO NUMS VALUES(i);
	END LOOP;
	COMMIT;
END;/
