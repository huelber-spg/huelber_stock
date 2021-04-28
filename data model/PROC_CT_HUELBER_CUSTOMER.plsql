create or replace PROCEDURE PROC_CT_HUELBER_CUSTOMER IS
    V_CNT NUMBER;
BEGIN
    SELECT COUNT(*) INTO V_CNT
    FROM ALL_TABLES
    WHERE OWNER='DEMO' AND TABLE_NAME='HUELBER_CUSTOMER';

    IF V_CNT=0 THEN
        EXECUTE IMMEDIATE 'CREATE TABLE HUELBER_CUSTOMER(
                            CUSTOMER_ID INT,
                            EMAIL       VARCHAR2(45),
                            FIRSTNAME   VARCHAR2(40),
                            LASTNAME    VARCHAR2(40),
                            GENDER      VARCHAR2(20),
                            BIRTHDATE   DATE,
                            CREDITS     DECIMAL(4)
                            )';
        COMMIT;
    END IF;
    
    SELECT count(*) INTO V_CNT
    FROM ALL_SEQUENCES
    WHERE SEQUENCE_OWNER='DEMO' 
    AND SEQUENCE_NAME='SEQ_CUSTOMER_ID';
    
    IF V_CNT=0 THEN
      EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_CUSTOMER_ID
                        START WITH 10000
                        INCREMENT BY 1
                        CACHE 50';
      COMMIT;
    END IF;
END PROC_CT_HUELBER_CUSTOMER;