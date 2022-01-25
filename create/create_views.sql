-- Table showing posts where account privacy is NOT set to private
-- Returns timestamp, media type if any, and mentioned user if any

CREATE VIEW Public_Posts_Full AS (
	SELECT  Posts.POST_ID, Post_Author.USERNAME as AUTHOR, 
	concat(Posts.POST_TIME," ", Posts.POST_DATE) AS POST_TIMESTAMP, 
	Media.MEDIA_TYPE, Mentioned_Profiles.USERNAME as MENTIONED
	FROM Posts
	JOIN User_Profiles Post_Author
		ON Posts.POST_AUTHOR_ID = Post_Author.ACCOUNT_ID
	LEFT JOIN Media
		ON Posts.MEDIA_ID = Media.MEDIA_ID
	LEFT JOIN User_Profiles Mentioned_Profiles
		ON Posts.MENTIONED_USER_ID = Mentioned_Profiles.ACCOUNT_ID
	WHERE Post_Author.ACCOUNT_PRIVACY = 0);

SELECT * FROM Public_Posts_Full;	

-- Table showing number of followers and following for each user

CREATE VIEW Followers_Following AS 
SELECT User_Profiles.USERNAME, Calculate_Following(User_Profiles.ACCOUNT_ID) AS FOLLOWING, 
Calculate_Followers(User_Profiles.ACCOUNT_ID) AS FOLLOWERS
FROM User_Profiles;

SELECT * FROM Followers_Following;
