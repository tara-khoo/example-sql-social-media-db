-- GROUP BY
-- Analyse average followers, following, engagement by user age

SELECT User_Age(Accounts.BIRTHDAY) AS USER_AGE, AVG(Calculate_Followers(Accounts.ACCOUNT_ID)) AS AVG_FOLLOWERS,
AVG(Calculate_Following(Accounts.ACCOUNT_ID)) AS AVG_FOLLOWING,
COUNT(Posts.POST_ID) AS TOTAL_POSTS,
AVG(Calculate_Engagements(Posts.POST_ID)) AS AVG_ENGAGEMENTS
FROM User_Profiles
	JOIN Accounts
		ON User_Profiles.ACCOUNT_ID = Accounts.ACCOUNT_ID
	JOIN Posts
		ON User_Profiles.ACCOUNT_ID = Posts.POST_AUTHOR_ID
GROUP BY USER_AGE
ORDER BY USER_AGE ASC;

-- SUBQUERY
-- Return all usernames following account with username 'helium'

SELECT User_Profiles.USERNAME AS FOLLOWER_USERNAME
FROM User_Profiles
JOIN (
	SELECT User_Following.ACCOUNT_ID AS FOLLOWER_ID, User_Following.FOLLOWING_ACCOUNT_ID, 
	User_Profiles.USERNAME AS FOLLOWING_USERNAME
	FROM User_Profiles
	JOIN User_Following
	ON User_Profiles.ACCOUNT_ID = User_Following.FOLLOWING_ACCOUNT_ID) FOLLOWING
ON User_Profiles.ACCOUNT_ID = FOLLOWING.FOLLOWER_ID
WHERE FOLLOWING_USERNAME = 'helium';
