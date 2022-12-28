Table User {
  id int  [pk, increment]
  user_name int
  password varchar
}

Table Post {
  id int  [pk, increment]
  media_link varchar
  created_at datetime
  user_id int
}

Table FollowUser {
  follower_id int
  followee_id int
  created_at datetime
  
  Indexes {
    (follower_id, followee_id) [pk]
  }
}

// Creating references
// You can also define relaionship separately
// > many-to-one; < one-to-many; - one-to-one; <> many-to-many
Ref: Post.user_id > User.id
Ref: User.id < FollowUser.follower_id
Ref: User.id < FollowUser.followee_id