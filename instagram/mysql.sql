CREATE TABLE `User` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_name` int,
  `password` varchar(255)
);

CREATE TABLE `Post` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `media_link` varchar(255),
  `created_at` datetime,
  `user_id` int
);

CREATE TABLE `FollowUser` (
  `follower_id` int,
  `followee_id` int,
  `created_at` datetime,
  PRIMARY KEY (`follower_id`, `followee_id`)
);

ALTER TABLE `Post` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

ALTER TABLE `FollowUser` ADD FOREIGN KEY (`follower_id`) REFERENCES `User` (`id`);

ALTER TABLE `FollowUser` ADD FOREIGN KEY (`followee_id`) REFERENCES `User` (`id`);
