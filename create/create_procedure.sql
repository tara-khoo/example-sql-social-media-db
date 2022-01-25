-- When a new user signs up, they input their details
-- If user is less than 18, return error mesage
-- If email or phone number is already in use, return error mesage
-- Else insert values into Accounts table

DELIMITER // 
CREATE PROCEDURE New_Signup (
    IN SIGNUP_EMAIL VARCHAR(50),
    IN SIGNUP_PHONE CHAR(11),
    IN SIGNUP_BIRTHDAY DATE
)
DETERMINISTIC
BEGIN 
IF User_Age(SIGNUP_BIRTHDAY) < 18
	THEN SELECT 'Users cannot be under 18.';
ELSEIF EXISTS (SELECT * FROM Accounts WHERE EMAIL = SIGNUP_EMAIL OR PHONE = SIGNUP_PHONE)
	THEN SELECT 'You are already registered.';
ELSE
		BEGIN
		INSERT INTO Accounts (EMAIL, PHONE, BIRTHDAY)
		VALUES (SIGNUP_EMAIL, SIGNUP_PHONE,SIGNUP_BIRTHDAY);
        END;
        SELECT 'Sign-up successful!';
END IF;
END // 
DELIMITER ;

-- DUPLICATE SIGNUP 
-- CALL New_Signup('00675B3884@mail.com', 07429899994,'1999-04-16');

-- UNDER 18
-- CALL New_Signup('under18@mail.com', 07429899994,'2022-04-16');

-- SUCCESSFUL 
-- CALL New_Signup('codefirstgirls@gmail.com', 99999899999,'2022-01-27');
