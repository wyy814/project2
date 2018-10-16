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

/*Table structure for table `adms` */

DROP TABLE IF EXISTS `adms`;

CREATE TABLE `adms` (
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adms` */

insert  into `adms`(`name`,`password`) values ('mmm','mmm');

/*Table structure for table `applys` */

DROP TABLE IF EXISTS `applys`;

CREATE TABLE `applys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `r_id` bigint(20) NOT NULL,
  `a_name` varchar(20) NOT NULL,
  `d_time` date NOT NULL,
  `c_state` varchar(20) NOT NULL DEFAULT '未查看',
  `in_state` varchar(20) NOT NULL DEFAULT '未面试',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `applys` */

insert  into `applys`(`id`,`r_id`,`a_name`,`d_time`,`c_state`,`in_state`) values (3,5,'张三','2018-10-16','已查看','未面试'),(4,6,'李四','2018-10-16','已查看','未面试'),(5,7,'aaa','2018-10-16','已查看','未面试'),(6,8,'abc','2018-10-16','已查看','未面试'),(7,9,'eee','2018-10-16','已查看','未面试');

/*Table structure for table `backs` */

DROP TABLE IF EXISTS `backs`;

CREATE TABLE `backs` (
  `r_id` bigint(20) DEFAULT NULL,
  `t_time` date DEFAULT NULL,
  `see` varchar(20) NOT NULL DEFAULT '未查看',
  `interview` varchar(20) NOT NULL DEFAULT '按时面试',
  `in_time` date DEFAULT NULL,
  `employed` varchar(20) NOT NULL DEFAULT '未录用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `backs` */

insert  into `backs`(`r_id`,`t_time`,`see`,`interview`,`in_time`,`employed`) values (5,'2018-10-16','未查看','按时面试','2018-10-25','未录用'),(6,'2018-10-16','未查看','按时面试','2018-10-26','未录用'),(7,'2018-10-16','未查看','按时面试','2018-10-25','未录用'),(8,'2018-10-16','未查看','按时面试','2018-10-26','未录用'),(9,'2018-10-16','未查看','按时面试','2018-10-27','未录用');

/*Table structure for table `clocks` */

DROP TABLE IF EXISTS `clocks`;

CREATE TABLE `clocks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `u_time` timestamp NULL DEFAULT NULL,
  `d_time` timestamp NULL DEFAULT NULL,
  `yn_late` varchar(20) DEFAULT NULL,
  `yn_leave` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `clocks` */

/*Table structure for table `depts` */

DROP TABLE IF EXISTS `depts`;

CREATE TABLE `depts` (
  `name` varchar(20) NOT NULL,
  `d_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `depts` */

insert  into `depts`(`name`,`d_time`) values ('人事部','2018-10-03 15:47:46'),('信息部','2018-10-04 15:48:17');

/*Table structure for table `emps` */

DROP TABLE IF EXISTS `emps`;

CREATE TABLE `emps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `edu_bg` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `salary` int(11) NOT NULL,
  `train` varchar(20) DEFAULT NULL,
  `performance` varchar(20) DEFAULT NULL,
  `dept` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `attendance` varchar(20) DEFAULT NULL,
  `state` varchar(20) NOT NULL DEFAULT '在职',
  PRIMARY KEY (`id`),
  KEY `dept` (`dept`),
  KEY `position` (`position`),
  CONSTRAINT `emps_ibfk_1` FOREIGN KEY (`dept`) REFERENCES `depts` (`name`),
  CONSTRAINT `emps_ibfk_2` FOREIGN KEY (`position`) REFERENCES `positions` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emps` */

/*Table structure for table `own` */

DROP TABLE IF EXISTS `own`;

CREATE TABLE `own` (
  `r_id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `edu_bg` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `dept` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `political` varchar(20) DEFAULT NULL,
  `in_time` date NOT NULL,
  `hobby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `own` */

insert  into `own`(`r_id`,`name`,`sex`,`age`,`edu_bg`,`phone`,`email`,`dept`,`position`,`political`,`in_time`,`hobby`) values (7,'aaa','女',23,'本科','456','456@qq.com','人事部','人事助理',NULL,'2018-10-25',NULL),(8,'abc','女',29,'硕士','963123','963@qqcom','信息部','信息经理',NULL,'2018-10-26',''),(9,'eee','男',27,'本科','159','9@qq.com','人事部','人事经理','群众','2018-10-27','篮球');

/*Table structure for table `positions` */

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `name` varchar(20) NOT NULL,
  `d_name` varchar(20) DEFAULT NULL,
  `p_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`name`),
  KEY `d_name` (`d_name`),
  CONSTRAINT `positions_ibfk_1` FOREIGN KEY (`d_name`) REFERENCES `depts` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `positions` */

insert  into `positions`(`name`,`d_name`,`p_time`) values ('IT普通员工','信息部','2018-10-04 15:54:27'),('人事助理','人事部','2018-10-05 15:54:11'),('人事经理','人事部','2018-10-06 15:54:37'),('信息经理','信息部','2018-10-07 15:53:45');

/*Table structure for table `re_and_pu` */

DROP TABLE IF EXISTS `re_and_pu`;

CREATE TABLE `re_and_pu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(20) NOT NULL,
  `why` varchar(20) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `re_and_pu` */

/*Table structure for table `salarys` */

DROP TABLE IF EXISTS `salarys`;

CREATE TABLE `salarys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `b_salary` int(11) DEFAULT NULL,
  `p_salary` int(11) DEFAULT NULL,
  `rp_salary` int(11) DEFAULT NULL,
  `s_salary` int(11) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `rec` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salarys` */

/*Table structure for table `trains` */

DROP TABLE IF EXISTS `trains`;

CREATE TABLE `trains` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `t_time` date NOT NULL,
  `t_dept` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_dept` (`t_dept`)
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
  `dept` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `political` varchar(20) DEFAULT NULL,
  `on_job` varchar(20) DEFAULT NULL,
  `work_exp` varchar(20) DEFAULT NULL,
  `salary` varchar(20) DEFAULT NULL,
  `hobby` varchar(100) DEFAULT NULL,
  `u_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `user_resumes` */

insert  into `user_resumes`(`id`,`name`,`sex`,`age`,`edu_bg`,`phone`,`email`,`dept`,`position`,`political`,`on_job`,`work_exp`,`salary`,`hobby`,`u_name`) values (5,'张三','男',28,'本科','123456','123@qq.com','人事部','人事经理','团员','经理','5年','8000-10000','读书','aaa'),(6,'李四','男',21,'大专','123147','2@qq.com','信息部','IT普通员工','群众','java开发','1年','6000-8000','旅行','bbb'),(7,'aaa','女',23,'本科','456','456@qq.com','人事部','人事助理','党员','助理','1年','4000-6000','登山','ccc'),(8,'abc','女',29,'硕士','963','963@qqcom','信息部','信息经理','党员','经理','5年','其它','读书','ddd'),(9,'eee','男',27,'本科','159','9@qq.com','人事部','人事经理','群众','经理','3年','8000-10000','篮球','eee');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `name` varchar(20) NOT NULL COMMENT '游客姓名',
  `password` varchar(50) NOT NULL COMMENT '游客密码',
  `type` int(2) DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`name`,`password`,`type`) values ('aaa','aaa',1),('bbb','bbb',1),('ccc','ccc',1),('ddd','ddd',1),('eee','eee',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
