/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.24 : Database - project2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`project2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `project2`;

/*Table structure for table `depts` */

DROP TABLE IF EXISTS `depts`;

CREATE TABLE `depts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `d_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `depts` */

/*Table structure for table `trains` */

DROP TABLE IF EXISTS `trains`;

CREATE TABLE `trains` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `t_time` date NOT NULL,
  `t_dept` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`t_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `trains` */

/*Table structure for table `user_resumes` */

DROP TABLE IF EXISTS `user_resumes`;

CREATE TABLE `user_resumes` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `age` int(11) NOT NULL,
  `edu_bg` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `position` varchar(20) NOT NULL,
  `political` varchar(20) DEFAULT NULL,
  `on_job` varchar(20) DEFAULT NULL,
  `work_exp` varchar(20) DEFAULT NULL,
  `salary` varchar(20) DEFAULT NULL,
  `hobby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`name`),
  KEY `FK_SPECIALTY_ID` (`name`),
  CONSTRAINT `user_resumes_ibfk_1` FOREIGN KEY (`name`) REFERENCES `users` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_resumes` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `name` varchar(20) NOT NULL COMMENT '游客姓名',
  `password` varchar(50) NOT NULL COMMENT '游客密码',
  `type` int(2) DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`name`,`password`,`type`) values ('张三','aaa',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
