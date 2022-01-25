-- Record username changes

SELECT * FROM User_Profiles;

CREATE TRIGGER Username_Change
BEFORE UPDATE ON User_Profiles
FOR EACH ROW
	INSERT INTO Username_Record 
    SET 
		ACCOUNT_ID = OLD.ACCOUNT_ID,
        NEW_USERNAME = NEW.USERNAME,
        OLD_USERNAME = OLD.USERNAME,
        TIME_LOGGED = NOW();

UPDATE User_Profiles
SET User_Profiles.USERNAME = 'maybeswell'
WHERE ACCOUNT_ID = 7;

SELECT * FROM User_Profiles;
SELECT * FROM Username_Record;
