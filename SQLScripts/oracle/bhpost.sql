--------------------------------------------------------
--  File created - Saturday-May-14-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BHPOST
--------------------------------------------------------

  CREATE TABLE "TESTUSERDB"."BHPOST" 
   (	"POSTID" NUMBER, 
	"POSTDATE" DATE, 
	"POSTTEXT" VARCHAR2(141 BYTE), 
	"USERID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into TESTUSERDB.BHPOST
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index BHPOST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TESTUSERDB"."BHPOST_PK" ON "TESTUSERDB"."BHPOST" ("POSTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BHPOST
--------------------------------------------------------

  ALTER TABLE "TESTUSERDB"."BHPOST" ADD CONSTRAINT "BHPOST_PK" PRIMARY KEY ("POSTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TESTUSERDB"."BHPOST" MODIFY ("USERID" NOT NULL ENABLE);
  ALTER TABLE "TESTUSERDB"."BHPOST" MODIFY ("POSTTEXT" NOT NULL ENABLE);
  ALTER TABLE "TESTUSERDB"."BHPOST" MODIFY ("POSTDATE" NOT NULL ENABLE);
  ALTER TABLE "TESTUSERDB"."BHPOST" MODIFY ("POSTID" NOT NULL ENABLE);
--------------------------------------------------------
--  DDL for Trigger BHPOST_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TESTUSERDB"."BHPOST_TRG" 
BEFORE INSERT ON BHPOST 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.POSTID IS NULL THEN
      SELECT BHPOST_SEQ.NEXTVAL INTO :NEW.POSTID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "TESTUSERDB"."BHPOST_TRG" ENABLE;
