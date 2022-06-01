-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2022 at 06:20 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finsta`
--
CREATE DATABASE IF NOT EXISTS `finsta` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `finsta`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `category_id` mediumint(9) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Landscapes'),
(2, 'Portraits');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` mediumint(9) NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  `body` varchar(500) NOT NULL,
  `post_id` mediumint(9) NOT NULL,
  `date` datetime NOT NULL,
  `is_approved` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `body`, `post_id`, `date`, `is_approved`) VALUES
(1, 1, 'User 1 commenting on post 1', 1, '2022-05-31 09:19:26', 1),
(2, 2, 'User 2 commenting on post 2', 2, '2022-05-31 09:19:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `post_id` mediumint(9) NOT NULL,
  `image` varchar(60) NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  `category_id` mediumint(9) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `body` varchar(1000) DEFAULT NULL,
  `date` datetime NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `image`, `user_id`, `category_id`, `title`, `body`, `date`, `is_published`, `allow_comments`) VALUES
(1, 'https://picsum.photos/id/237/600/600', 1, 2, 'Cute Black Lab', 'This is a dog', '2022-05-31 09:18:06', 1, 1),
(2, 'https://picsum.photos/id/1010/600/600', 2, 2, 'Kid Finding God', 'Have you found Jesus?', '2022-05-31 09:18:06', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `tag_id` mediumint(9) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `name`) VALUES
(0, 'cats'),
(0, 'brunch');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` mediumint(9) NOT NULL,
  `username` varchar(30) NOT NULL,
  `profile_pic` varchar(60) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `bio` varchar(200) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `join_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `profile_pic`, `password`, `bio`, `email`, `is_admin`, `join_date`) VALUES
(1, 'Lily', 'https://randomuser.me/api/portraits/women/65.jpg', '$2y$10$Z17BX4m6W9q4o4rnOMoueeN4O4lXg8F/x1DYOlXJOyvp2TNRPvvE2', 'I\'m a cool mom.', 'lily.watson@example.com', 1, '2022-05-31 09:09:38'),
(2, 'Clayton', 'https://randomuser.me/api/portraits/men/83.jpg', '$2y$10$x8qxu8H1sc6aahD..M4n.ujHQ3CU2rPsnO3pXXDWwQwqJG/3Tv7tS', 'I like cats', 'clayton.mason@example.com', 0, '2022-05-31 09:12:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
