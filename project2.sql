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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `applys` */

insert  into `applys`(`id`,`r_id`,`a_name`,`d_time`,`c_state`,`in_state`) values (8,10,'张三','2018-10-17','已查看','未面试'),(9,11,'李四','2018-10-17','已查看','未面试');

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

insert  into `backs`(`r_id`,`t_time`,`see`,`interview`,`in_time`,`employed`) values (10,'2018-10-17','未查看','按时面试','2018-10-25','未录用'),(11,'2018-10-17','未查看','按时面试','2018-10-26','未录用');

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

insert  into `depts`(`name`,`d_time`) values ('人事部','2018-10-03 15:47:46'),('信息部','2018-10-04 15:48:17'),('销售部','2018-10-17 15:21:22');

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
  `state` varchar(20) DEFAULT '在职',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `own` */

insert  into `own`(`r_id`,`name`,`sex`,`age`,`edu_bg`,`phone`,`email`,`dept`,`position`,`political`,`in_time`,`hobby`,`state`) values (10,'张三','男',25,'本科','15674126986','145689@qq.com','人事部','主管','群众','2018-10-25','登山','在职'),(11,'李四','男',23,'大专','13523568974','654789@qq.com','信息部','普通员工','团员','2018-10-26','篮球','在职');

/*Table structure for table `positions` */

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `name` varchar(20) NOT NULL,
  `d_name` varchar(20) NOT NULL,
  `p_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  KEY `d_name` (`d_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `positions` */

insert  into `positions`(`name`,`d_name`,`p_time`) values ('普通员工','信息部','2018-10-17 15:10:34'),('主管','人事部','2018-10-17 15:10:40'),('助理','人事部','2018-10-17 15:10:44'),('经理','人事部','2018-10-17 15:10:49'),('经理','信息部','2018-10-17 15:10:53'),('顾问','销售部','2018-10-17 15:21:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `user_resumes` */

insert  into `user_resumes`(`id`,`name`,`sex`,`age`,`edu_bg`,`phone`,`email`,`dept`,`position`,`political`,`on_job`,`work_exp`,`salary`,`hobby`,`u_name`) values (10,'张三','男',25,'本科','15674126985','145689@qq.com','人事部','经理','群众','经理','3年','8000-10000','登山','aaa'),(11,'李四','男',23,'大专','13523568974','654789@qq.com','信息部','普通员工','团员','java开发','2年','8000-10000','篮球','bbb');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `name` varchar(20) NOT NULL COMMENT '游客姓名',
  `password` varchar(50) NOT NULL COMMENT '游客密码',
  `type` int(2) DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`name`,`password`,`type`) values ('aaa','aaa',1),('bbb','bbb',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
