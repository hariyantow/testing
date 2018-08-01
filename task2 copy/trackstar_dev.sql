-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2018 at 01:07 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trackstar_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `authassignment`
--

CREATE TABLE `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `authitem`
--

CREATE TABLE `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authitem`
--

INSERT INTO `authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('createIssue', 0, 'create a new issue', NULL, 'N;'),
('createProject', 0, 'create a new project', NULL, 'N;'),
('createUser', 0, 'create a new user', NULL, 'N;'),
('deleteIssue', 0, 'delete an issue from a project', NULL, 'N;'),
('deleteProject', 0, 'delete a project', NULL, 'N;'),
('deleteUser', 0, 'remove a user from a project', NULL, 'N;'),
('member', 2, '', NULL, 'N;'),
('owner', 2, '', NULL, 'N;'),
('reader', 2, '', NULL, 'N;'),
('readIssue', 0, 'read issue information', NULL, 'N;'),
('readProject', 0, 'read project information', NULL, 'N;'),
('readUser', 0, 'read user profile information', NULL, 'N;'),
('updateIssue', 0, 'update issue information', NULL, 'N;'),
('updateProject', 0, 'update project information', NULL, 'N;'),
('updateUser', 0, 'update a users in-formation', NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `authitemchild`
--

CREATE TABLE `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authitemchild`
--

INSERT INTO `authitemchild` (`parent`, `child`) VALUES
('member', 'createIssue'),
('member', 'deleteIssue'),
('member', 'reader'),
('member', 'updateIssue'),
('owner', 'createProject'),
('owner', 'createUser'),
('owner', 'deleteProject'),
('owner', 'deleteUser'),
('owner', 'member'),
('owner', 'reader'),
('owner', 'updateProject'),
('owner', 'updateUser'),
('reader', 'readIssue'),
('reader', 'readProject'),
('reader', 'readUser');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`id`, `content`, `issue_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'My Test Comment', 1, '2018-06-05 17:39:00', 1, '2018-06-05 17:39:00', 1),
(2, 'My Test Comment', 1, '2018-06-05 17:39:29', 1, '2018-06-05 17:39:29', 1),
(3, 'My Test Comment 2', 1, '2018-06-05 17:39:44', 1, '2018-06-05 17:39:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_issue`
--

CREATE TABLE `tbl_issue` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `requester_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_issue`
--

INSERT INTO `tbl_issue` (`id`, `name`, `description`, `project_id`, `type_id`, `status_id`, `owner_id`, `requester_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, '1', '123', 1, 0, 0, 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project`
--

CREATE TABLE `tbl_project` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_project`
--

INSERT INTO `tbl_project` (`id`, `name`, `description`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'Test Project1', 'This is number 1 test project', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1),
(2, 'Test Project2', 'This is number 2 test project', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project_user_assignment`
--

CREATE TABLE `tbl_project_user_assignment` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_project_user_assignment`
--

INSERT INTO `tbl_project_user_assignment` (`project_id`, `user_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 1, NULL, NULL, NULL, NULL),
(1, 2, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project_user_role`
--

CREATE TABLE `tbl_project_user_role` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `email`, `username`, `password`, `last_login_time`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'test1@notanaddress.com', 'Test_User_One', '5a105e8b9d40e1329780d62ea2265d8a', '2018-06-05 16:26:32', NULL, NULL, NULL, NULL),
(2, 'test2@notanaddress.com', 'Test_User_Two', 'ad0234829205b9033196ba818f7a872b', NULL, NULL, NULL, NULL, NULL),
(3, 'test3@notanaddress.com', 'test3', '8ad8757baa8564dc136c1e07507f4a98', NULL, '2018-06-05 14:54:43', 0, '2018-06-05 14:54:43', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authassignment`
--
ALTER TABLE `authassignment`
  ADD PRIMARY KEY (`itemname`,`userid`);

--
-- Indexes for table `authitem`
--
ALTER TABLE `authitem`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `authitemchild`
--
ALTER TABLE `authitemchild`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_comment_issue` (`issue_id`),
  ADD KEY `FK_comment_author` (`create_user_id`);

--
-- Indexes for table `tbl_issue`
--
ALTER TABLE `tbl_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_issue_project` (`project_id`),
  ADD KEY `FK_issue_owner` (`owner_id`),
  ADD KEY `FK_issue_requester` (`requester_id`);

--
-- Indexes for table `tbl_project`
--
ALTER TABLE `tbl_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_project_user_assignment`
--
ALTER TABLE `tbl_project_user_assignment`
  ADD PRIMARY KEY (`project_id`,`user_id`),
  ADD KEY `FK_user_project` (`user_id`);

--
-- Indexes for table `tbl_project_user_role`
--
ALTER TABLE `tbl_project_user_role`
  ADD PRIMARY KEY (`project_id`,`user_id`,`role`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_issue`
--
ALTER TABLE `tbl_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_project`
--
ALTER TABLE `tbl_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authassignment`
--
ALTER TABLE `authassignment`
  ADD CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authitemchild`
--
ALTER TABLE `authitemchild`
  ADD CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD CONSTRAINT `FK_comment_author` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `FK_comment_issue` FOREIGN KEY (`issue_id`) REFERENCES `tbl_issue` (`id`);

--
-- Constraints for table `tbl_issue`
--
ALTER TABLE `tbl_issue`
  ADD CONSTRAINT `FK_issue_owner` FOREIGN KEY (`owner_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_issue_project` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_issue_requester` FOREIGN KEY (`requester_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_project_user_assignment`
--
ALTER TABLE `tbl_project_user_assignment`
  ADD CONSTRAINT `FK_project_user` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_user_project` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_project_user_role`
--
ALTER TABLE `tbl_project_user_role`
  ADD CONSTRAINT `tbl_project_user_role_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`),
  ADD CONSTRAINT `tbl_project_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `tbl_project_user_role_ibfk_3` FOREIGN KEY (`role`) REFERENCES `authitem` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
