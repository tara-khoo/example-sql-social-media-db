# Example Social Media DB
Example SQL DB for a fictional social media network including queries, views, functions, triggers and procedures. 

Completed for Code First Girls' SQL Course.

## Tables

Code is in `create_table.sql` There are a total of 6 tables: 

- `Accounts`: user sign-up information
- `Engagements`: interactions with a post by users
- `Media`: media uploaded by users
- `Posts`: posts created by users
- `User_Following`: relationship between users
- `User_Profiles`: front-end display information for users (username, display name, account privacy)
- `Username_Record`: track usernames associated with accounts

## Views

Two views: 

- `Public_Posts_Full`: show all posts where account is set to public, displays username, post timestamp, media type if any, mentioned user if any
= `Followers_Following`: shows following / follower numbers for each account

## Functions

- `Calculate_Engagements`: calculates total number of engagements for a given post
- `Calculate_Followers`: calculates total number of followers for a given user
- `Calculate_Following`: calculates total number of accounts followed by a given user
- `User_Age`: calculates user's age at current moment in time

## Triggers

- `Username_Change`: when a user changes their username, store the previous username in the `Username_Record` table. 


## Procedures

- `New_Signup`: pass email, phone and birthday for a new user. If user is > 18 and email and phone are not already in the DB, insert values into `Accounts` table.

## Example Queries

### Group By

Group users by age, return average number of followers, average number of followed accounts, average post engagements. 

### Subquery

Find the usernames of accounts following a given account.

## DB Structure 
![db_structure](/sns_db.png)
