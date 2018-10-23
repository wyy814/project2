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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `applys` */

insert  into `applys`(`id`,`r_id`,`a_name`,`d_time`,`c_state`,`in_state`) values (17,19,'张三','2018-11-01','已查看','已面试'),(18,20,'李四','2018-11-02','已查看','已面试'),(19,21,'李四','2018-11-03','已查看','已面试');

/*Table structure for table `backs` */

DROP TABLE IF EXISTS `backs`;

CREATE TABLE `backs` (
  `r_id` bigint(20) DEFAULT NULL,
  `t_time` date DEFAULT NULL,
  `in_time` date DEFAULT NULL,
  `employed` varchar(20) NOT NULL DEFAULT '未录用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `backs` */

insert  into `backs`(`r_id`,`t_time`,`in_time`,`employed`) values (19,'2018-11-01','2018-11-01','已录取'),(20,'2018-11-02','2018-11-02','已录取'),(21,'2018-11-03','2018-11-03','已录取');

/*Table structure for table `cards` */

DROP TABLE IF EXISTS `cards`;

CREATE TABLE `cards` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `r_id` bigint(20) NOT NULL,
  `u_time` timestamp NULL DEFAULT NULL,
  `d_time` timestamp NULL DEFAULT NULL,
  `yn_late` varchar(20) DEFAULT NULL,
  `yn_leave` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `cards` */

insert  into `cards`(`id`,`r_id`,`u_time`,`d_time`,`yn_late`,`yn_leave`) values (15,19,'2018-11-01 17:50:17','2018-11-01 18:25:14','迟到','否'),(16,19,'2018-11-02 08:33:30',NULL,'否',NULL),(17,20,'2018-11-02 08:38:09','2018-11-02 17:45:03','否','否'),(18,21,'2018-11-03 10:00:41','2018-11-03 10:00:51','迟到','早退'),(19,21,'2018-11-02 08:14:26','2018-11-02 08:14:29','否','早退'),(20,21,'2018-11-01 08:15:19','2018-11-01 08:15:22','否','早退');

/*Table structure for table `depts` */

DROP TABLE IF EXISTS `depts`;

CREATE TABLE `depts` (
  `name` varchar(20) NOT NULL,
  `d_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `depts` */

insert  into `depts`(`name`,`d_time`) values ('IT部','2018-10-20 10:49:52'),('人事部','2018-10-20 10:51:29');

/*Table structure for table `grades` */

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `r_id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grades` */

insert  into `grades`(`r_id`,`name`,`dept`,`position`,`grade`) values (21,'李四','人事部','顾问',2000);

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

insert  into `own`(`r_id`,`name`,`sex`,`age`,`edu_bg`,`phone`,`email`,`dept`,`position`,`political`,`in_time`,`hobby`,`state`) values (19,'张三','男',26,'本科','15689562347','156@qq.com','IT部','Java开发','群众','2018-11-01','篮球','在职'),(20,'李四','男',25,'大专','45896325','466@qq.com','IT部','Java开发','团员','2018-11-02','篮球','在职'),(21,'李四','男',26,'本科','12589756234','15689@qq.com','人事部','顾问','群众','2018-11-03','读书','在职');

/*Table structure for table `positions` */

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `name` varchar(20) NOT NULL,
  `d_name` varchar(20) NOT NULL,
  `p_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  KEY `d_name` (`d_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `positions` */

insert  into `positions`(`name`,`d_name`,`p_time`) values ('Java开发','IT部','2018-10-20 10:49:53'),('Java测试','IT部','2018-10-20 10:50:17'),('经理','人事部','2018-10-20 10:51:29'),('顾问','人事部','2018-10-20 10:52:51');

/*Table structure for table `re_and_pu` */

DROP TABLE IF EXISTS `re_and_pu`;

CREATE TABLE `re_and_pu` (
  `id` bigint(20) NOT NULL,
  `e_name` varchar(20) NOT NULL,
  `why` varchar(20) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `re_and_pu` */

insert  into `re_and_pu`(`id`,`e_name`,`why`,`time`,`num`,`type`) values (21,'李四','表现优秀','2018-11-01',500,'赏');

/*Table structure for table `salarys` */

DROP TABLE IF EXISTS `salarys`;

CREATE TABLE `salarys` (
  `id` bigint(20) NOT NULL,
  `b_salary` int(11) DEFAULT NULL,
  `p_salary` int(11) DEFAULT NULL,
  `rp_salary` int(11) DEFAULT NULL,
  `s_salary` int(11) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `rec` varchar(100) DEFAULT '无',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salarys` */

insert  into `salarys`(`id`,`b_salary`,`p_salary`,`rp_salary`,`s_salary`,`time`,`rec`) values (21,1400,2000,500,-1500,'2018-11-01','无');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `user_resumes` */

insert  into `user_resumes`(`id`,`name`,`sex`,`age`,`edu_bg`,`phone`,`email`,`dept`,`position`,`political`,`on_job`,`work_exp`,`salary`,`hobby`,`u_name`) values (19,'张三','男',26,'本科','15689562347','156@qq.com','IT部','Java开发','群众','java开发','2年','6000-8000','篮球','a'),(20,'李四','男',25,'大专','45896325','466@qq.com','IT部','Java测试','团员','java测试','2年','6000-8000','篮球','b'),(21,'李四','男',26,'本科','12589756234','15689@qq.com','人事部','顾问','群众','助理','3年','6000-8000','读书','c');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `name` varchar(20) NOT NULL COMMENT '游客姓名',
  `password` varchar(50) NOT NULL COMMENT '游客密码',
  `type` int(2) DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`name`,`password`,`type`) values ('a','a',1),('b','b',1),('c','c',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
