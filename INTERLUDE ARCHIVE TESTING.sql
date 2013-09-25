/*
UPDATE JOB_TICKET_ROUTES
SET STATUS = 'COMPLETED'
WHERE JOB_NO = '0000000006' 

SELECT * FROM TRANS_LOG
SELECT * FROM ARCHIVED_JOB_TICKETS
*/

DECLARE @JOB_NO INT
DECLARE @JOB_NO_STR VARCHAR(20)
DECLARE @JOB_SUB_NO VARCHAR(3)
BEGIN TRAN NEW_JOB_TICKET
--SET @JOB_NO = (SELECT NEXT_TO_USE FROM JOB_NUMBERS (HOLDLOCK) )

SET @JOB_NO = 6

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
SET @JOB_SUB_NO='000'
IF @JOB_NO IS NULL 
BEGIN
   SET @JOB_NO = 1
   INSERT INTO JOB_NUMBERS (NEXT_TO_USE) VALUES (@JOB_NO + 1)
END
ELSE
   UPDATE JOB_NUMBERS SET NEXT_TO_USE = NEXT_TO_USE + 1 
IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
SET @JOB_NO_STR = RIGHT('0000000000' + CONVERT(NVARCHAR(10), @JOB_NO),10)
INSERT INTO JOB_TICKET_ROUTES ([JOB_NO] ,[JOB_SUB_NO]  ,[SITE] ,[PARENT_SITE] ,[PRJGUID] ,[MSGID] ,[STATUS] ,[CREATED] ,[CREATED_BY] ,[UPDATED] ,[UPDATED_BY] ,[DEADLINE])
   VALUES (@JOB_NO_STR ,'000'  ,'CS' ,'CS' ,'' ,'' ,'INTAKE' ,'06/24/2013 00:29:25' ,'ADMIN' ,'06/24/2013 00:29:25' ,'ADMIN' ,'06/27/2013 12:12:00')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKETS ([JOB_NO] ,[JOB_SUB_NO]  ,[REQUESTED_DATE] ,[ORIG_DUE_DATE] ,[DUE_DATE] ,[OWNER] ,[APPROVED_BY] ,[CONTACT] ,[FILEPATH] ,[COUNTRY] ,[NON_PRODUCTION] ,[ROUTE_LIMITED] ,[ISRESERVATION])
   VALUES (@JOB_NO_STR ,'000'  ,'01/01/1900 00:00:00' ,'01/01/1900 00:00:00' ,'06/27/2013 12:12:00' ,'ADMIN' ,'' ,'test' ,'' ,'test' ,'0' ,'0' ,'0')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_JTINFO ([JOB_NO] ,[JOB_SUB_NO] )
   VALUES (@JOB_NO_STR ,'000' )

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_HEADERS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[FIELD] ,[PROMPT] ,[METHOD] ,[DTYPE] ,[MINLEN] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[LISTVALUE] ,[VALIDATE_RULE] ,[TOOLTIP] ,[LABEL_WIDTH] ,[LABEL_HEIGHT] ,[FIELD_WIDTH] ,[FIELD_HEIGHT] ,[REQUIRED] ,[VALIDATE] ,[INTERNAL_USE] ,[CAN_DUPLICATE] ,[ISSEARCH] ,[ISSET] ,[CHARACTER_CASE])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'CONTACT' ,'Contact' ,'textbox' ,'varchar' ,'0' ,'50' ,'46' ,'336' ,'0' ,'' ,'' ,'' ,'83' ,'16' ,'200' ,'16' ,'0' ,'0' ,'0' ,'1' ,'0' ,'0' ,'MIXCASE')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_HEADERS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[FIELD] ,[PROMPT] ,[METHOD] ,[DTYPE] ,[MINLEN] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[LISTVALUE] ,[VALIDATE_RULE] ,[TOOLTIP] ,[LABEL_WIDTH] ,[LABEL_HEIGHT] ,[FIELD_WIDTH] ,[FIELD_HEIGHT] ,[REQUIRED] ,[VALIDATE] ,[INTERNAL_USE] ,[CAN_DUPLICATE] ,[ISSEARCH] ,[ISSET] ,[CHARACTER_CASE])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'JOB_NO' ,'JOB NUMBER' ,'internal' ,'varchar' ,'0' ,'20' ,'91' ,'18' ,'4' ,'' ,'' ,'' ,'83' ,'16' ,'179' ,'16' ,'0' ,'0' ,'0' ,'1' ,'0' ,'0' ,'MIXCASE')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_HEADERS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[FIELD] ,[PROMPT] ,[METHOD] ,[DTYPE] ,[MINLEN] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[LISTVALUE] ,[VALIDATE_RULE] ,[TOOLTIP] ,[LABEL_WIDTH] ,[LABEL_HEIGHT] ,[FIELD_WIDTH] ,[FIELD_HEIGHT] ,[REQUIRED] ,[VALIDATE] ,[INTERNAL_USE] ,[CAN_DUPLICATE] ,[ISSEARCH] ,[ISSET] ,[CHARACTER_CASE])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'APPROVED_BY' ,'Approved By' ,'textbox' ,'varchar' ,'0' ,'50' ,'11' ,'800' ,'20' ,'' ,'' ,'' ,'83' ,'16' ,'200' ,'16' ,'0' ,'0' ,'0' ,'1' ,'0' ,'0' ,'MIXCASE')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_HEADERS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[FIELD] ,[PROMPT] ,[METHOD] ,[DTYPE] ,[MINLEN] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[LISTVALUE] ,[VALIDATE_RULE] ,[TOOLTIP] ,[LABEL_WIDTH] ,[LABEL_HEIGHT] ,[FIELD_WIDTH] ,[FIELD_HEIGHT] ,[REQUIRED] ,[VALIDATE] ,[INTERNAL_USE] ,[CAN_DUPLICATE] ,[ISSEARCH] ,[ISSET] ,[CHARACTER_CASE])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'FILEPATH' ,'attach' ,'filepicker' ,'varchar' ,'0' ,'255' ,'76' ,'18' ,'54' ,'' ,'' ,'' ,'83' ,'16' ,'474' ,'16' ,'0' ,'0' ,'0' ,'1' ,'0' ,'0' ,'MIXCASE')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_HEADERS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[FIELD] ,[PROMPT] ,[METHOD] ,[DTYPE] ,[MINLEN] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[LISTVALUE] ,[VALIDATE_RULE] ,[TOOLTIP] ,[LABEL_WIDTH] ,[LABEL_HEIGHT] ,[FIELD_WIDTH] ,[FIELD_HEIGHT] ,[REQUIRED] ,[VALIDATE] ,[INTERNAL_USE] ,[CAN_DUPLICATE] ,[ISSEARCH] ,[ISSET] ,[CHARACTER_CASE])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'DUE_DATE' ,'Due date/time' ,'datepicker' ,'date' ,'0' ,'22' ,'70' ,'364' ,'106' ,'' ,'' ,'' ,'83' ,'16' ,'260' ,'16' ,'1' ,'0' ,'0' ,'1' ,'0' ,'0' ,'MIXCASE')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_HEADERS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[FIELD] ,[PROMPT] ,[METHOD] ,[DTYPE] ,[MINLEN] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[LISTVALUE] ,[VALIDATE_RULE] ,[TOOLTIP] ,[LABEL_WIDTH] ,[LABEL_HEIGHT] ,[FIELD_WIDTH] ,[FIELD_HEIGHT] ,[REQUIRED] ,[VALIDATE] ,[INTERNAL_USE] ,[CAN_DUPLICATE] ,[ISSEARCH] ,[ISSET] ,[CHARACTER_CASE])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'COUNTRY' ,'Country' ,'textbox' ,'varchar' ,'0' ,'30' ,'49' ,'26' ,'114' ,'' ,'' ,'' ,'83' ,'16' ,'200' ,'16' ,'0' ,'0' ,'0' ,'1' ,'0' ,'0' ,'MIXCASE')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_CATEGORIES ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[CATEGORY] ,[SORDER] ,[XPOS] ,[YPOS] ,[REQUIRED] ,[INTERNAL_USE])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'TEST' ,'0' ,'40' ,'242' ,'0' ,'0')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_OPTIONS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[CATEGORY] ,[OPTION] ,[METHOD] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[STEP_NO] ,[STEP_NAME] ,[STEP_COST_CODE] ,[PROCESS_RATE] ,[PROCESS_METHOD] ,[VALUE] ,[LISTVALUE] ,[STEP_ENABLED] ,[INDENT] ,[ISCOLOR] ,[RESOURCE] ,[PERSONNEL] ,[MANUAL] ,[SCHEDULE] ,[METERED] ,[MANDITORY] ,[RQ_TIME] ,[SMC_SLIDES] ,[CAN_DUPLICATE] ,[ROUTE_LIMITED])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'TEST' ,'checkbox' ,'checkbox' ,'50' ,'1' ,'0' ,'0' ,'' ,'' ,'' ,'0' ,'0' ,'on' ,'' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'1' ,'1' ,'0' ,'1' ,'0' ,'1' ,'0')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_OPTIONS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[CATEGORY] ,[OPTION] ,[METHOD] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[STEP_NO] ,[STEP_NAME] ,[STEP_COST_CODE] ,[PROCESS_RATE] ,[PROCESS_METHOD] ,[VALUE] ,[LISTVALUE] ,[STEP_ENABLED] ,[INDENT] ,[ISCOLOR] ,[RESOURCE] ,[PERSONNEL] ,[MANUAL] ,[SCHEDULE] ,[METERED] ,[MANDITORY] ,[RQ_TIME] ,[SMC_SLIDES] ,[CAN_DUPLICATE] ,[ROUTE_LIMITED])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'TEST' ,'radiobox' ,'radiobox' ,'50' ,'2' ,'0' ,'0' ,'' ,'' ,'' ,'0' ,'0' ,'' ,'' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'1' ,'1' ,'0' ,'1' ,'0' ,'1' ,'0')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_OPTIONS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[CATEGORY] ,[OPTION] ,[METHOD] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[STEP_NO] ,[STEP_NAME] ,[STEP_COST_CODE] ,[PROCESS_RATE] ,[PROCESS_METHOD] ,[VALUE] ,[LISTVALUE] ,[STEP_ENABLED] ,[INDENT] ,[ISCOLOR] ,[RESOURCE] ,[PERSONNEL] ,[MANUAL] ,[SCHEDULE] ,[METERED] ,[MANDITORY] ,[RQ_TIME] ,[SMC_SLIDES] ,[CAN_DUPLICATE] ,[ROUTE_LIMITED])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'TEST' ,'numberbox' ,'numberbox' ,'50' ,'3' ,'0' ,'0' ,'' ,'' ,'' ,'0' ,'0' ,'' ,'' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'1' ,'1' ,'0' ,'1' ,'0' ,'1' ,'0')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_OPTIONS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[CATEGORY] ,[OPTION] ,[METHOD] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[STEP_NO] ,[STEP_NAME] ,[STEP_COST_CODE] ,[PROCESS_RATE] ,[PROCESS_METHOD] ,[VALUE] ,[LISTVALUE] ,[STEP_ENABLED] ,[INDENT] ,[ISCOLOR] ,[RESOURCE] ,[PERSONNEL] ,[MANUAL] ,[SCHEDULE] ,[METERED] ,[MANDITORY] ,[RQ_TIME] ,[SMC_SLIDES] ,[CAN_DUPLICATE] ,[ROUTE_LIMITED])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'TEST' ,'textbox' ,'textbox' ,'50' ,'4' ,'0' ,'0' ,'' ,'' ,'' ,'0' ,'0' ,'' ,'' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'1' ,'1' ,'0' ,'1' ,'0' ,'1' ,'0')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_OPTIONS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[CATEGORY] ,[OPTION] ,[METHOD] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[STEP_NO] ,[STEP_NAME] ,[STEP_COST_CODE] ,[PROCESS_RATE] ,[PROCESS_METHOD] ,[VALUE] ,[LISTVALUE] ,[STEP_ENABLED] ,[INDENT] ,[ISCOLOR] ,[RESOURCE] ,[PERSONNEL] ,[MANUAL] ,[SCHEDULE] ,[METERED] ,[MANDITORY] ,[RQ_TIME] ,[SMC_SLIDES] ,[CAN_DUPLICATE] ,[ROUTE_LIMITED])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'TEST' ,'label' ,'label' ,'50' ,'5' ,'0' ,'0' ,'' ,'' ,'' ,'0' ,'0' ,'' ,'' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'1' ,'1' ,'0' ,'1' ,'0' ,'1' ,'0')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_OPTIONS ( [SITE],[JOB_NO] ,[JOB_SUB_NO]  ,[CATEGORY] ,[OPTION] ,[METHOD] ,[MAXLEN] ,[SORDER] ,[XPOS] ,[YPOS] ,[STEP_NO] ,[STEP_NAME] ,[STEP_COST_CODE] ,[PROCESS_RATE] ,[PROCESS_METHOD] ,[VALUE] ,[LISTVALUE] ,[STEP_ENABLED] ,[INDENT] ,[ISCOLOR] ,[RESOURCE] ,[PERSONNEL] ,[MANUAL] ,[SCHEDULE] ,[METERED] ,[MANDITORY] ,[RQ_TIME] ,[SMC_SLIDES] ,[CAN_DUPLICATE] ,[ROUTE_LIMITED])
   VALUES ( 'CS',@JOB_NO_STR ,'000'  ,'TEST' ,'multiline' ,'multiline' ,'50' ,'6' ,'0' ,'0' ,'' ,'' ,'' ,'0' ,'0' ,'' ,'' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'1' ,'1' ,'0' ,'1' ,'0' ,'1' ,'0')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
INSERT INTO JOB_TICKET_TYPES ( [SITE] ,[JOB_TYPE],[JOB_NO] ,[JOB_SUB_NO]  ,[DISPLAY_CODE] ,[DESCRIPTION] ,[TITLE] ,[NON_PRODUCTION] ,[ENABLED] ,[AUTOCLOSE] ,[TRACK_WORKFLOW] ,[NQUEUE] ,[OLIVER] ,[NO_DOUBLE_DIP])
   VALUES ( 'CS' ,'DUPLICATE',@JOB_NO_STR ,'000'  ,'DUPLICATE' ,'DUPLICATE' ,'DUPLICATE' ,'0' ,'1' ,'0' ,'0' ,'0' ,'0' ,'0')

IF @@ERROR<>0 
BEGIN
   ROLLBACK TRAN NEW_JOB_TICKET
   RETURN
END
SELECT @JOB_NO_STR + '-' + @JOB_SUB_NO AS JOB_NO
COMMIT TRAN NEW_JOB_TICKET
