/*
SQLyog v10.2 
MySQL - 5.6.10 : Database - khwc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`khwc` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `khwc`;

/*Data for the table `meip_config` */

insert  into `meip_config`(`CONFIGID`,`NAME`,`CONFIGTYPE`,`CONFIGDATA`,`ENABLE`,`ORDERID`,`UPDATEDTM`,`UPDATEUSER`,`UPDAETIP`) values (1,'DEMO','SYSTEM','MS_MESSAGE_PUSH_SEPTUM=3\r\nMS_RECEIPT_WAITING_TIME=2\r\nDEFAULT_SYSTEM_SECURITY=BLACK\r\nMS_SERVICE_ENABLE=T\r\nUSER_SECURITY=T\r\nSYSTEM_SECURITY_LEVEL=L\r\nMS_POOL_SIZE=50\r\nSECURITY_CERT_REQ=HAND_HISTORY','T',1,'2015-08-24 16:49:06','superadmin','36.22.24.6');

/*Data for the table `meip_navigation` */

insert  into `meip_navigation`(`ID`,`NAME`,`ICON`,`DESCRIPTION`,`PARENTID`,`CCM`,`ENABLE`,`ORDERINDEX`) values ('root','根目录','img:r1','','root','','F',4);

/*Data for the table `meip_resources` */

insert  into `meip_resources`(`RESID`,`RESVER`,`RESNAME`,`RESPATH`,`ISDYNAMIC`,`UPDATEDTM`,`UPDATEUSERID`,`UPDATEIP`) values ('default',1,'默认图标','default/panel.png','F','2013-07-09 15:30:21','superadmin','127.0.0.1');

/*Data for the table `pub_menu` */

insert  into `pub_menu`(`ID`,`ICONID`,`NAME`,`PARENTID`,`ORDERID`,`PROP`,`RESOURCEID`,`SYS`,`ENABLE`,`HASCHILD`) values ('about','','关于我们','sysManage',19,'','about',0,1,0),('appVersion',NULL,'版本管理','businessManage',1,NULL,'appVersion',0,1,0),('businessManage','icon-system','业务管理','root',18,NULL,'businessManage',0,1,0),('certificateManage',NULL,'证书管理','sysManage',13,NULL,'certificateManage',0,1,0),('certificateVerify',NULL,'证书审批','sysManage',12,NULL,'certificateVerify',0,1,0),('clientManage',NULL,'客户端管理','sysManage',15,NULL,'clientManage',0,1,0),('dataitem','','数据项管理','businessManage',22,'','dataItem',0,1,0),('dataPoolManage','','数据池管理','businessManage',21,'','dataPoolManage',0,1,0),('dataSources','','数据源管理','businessManage',20,'','dataSources',0,1,0),('fireWall',NULL,'防火墙设置','sysManage',14,NULL,'fireWall',0,1,0),('functionManage',NULL,'功能管理','businessManage',21,NULL,'functionManage',0,1,0),('indexPages','','主页管理','businessManage',17,'','indexPage',0,1,0),('operation','','通用操作','businessManage',23,'','operation',0,1,0),('realcom','','实时通讯','businessManage',26,'','realcom',0,1,0),('resourceFile',NULL,'资源文件管理','businessManage',2,NULL,'resourceFile',0,1,0),('root',NULL,'根目录',NULL,0,NULL,NULL,0,1,0),('setting.sysmanage','icon-system','资源菜单','root',3,NULL,'setting.sysmanage.menumanager',0,1,0),('setting.sysmanage.menumanager',NULL,'菜单管理','setting.sysmanage',1,NULL,'FusionApp.setting.sysmanager',0,1,0),('setting.sysmanage.resourcemanager',NULL,'资源管理','setting.sysmanage',2,NULL,'setting.sysmanage.resourcemanager',0,1,0),('setting.usermanage','icon-system','用户管理','root',2,NULL,'setting.usermanage',0,1,0),('setting.usermanage.organization',NULL,'组织机构','setting.usermanage',1,NULL,'setting.usermanage.organization',0,1,0),('setting.usermanage.rolemanager',NULL,'角色管理','setting.usermanage',3,NULL,'setting.usermanage.rolemanager',0,1,0),('setting.usermanage.usermanager',NULL,'用户管理','setting.usermanage',2,NULL,'setting.usermanage.usermanager',0,1,0),('sysManage','icon-system','系统管理','root',1,NULL,'sysManage',0,1,0),('systemConfig',NULL,'系统配置','sysManage',11,NULL,'systemConfig',0,1,0),('systemLogger',NULL,'系统日志','sysManage',16,NULL,'systemLogger',0,1,0);

/*Data for the table `pub_organ` */

insert  into `pub_organ`(`ORGANID`,`ORGANNAME`,`ORGANSHORTNAME`,`PARENTID`,`TYPEID`,`ORDERID`,`ENABLE`,`HASCHILD`,`BUNDLEID`) values ('root','集团公司','集团公司','','COMP',1,1,0,NULL);

/*Data for the table `pub_organ_type` */

insert  into `pub_organ_type`(`TYPEID`,`TYPENAME`,`SUBTYPES`,`ICONOPEN`,`ICONCLOSE`) values ('COMP','公司','COMP,DEPT,EMP,TEAM,USER','open.gif','open.gif'),('DEPT','部门','EMP,TEAM,USER','dept.gif','dept.gif'),('TEAM','小组','EMP,TEAM,USER','open.gif','open.gif'),('USER','用户',NULL,'user.gif','user.gif');

