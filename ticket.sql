/*
SQLyog Community v12.4.3 (64 bit)
MySQL - 10.1.37-MariaDB : Database - ticket
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ticket` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ticket`;

/*Table structure for table `submission_tbl` */

DROP TABLE IF EXISTS `submission_tbl`;

CREATE TABLE `submission_tbl` (
  `full_name` varchar(250) DEFAULT NULL,
  `id` bigint(13) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) DEFAULT NULL,
  `phone` int(12) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `submission_tbl` */

insert  into `submission_tbl`(`full_name`,`id`,`email`,`phone`,`created_date`) values 
('emmanuel',4,'emmaht@gmail.com',NULL,'2020-04-30 01:48:59'),
('juka',5,'emmaht@gmail.com',NULL,'2020-04-30 02:12:40'),
('emmanuel mubanga',8,'tyt@gmail.com',NULL,'2020-04-30 02:15:55'),
('emmanuel mubanga',9,'tyt@gmail.com',NULL,'2020-04-30 03:24:48'),
('rty',10,'try@gmail.com',NULL,'2020-04-30 03:34:11'),
('con',11,'emma@gmail.com',NULL,'2020-04-30 03:36:11'),
('job',12,'emmanuelmubangaa@gmail.com',NULL,'2020-04-30 03:39:43');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
