-- 1. Upload -> insert table Post
-- 2. Search self posts -> select * from Post where user_id = ?
-- 3. Follow user X -> Insert FollowUser with follower_id = self.id, followee_id = X.id
-- 4.1 Get users who self is following: select * from FollowUser where follower_id = self.id
-- 4.2 Get News Feed from all the people the user follows: select * from Post where user_id in query 4.1 results

-- Functional Requirements
-- 1. Users should be able to upload/download/view photos.
-- 2. Users can perform searches based on photo/video titles.
-- 3. Users can follow other users.
-- 4. The system should be able to generate and display a user’s News Feed consisting of top photos
-- from all the people the user follows.