/*Data for the table `pub_resources` */

insert  into `pub_resources`(`ID`,`NAME`,`PARENTID`,`ENABLE`,`ORDERID`,`URL`,`SYS`,`HASCHILD`,`BUNDLEID`) values ('about','关于我们','sysManage',1,21,'jsp/abort/abort.jsp',0,0,NULL),('appVersion','版本管理','businessManage',1,19,'jsp/appVersionManage.jsp',NULL,1,NULL),('businessManage','业务管理','root',1,18,NULL,NULL,1,NULL),('certificateManage','证书管理','sysManage',1,5,'jsp/certificateManage.jsp',NULL,1,NULL),('certificateVerify','证书审批','sysManage',1,6,'jsp/certificateVerify.jsp',NULL,1,NULL),('clientManage','客户端管理','sysManage',1,15,'jsp/clientManage.jsp',NULL,1,NULL),('dataItem','数据项管理','businessManage',1,24,'jsp/dataitem/dataitem.jsp',0,0,NULL),('dataPoolManage','数据池管理','businessManage',1,23,'jsp/dataPoolManage.jsp',0,0,NULL),('dataSources','数据源','businessManage',1,22,'jsp/datasource/datasource.jsp',0,0,NULL),('fireWall','防火墙设置','sysManage',1,14,'fireWall!getFireWallPage.action',NULL,1,NULL),('functionManage','功能管理','businessManage',1,23,'jsp/functionManage.jsp',NULL,1,NULL),('FusionApp.setting.sysmanager','菜单管理','setting.sysmanage.menumanager',1,8,'jsp/menu/menuIndex.jsp',NULL,1,NULL),('indexPage','主页管理','businessManage',1,17,'jsp/ipage/indexPage.jsp',0,0,NULL),('operation','通用操作','businessManage',1,25,'jsp/operation/operationIndex.jsp',0,0,NULL),('pageDesigner','页面设计','sysManage',1,20,'jsp/pageDesigner.jsp',NULL,1,NULL),('realcom','实时通讯','businessManage',1,26,'jsp/realcom.jsp',0,0,NULL),('resourceFile','资源文件管理','businessManage',1,20,'jsp/resourceFileManage.jsp',NULL,1,NULL),('roleconfig','角色配置','setting.usermanage',1,29,'jsp/roles/roleconfig.jsp',0,0,NULL),('root','根目录',NULL,1,1,NULL,NULL,1,NULL),('setting.sysmanage.menumanager','资源菜单','root',1,2,NULL,NULL,1,NULL),('setting.sysmanage.resourcemanager','资源管理','setting.sysmanage.menumanager',1,9,'jsp/resource/resIndex.jsp',NULL,1,NULL),('setting.usermanage','用户管理','root',1,3,NULL,NULL,1,NULL),('setting.usermanage.organization','组织机构','setting.usermanage',1,10,'jsp/organ/organIndex.jsp',NULL,1,NULL),('setting.usermanage.rolemanager','角色管理','setting.usermanage',1,11,'jsp/roles/rolesIndex.jsp',NULL,1,NULL),('setting.usermanage.usermanager','用户管理','setting.usermanage',1,12,'jsp/users/usersIndex.jsp',NULL,1,NULL),('sysManage','系统管理','root',1,4,NULL,NULL,1,NULL),('systemConfig','系统配置','sysManage',1,7,'jsp/systemConfig.jsp',NULL,1,NULL),('systemLogger','系统日志','sysManage',1,16,'jsp/searchSystemLogger.jsp',NULL,1,NULL),('userconfig','用户配置','setting.usermanage',1,28,'jsp/users/userconfig.jsp',0,0,NULL);

/*Data for the table `pub_roleresources` */

insert  into `pub_roleresources`(`ROLEID`,`RESOURCEID`) values ('public','about'),('superadmin','businessManage'),('superadmin','setting.sysmanage.menumanager'),('superadmin','setting.usermanage'),('superadmin','sysManage');

/*Data for the table `pub_roles` */

insert  into `pub_roles`(`ROLEID`,`ROLENAME`,`ROLEDESC`,`ENABLE`,`ORGANID`,`ISSWITCH`,`PUB`) values ('public','普通人员','拥有基本权限',0,'root','T','F'),('superadmin','超级管理员','',1,'root','T','F');

/*Data for the table `pub_user_organs` */

/*Data for the table `pub_userroles` */

insert  into `pub_userroles`(`USERID`,`ROLEID`) values ('superadmin','superadmin');

/*Data for the table `pub_users` */

insert  into `pub_users`(`USERID`,`ORGUSERNAME`,`ORGPASSWORD`,`TEAMID`,`DEPTID`,`ORGANID`,`EXPIREDDATE`,`LOCKED`,`ORDERID`,`LVL`,`BUNDLEID`,`GRANTPC`,`GARNTMOBILE`,`DYNAMICCODE`,`CODEEXPIRE`,`MOBILEINDEXID`,`MOBILETIMEOUT`,`MAXMOBILE`,`isDomainUser`) values ('superadmin','超级管理员','BD1DCBF68E0FFD226FF1CEBB78C2F023',NULL,NULL,'root','9999-12-31 23:59:59','F',0,6,'null','T','T','123','2013-03-19 00:00:00','123123',20,2,'T');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
