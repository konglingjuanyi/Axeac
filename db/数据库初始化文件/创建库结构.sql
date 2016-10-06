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

/*Table structure for table `billstates_name` */

DROP TABLE IF EXISTS `billstates_name`;

CREATE TABLE `billstates_name` (
  `billstates` int(10) NOT NULL COMMENT '订单状态号',
  `name` varchar(20) DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`billstates`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Table structure for table `contacts` */

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `WORKNUM` varchar(20) DEFAULT NULL COMMENT '工号',
  `NAME` varchar(10) DEFAULT NULL COMMENT '姓名',
  `DEP` varchar(10) DEFAULT NULL COMMENT '部门',
  `PHONE` varchar(20) DEFAULT NULL COMMENT '手机',
  `LANDLINE` varchar(20) DEFAULT NULL COMMENT '座机',
  `EMAIL` varchar(20) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Table structure for table `meip_adjunct` */

DROP TABLE IF EXISTS `meip_adjunct`;

CREATE TABLE `meip_adjunct` (
  `FILEID` varchar(32) NOT NULL COMMENT '文件ID',
  `DSID` varchar(50) DEFAULT NULL COMMENT '数据源ID',
  `DATAID` varchar(200) DEFAULT NULL COMMENT '数据源中数据ID',
  `FILENAME` varchar(200) DEFAULT NULL COMMENT '文件名',
  `FILESIZE` int(11) DEFAULT NULL COMMENT '文件大小，单位字节数',
  `REMOTE` varchar(1000) DEFAULT NULL COMMENT '远程地址',
  `TYPE` varchar(50) DEFAULT NULL COMMENT '类型，www,data,inside,auth',
  `LOCAL` varchar(1000) DEFAULT NULL COMMENT '本地地址',
  `CACHE` char(1) DEFAULT 'F' COMMENT '是否缓存(T\\F)，缓存后本地下载后，直接使用本地',
  `STATUS` int(11) DEFAULT '0' COMMENT '0：默认；1：下载中；2：下载完成',
  `IMAGEPATH` varchar(500) DEFAULT NULL COMMENT '本地路径，转后的存储，目录下文件为0.png,1.png',
  `PAGES` int(11) DEFAULT NULL COMMENT '页面总数，转后更新',
  PRIMARY KEY (`FILEID`),
  UNIQUE KEY `unique` (`DSID`,`DATAID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_app_version` */

DROP TABLE IF EXISTS `meip_app_version`;

CREATE TABLE `meip_app_version` (
  `SEQ` int(11) NOT NULL,
  `APPVER` varchar(20) DEFAULT NULL COMMENT '主版本次版本修订版本Build日期XXXXSP1',
  `UPDATEDESC` varchar(500) DEFAULT NULL,
  `DOWNLOADURL` varchar(200) DEFAULT NULL,
  `DEVICEOS` varchar(200) DEFAULT NULL COMMENT 'Android、iOS、WindowsPhone、Windows8、Windows',
  `DEVICETYPE` varchar(20) DEFAULT NULL COMMENT 'PhonePADPC',
  `DEVICEOSVER` int(11) DEFAULT NULL,
  `SCREENQULITY` varchar(20) DEFAULT NULL COMMENT 'ALL、HD、SD、ND',
  `SCREEN` varchar(200) DEFAULT NULL COMMENT '宽度×高度,宽度×高度',
  `STARTTIME` datetime DEFAULT NULL COMMENT '为空为立即生效',
  `ENDDTM` datetime DEFAULT NULL COMMENT '为null代表不限制结束下载时间，有时间信息，在这时间后，该版本不再下载',
  `ROLEID` varchar(50) DEFAULT NULL COMMENT '是否为某一角色的定制',
  `ISFORCE` char(1) DEFAULT NULL,
  `ISCURRENT` char(1) DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_cert` */

DROP TABLE IF EXISTS `meip_cert`;

CREATE TABLE `meip_cert` (
  `USERID` varchar(50) NOT NULL,
  `DEVICEID` varchar(100) NOT NULL,
  `CERTID` varchar(200) DEFAULT NULL,
  `REQID` varchar(200) DEFAULT NULL,
  `DYNAMICKEY` varchar(4000) DEFAULT NULL,
  `EXPIREDATE` datetime DEFAULT NULL,
  `CRDTM` datetime DEFAULT NULL,
  `DOWNLOADTIME` datetime DEFAULT NULL,
  `CERTDATA` longblob,
  `ISDISABLE` char(1) DEFAULT 'F',
  `DISABLEDTM` datetime DEFAULT NULL,
  `DISABLEDESC` varchar(500) DEFAULT NULL,
  `OPUSER` varchar(200) DEFAULT NULL,
  `OPIP` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USERID`,`DEVICEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_cert_req` */

DROP TABLE IF EXISTS `meip_cert_req`;

CREATE TABLE `meip_cert_req` (
  `REQNUM` varchar(200) NOT NULL,
  `USERID` varchar(50) DEFAULT NULL,
  `USERPWD` varchar(200) DEFAULT NULL,
  `DEVICEID` varchar(100) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `IMSI` varchar(100) DEFAULT NULL,
  `WIFIMAC` varchar(100) DEFAULT NULL,
  `GPSADDR` varchar(200) DEFAULT NULL,
  `GPS` varchar(50) DEFAULT NULL,
  `REQDTM` datetime DEFAULT NULL,
  `ACCPETTYPE` varchar(20) DEFAULT NULL COMMENT '510一下为系统自动拒绝\n            代码510，系统自动通过\n            代码511，人工审核失败\n            代码512，人工审核通过\n            代码513，等待人工审核\n            代码514，取消审核',
  `ACCEPTDESC` varchar(200) DEFAULT NULL,
  `ACCPETUSER` varchar(200) DEFAULT NULL,
  `ACCPETDTM` datetime DEFAULT NULL,
  `ACCPETIP` varchar(100) DEFAULT NULL,
  `CERTID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`REQNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_config` */

DROP TABLE IF EXISTS `meip_config`;

CREATE TABLE `meip_config` (
  `CONFIGID` int(11) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `CONFIGTYPE` varchar(200) DEFAULT NULL COMMENT '默认为SYSTEM，也可以用与其他类型的配置',
  `CONFIGDATA` longblob,
  `ENABLE` char(1) DEFAULT 'T',
  `ORDERID` int(11) DEFAULT NULL,
  `UPDATEDTM` datetime DEFAULT NULL,
  `UPDATEUSER` varchar(50) DEFAULT NULL,
  `UPDAETIP` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CONFIGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_dataitem` */

DROP TABLE IF EXISTS `meip_dataitem`;

CREATE TABLE `meip_dataitem` (
  `ITEMID` varchar(50) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `PUB` char(1) DEFAULT NULL,
  `DATASOURCEID` varchar(200) DEFAULT NULL,
  `PROP` longblob,
  `ISROLLBACK` char(1) DEFAULT NULL,
  `ROLLBACKPROP` longblob,
  `CACHE` varchar(200) DEFAULT NULL COMMENT '1d=当天有效\n            1M=1月\n            1m=分钟\n            USER\n            SQL',
  `EXECNUM` int(11) DEFAULT NULL,
  `ERRNUM` int(11) DEFAULT NULL,
  `ERRDESC` varchar(200) DEFAULT NULL,
  `LASTCODE` int(11) DEFAULT NULL,
  `LASTDESC` varchar(500) DEFAULT NULL,
  `LASTDTM` datetime DEFAULT NULL,
  `LASTPAGE` varchar(200) DEFAULT NULL,
  `LASTOPERATION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_datasource` */

DROP TABLE IF EXISTS `meip_datasource`;

CREATE TABLE `meip_datasource` (
  `DSID` varchar(200) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `ENABLE` char(1) DEFAULT 'T',
  `TYPE` varchar(50) DEFAULT NULL,
  `PROP` longblob,
  `EXECUTOR` varchar(200) DEFAULT NULL COMMENT '如果类型只有一个执行器，则不选择。如果有多个执行器，则此显示执行器的注册Bean的ID',
  `CREATEDTM` datetime DEFAULT NULL,
  `UPDATEDTM` datetime DEFAULT NULL,
  `CREATEUSER` varchar(200) DEFAULT NULL,
  `UPDATEUSER` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`DSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_exception` */

DROP TABLE IF EXISTS `meip_exception`;

CREATE TABLE `meip_exception` (
  `SEQ` varchar(200) NOT NULL,
  `CERTID` varchar(200) DEFAULT NULL,
  `REQDTM` datetime DEFAULT NULL,
  `REQTIMEZONE` varchar(200) DEFAULT NULL,
  `REQDTMLOC` datetime DEFAULT NULL,
  `REQPARAM` longblob,
  `REQDATA` longblob,
  `RESDATA` longblob,
  `RESDTMLOC` datetime DEFAULT NULL,
  `RESCODE` int(11) DEFAULT NULL,
  `RESMESSAGE` varchar(1000) DEFAULT NULL,
  `RESEXCEPTION` longblob,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_firewall` */

DROP TABLE IF EXISTS `meip_firewall`;

CREATE TABLE `meip_firewall` (
  `SEQ` int(11) DEFAULT NULL,
  `DATAID` varchar(200) DEFAULT NULL,
  `DATATYPE` varchar(20) DEFAULT NULL COMMENT 'PHONEIMEIIMSICLIENTID',
  `ALLOWTYPE` char(1) DEFAULT NULL COMMENT 'T允许，F拒绝',
  `STARTDTM` datetime DEFAULT NULL,
  `ENDDTM` datetime DEFAULT NULL,
  `CRDTM` datetime DEFAULT NULL,
  `CRUSER` varchar(50) DEFAULT NULL,
  `DELDTM` datetime DEFAULT NULL,
  `DELUSERID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_index` */

DROP TABLE IF EXISTS `meip_index`;

CREATE TABLE `meip_index` (
  `USERID` varchar(50) NOT NULL COMMENT 'MEIP_SYSTEM是系统主页',
  `PAGEID` varchar(50) NOT NULL,
  `PAGEVER` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL COMMENT 'System1=彩虹桥\n            System2=九宫格',
  PRIMARY KEY (`USERID`,`PAGEID`,`PAGEVER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_index_snap` */

DROP TABLE IF EXISTS `meip_index_snap`;

CREATE TABLE `meip_index_snap` (
  `INDEXID` varchar(50) NOT NULL,
  `DEVICE` varchar(50) NOT NULL COMMENT 'iPhone、iPhone5、iPad、iPad Mini、AndroidHD、Android、AndroidSD、Windows8、WindowsPhone8',
  `LARGEIMAGE` varchar(500) DEFAULT NULL,
  `SMALLIMAGE` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`INDEXID`,`DEVICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_logger` */

DROP TABLE IF EXISTS `meip_logger`;

CREATE TABLE `meip_logger` (
  `SEQ` varchar(200) NOT NULL,
  `CERTID` varchar(200) DEFAULT NULL,
  `USERID` varchar(50) DEFAULT NULL,
  `CLIENTID` varchar(100) DEFAULT NULL,
  `GPS` varchar(100) DEFAULT NULL,
  `REQTIMEZONG` varchar(200) DEFAULT NULL,
  `REQOFFSET` int(11) DEFAULT NULL COMMENT '正负分钟数',
  `SERVERTIMEZONG` varchar(200) DEFAULT NULL,
  `SERVEROFFSET` int(11) DEFAULT NULL,
  `REQDTM` datetime DEFAULT NULL,
  `RECIVEDTM` datetime DEFAULT NULL,
  `RESDTM` datetime DEFAULT NULL,
  `REQOP` varchar(200) DEFAULT NULL,
  `REQPAGE` varchar(200) DEFAULT NULL,
  `REQPARAM` longblob,
  `REQDATA` longblob,
  `RESCODE` int(11) DEFAULT NULL COMMENT '0为成功',
  `RESMESSAGE` varchar(2000) DEFAULT NULL,
  `RESPARAM` varchar(4000) DEFAULT NULL,
  `RESDATA` longblob,
  `EXCEPTIONS` longblob,
  `REPORTS` longblob,
  `PARSETIMES` int(11) DEFAULT NULL,
  `AUTHTIMES` int(11) DEFAULT NULL COMMENT '单位毫秒',
  `SEARCHTIMES` int(11) DEFAULT NULL,
  `DATATIMES` int(11) DEFAULT NULL,
  `TOTALTIMES` int(11) DEFAULT NULL,
  `ISEXCEPTION` int(11) DEFAULT NULL,
  `ISSIMULATE` int(11) DEFAULT NULL,
  `NETTIMES` int(11) DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_logger_archives` */

DROP TABLE IF EXISTS `meip_logger_archives`;

CREATE TABLE `meip_logger_archives` (
  `SEQ` varchar(200) NOT NULL,
  `CERTID` varchar(200) DEFAULT NULL,
  `USERID` varchar(50) DEFAULT NULL,
  `CLIENTID` varchar(100) DEFAULT NULL,
  `GPS` varchar(100) DEFAULT NULL,
  `REQTIMEZONG` varchar(200) DEFAULT NULL,
  `REQOFFSET` int(11) DEFAULT NULL COMMENT '正负分钟数',
  `SERVERTIMEZONG` varchar(200) DEFAULT NULL,
  `SERVEROFFSET` int(11) DEFAULT NULL,
  `REQDTM` datetime DEFAULT NULL,
  `RECIVEDTM` datetime DEFAULT NULL,
  `RESDTM` datetime DEFAULT NULL,
  `REQOP` varchar(200) DEFAULT NULL,
  `REQPAGE` varchar(200) DEFAULT NULL,
  `REQPARAM` longblob,
  `REQDATA` longblob,
  `RESCODE` int(11) DEFAULT NULL COMMENT '0为成功',
  `RESMESSAGE` varchar(2000) DEFAULT NULL,
  `RESPARAM` varchar(4000) DEFAULT NULL,
  `RESDATA` longblob,
  `EXCEPTIONS` longblob,
  `REPORTS` longblob,
  `PARSETIMES` int(11) DEFAULT NULL,
  `AUTHTIMES` int(11) DEFAULT NULL COMMENT '单位毫秒',
  `SEARCHTIMES` int(11) DEFAULT NULL,
  `DATATIMES` int(11) DEFAULT NULL,
  `TOTALTIMES` int(11) DEFAULT NULL,
  `ISEXCEPTION` int(11) DEFAULT NULL,
  `ISSIMULATE` int(11) DEFAULT NULL,
  `NETTIMES` int(11) DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_mapping` */

DROP TABLE IF EXISTS `meip_mapping`;

CREATE TABLE `meip_mapping` (
  `USERID` varchar(200) DEFAULT NULL,
  `DATASOURCEID` varchar(200) DEFAULT NULL,
  `DSUSERID` varchar(50) DEFAULT NULL,
  `DSPASSWORD` varchar(200) DEFAULT NULL,
  `DSUSERNAME` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_navigation` */

DROP TABLE IF EXISTS `meip_navigation`;

CREATE TABLE `meip_navigation` (
  `ID` varchar(200) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `ICON` varchar(200) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `PARENTID` varchar(200) DEFAULT NULL,
  `CCM` varchar(1000) DEFAULT NULL,
  `ENABLE` char(1) DEFAULT NULL,
  `ORDERINDEX` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `ORDERINDEX` (`ORDERINDEX`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `meip_operation` */

DROP TABLE IF EXISTS `meip_operation`;

CREATE TABLE `meip_operation` (
  `OPID` varchar(50) NOT NULL,
  `OPNAME` varchar(200) DEFAULT NULL,
  `OPNAMEPY` varchar(200) DEFAULT NULL,
  `OPNAMEJP` varchar(200) DEFAULT NULL,
  `PUB` char(1) DEFAULT NULL,
  `AFTERTYPE` char(1) DEFAULT NULL COMMENT 'P代表功能页面，O代表操作、B代表导航表单、N代表无操作。客户端默认返回上一级',
  `AFTERID` varchar(200) DEFAULT NULL COMMENT '功能页面或操作ID',
  `ISDYNAMIC` char(1) DEFAULT 'F',
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `SHOWINPUB` char(1) DEFAULT 'F' COMMENT '是否显示在公共列表里',
  `LASTUSER` varchar(200) DEFAULT NULL,
  `LASTDTM` datetime DEFAULT NULL,
  `LASTCODE` int(11) DEFAULT NULL,
  `LASTDESC` varchar(1000) DEFAULT NULL,
  `ERRORTYPE` char(1) DEFAULT NULL COMMENT 'P代表功能页面，O代表操作、B代表导航表单、N代表无操作。客户端默认返回上一级',
  `ERRORID` varchar(200) DEFAULT NULL,
  `ISROLLBACK` char(1) DEFAULT NULL,
  PRIMARY KEY (`OPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_operation_condition` */

DROP TABLE IF EXISTS `meip_operation_condition`;

CREATE TABLE `meip_operation_condition` (
  `CNUM` int(11) NOT NULL AUTO_INCREMENT,
  `OPID` varchar(50) DEFAULT NULL,
  `OPCONDITION` longblob,
  `JUMPTYPE` varchar(20) DEFAULT NULL,
  `JUMPID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CNUM`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8;

/*Table structure for table `meip_operation_items` */

DROP TABLE IF EXISTS `meip_operation_items`;

CREATE TABLE `meip_operation_items` (
  `OPID` varchar(50) NOT NULL,
  `ITEMID` varchar(50) NOT NULL,
  `ENABLE` char(1) DEFAULT NULL,
  `ISIGNORE` char(1) DEFAULT NULL,
  PRIMARY KEY (`OPID`,`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_page` */

DROP TABLE IF EXISTS `meip_page`;

CREATE TABLE `meip_page` (
  `PAGEID` varchar(50) NOT NULL,
  `VER` int(11) NOT NULL,
  `NAVID` varchar(200) DEFAULT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `PAGEICON` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `STATUS` varchar(2) DEFAULT NULL COMMENT '1为发布,0为测试,-1为历史版本。当点击发布操作后，测试版本变为0，其他都为-1',
  `PROP` longblob COMMENT '逻辑层配置，自定义函数',
  `ISMAINPAGE` char(1) DEFAULT NULL COMMENT '设置成功后，可以在主页管理里添加主要快照',
  `FORMDATA` longblob COMMENT '默认表单信息，在没有找表单时，使用此表单信息',
  `FORMDATAH` longblob,
  `PAGETYPE` varchar(20) DEFAULT NULL COMMENT '表单(FORM)、组件（CONTAINER）、脚本(SCRIPT)。脚本主要用来做二次请求的查询操作',
  `EXISTSDEVICE` char(1) DEFAULT 'F' COMMENT '根据设备个性化的表单',
  `CACHECODE` varchar(200) DEFAULT NULL COMMENT '设置缓存将不能执行事件及执行内容，直接返回编译后的表单信息',
  `ERRORFORMID` varchar(200) DEFAULT NULL,
  `ISSHOW` char(1) DEFAULT NULL,
  `LASTUSER` varchar(200) DEFAULT NULL,
  `LASTDTM` datetime DEFAULT NULL,
  `LASTCODE` int(11) DEFAULT NULL,
  `LASTDESC` varchar(1000) DEFAULT NULL,
  `ISAUTOBUTTON` char(1) DEFAULT NULL,
  `ISERRORFORM` char(1) DEFAULT NULL,
  `ORDERINDEX` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PAGEID`,`VER`),
  KEY `ORDERINDEX` (`ORDERINDEX`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

/*Table structure for table `meip_page_device` */

DROP TABLE IF EXISTS `meip_page_device`;

CREATE TABLE `meip_page_device` (
  `SEQ` int(11) NOT NULL,
  `PAGEID` varchar(50) NOT NULL,
  `PAEGVER` int(11) NOT NULL,
  `DEVICE_OS` varchar(200) DEFAULT NULL COMMENT 'ALL、Windows、Windows8、Android、IOS、WindowsPhone8',
  `DEVICE_OSVER` varchar(200) DEFAULT NULL COMMENT 'ALL或空，版本不限',
  `DEVICE_TYPE` varchar(200) DEFAULT NULL COMMENT 'ALL、PHONE、PAD、PC',
  `ROLEID` varchar(50) DEFAULT NULL COMMENT '针对某一角色的定制页面',
  `DEVICE_SCREENQULITY` varchar(20) DEFAULT NULL COMMENT 'ALL、HD、SD、ND',
  `DEVICE_SCREENSIZE` int(11) DEFAULT NULL COMMENT '4.5=45',
  `DEVICE_SCREEN` varchar(200) DEFAULT NULL COMMENT '宽度×高度,宽度×高度',
  `FORMDATA` longblob,
  `FORMDATAH` longblob,
  `ENABLE` char(1) DEFAULT 'F',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_page_event` */

DROP TABLE IF EXISTS `meip_page_event`;

CREATE TABLE `meip_page_event` (
  `PAGEID` varchar(50) NOT NULL,
  `PAGEVER` int(11) NOT NULL,
  `ITEMID` varchar(50) NOT NULL,
  `OPEVENT` varchar(20) NOT NULL COMMENT 'BEFORE、AFTER、SUCCESS、ERROR、DATA。 DATA为页面数据。其他为页面事件',
  `ORDERID` int(11) DEFAULT NULL,
  `ENABLE` char(1) DEFAULT NULL,
  `ISIGNORE` char(1) DEFAULT NULL,
  PRIMARY KEY (`PAGEID`,`PAGEVER`,`ITEMID`,`OPEVENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_page_operation` */

DROP TABLE IF EXISTS `meip_page_operation`;

CREATE TABLE `meip_page_operation` (
  `PAGEID` varchar(50) NOT NULL,
  `PAGEVER` int(11) NOT NULL,
  `OPID` varchar(50) NOT NULL,
  `ENABLE` char(1) DEFAULT 'T',
  PRIMARY KEY (`PAGEID`,`PAGEVER`,`OPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_register` */

DROP TABLE IF EXISTS `meip_register`;

CREATE TABLE `meip_register` (
  `SEQUENCE` int(11) NOT NULL,
  `USERID` varchar(50) DEFAULT NULL,
  `USERPWD` varchar(200) DEFAULT NULL,
  `DEVICEID` varchar(100) DEFAULT NULL,
  `DEVICETYPE` varchar(200) DEFAULT NULL,
  `PHONE` varchar(200) DEFAULT NULL COMMENT '用于联系或发送激活代码',
  `EMAIL` varchar(200) DEFAULT NULL COMMENT '用于激活邮件',
  `COMPANY` varchar(200) DEFAULT NULL COMMENT '选填项',
  `REQDTM` datetime DEFAULT NULL,
  `APPROVEDTM` datetime DEFAULT NULL,
  `APPROVEUSERID` varchar(50) DEFAULT NULL,
  `OUSERID` varchar(50) DEFAULT NULL,
  `OPASSWORD` varchar(200) DEFAULT NULL,
  `ORGANID` varchar(50) DEFAULT NULL,
  `DEPTID` varchar(50) DEFAULT NULL,
  `TEAMID` varchar(50) DEFAULT NULL,
  `isActive` char(1) DEFAULT 'F' COMMENT '是否立即激活用户，为验证用户，需要发送短信或邮件验证连接',
  `ActiveCode` varchar(1000) DEFAULT NULL,
  `LastActiveDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`SEQUENCE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_resource_device` */

DROP TABLE IF EXISTS `meip_resource_device`;

CREATE TABLE `meip_resource_device` (
  `RESID` varchar(200) NOT NULL,
  `DEVICETYPE` varchar(20) NOT NULL COMMENT 'Phone、Pad、PC',
  `DEVICEOS` varchar(20) NOT NULL DEFAULT 'F' COMMENT 'AndroidiOSWindowsPhone',
  `DEVICEWIDTH` int(11) NOT NULL,
  `DEVICEHEIGHT` int(11) NOT NULL,
  `VER` int(11) NOT NULL,
  `PATH` varchar(500) DEFAULT NULL,
  `UPDATEDTM` datetime DEFAULT NULL,
  `UPDATEUSERID` varchar(50) DEFAULT NULL,
  `UPDATEADDR` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RESID`,`DEVICETYPE`,`DEVICEOS`,`DEVICEWIDTH`,`DEVICEHEIGHT`,`VER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_resources` */

DROP TABLE IF EXISTS `meip_resources`;

CREATE TABLE `meip_resources` (
  `RESID` varchar(200) NOT NULL,
  `RESVER` int(11) NOT NULL,
  `RESNAME` varchar(200) DEFAULT NULL,
  `RESPATH` varchar(200) DEFAULT NULL,
  `ISDYNAMIC` char(1) DEFAULT 'F' COMMENT '图标一般不选择',
  `UPDATEDTM` datetime DEFAULT NULL,
  `UPDATEUSERID` varchar(50) DEFAULT NULL,
  `UPDATEIP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RESID`,`RESVER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_rolepages` */

DROP TABLE IF EXISTS `meip_rolepages`;

CREATE TABLE `meip_rolepages` (
  `ROLEID` varchar(50) NOT NULL,
  `PAGEID` varchar(50) NOT NULL,
  `ENABLE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ROLEID`,`PAGEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_user_devices` */

DROP TABLE IF EXISTS `meip_user_devices`;

CREATE TABLE `meip_user_devices` (
  `ID` int(11) NOT NULL,
  `USERID` varchar(50) DEFAULT NULL,
  `DEVICEOS` varchar(200) DEFAULT NULL COMMENT 'Android、iOS、WindowsPhone8、Windows、Windows8、Other',
  `OSVER` varchar(200) DEFAULT NULL,
  `DEVICECLASS` varchar(200) DEFAULT NULL COMMENT '手机、平板、PC',
  `DEVICEID` varchar(100) DEFAULT NULL,
  `DEVICETYPE` varchar(200) DEFAULT NULL COMMENT '设备型号',
  `BUILDER` varchar(200) DEFAULT NULL,
  `DEVICEIP` varchar(100) DEFAULT NULL,
  `DEVICEMODEL` varchar(200) DEFAULT NULL,
  `SCREENTYPE` varchar(200) DEFAULT NULL COMMENT 'PAD、PC、PHONE',
  `SCREENSIZE` int(11) DEFAULT NULL COMMENT '4.5=45',
  `SCREENWIDTH` int(11) DEFAULT NULL,
  `SCREENHEIGHT` int(11) DEFAULT NULL,
  `SCREENQULITY` varchar(20) DEFAULT NULL COMMENT 'HDSDND',
  `PHONE` varchar(200) DEFAULT NULL,
  `ISIM` varchar(200) DEFAULT NULL,
  `APPVER` varchar(200) DEFAULT NULL,
  `ISCURRENT` char(1) DEFAULT NULL,
  `DEVICEMAC` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_user_security` */

DROP TABLE IF EXISTS `meip_user_security`;

CREATE TABLE `meip_user_security` (
  `SECNUM` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(50) NOT NULL,
  `BINDTYPE` varchar(20) NOT NULL COMMENT 'CLIENTID、MAC、PHONE、IMSI、CERT',
  `BINDVALUE` varchar(200) DEFAULT NULL,
  `BINDOS` varchar(20) DEFAULT NULL COMMENT 'ALL、Android、iOS、WindowsPhone、Windows8、Windows',
  `ISONLY` char(1) DEFAULT NULL,
  PRIMARY KEY (`SECNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meip_userpages` */

DROP TABLE IF EXISTS `meip_userpages`;

CREATE TABLE `meip_userpages` (
  `USERID` varchar(50) NOT NULL,
  `PAGEID` varchar(50) NOT NULL,
  `PAGESTATUS` int(11) DEFAULT NULL,
  `ENABLE` char(1) DEFAULT NULL COMMENT '当该版本Page被',
  PRIMARY KEY (`USERID`,`PAGEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pricemode_name` */

DROP TABLE IF EXISTS `pricemode_name`;

CREATE TABLE `pricemode_name` (
  `pricemode` int(10) NOT NULL COMMENT '价格方式号',
  `name` varchar(20) DEFAULT NULL COMMENT '价格方式',
  PRIMARY KEY (`pricemode`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Table structure for table `pub_menu` */

DROP TABLE IF EXISTS `pub_menu`;

CREATE TABLE `pub_menu` (
  `ID` varchar(50) NOT NULL,
  `ICONID` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PARENTID` varchar(50) DEFAULT NULL,
  `ORDERID` int(11) DEFAULT NULL,
  `PROP` varchar(2000) DEFAULT NULL,
  `RESOURCEID` varchar(50) DEFAULT NULL,
  `SYS` int(11) DEFAULT NULL,
  `ENABLE` int(11) DEFAULT NULL,
  `HASCHILD` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pub_organ` */

DROP TABLE IF EXISTS `pub_organ`;

CREATE TABLE `pub_organ` (
  `ORGANID` varchar(50) NOT NULL,
  `ORGANNAME` varchar(50) DEFAULT NULL,
  `ORGANSHORTNAME` varchar(50) DEFAULT NULL,
  `PARENTID` varchar(50) DEFAULT NULL,
  `TYPEID` varchar(50) DEFAULT NULL,
  `ORDERID` int(11) DEFAULT NULL,
  `ENABLE` int(11) DEFAULT NULL,
  `HASCHILD` int(11) DEFAULT NULL,
  `BUNDLEID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ORGANID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pub_organ_info` */

DROP TABLE IF EXISTS `pub_organ_info`;

CREATE TABLE `pub_organ_info` (
  `ORGANID` varchar(50) NOT NULL DEFAULT '',
  `INFOID` varchar(50) DEFAULT NULL,
  `CONTENT` varchar(200) DEFAULT NULL,
  `BUNDLEID` varchar(20) DEFAULT NULL,
  `INFOTYPE` char(1) DEFAULT NULL COMMENT 'O组织机构U用户',
  PRIMARY KEY (`ORGANID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pub_organ_infotype` */

DROP TABLE IF EXISTS `pub_organ_infotype`;

CREATE TABLE `pub_organ_infotype` (
  `INFOID` varchar(50) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `ICON` varchar(20) DEFAULT NULL,
  `BUNDLEID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`INFOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pub_organ_type` */

DROP TABLE IF EXISTS `pub_organ_type`;

CREATE TABLE `pub_organ_type` (
  `TYPEID` varchar(50) NOT NULL,
  `TYPENAME` varchar(50) DEFAULT NULL,
  `SUBTYPES` varchar(50) DEFAULT NULL,
  `ICONOPEN` varchar(50) DEFAULT NULL,
  `ICONCLOSE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TYPEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pub_resources` */

DROP TABLE IF EXISTS `pub_resources`;

CREATE TABLE `pub_resources` (
  `ID` varchar(50) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PARENTID` varchar(50) DEFAULT NULL,
  `ENABLE` int(11) DEFAULT NULL,
  `ORDERID` int(11) DEFAULT NULL,
  `URL` varchar(2000) DEFAULT NULL,
  `SYS` int(11) DEFAULT NULL,
  `HASCHILD` int(11) DEFAULT NULL,
  `BUNDLEID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pub_roleresources` */

DROP TABLE IF EXISTS `pub_roleresources`;

CREATE TABLE `pub_roleresources` (
  `ROLEID` varchar(50) NOT NULL,
  `RESOURCEID` varchar(50) NOT NULL,
  PRIMARY KEY (`ROLEID`,`RESOURCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pub_roles` */

DROP TABLE IF EXISTS `pub_roles`;

CREATE TABLE `pub_roles` (
  `ROLEID` varchar(50) NOT NULL,
  `ROLENAME` varchar(50) DEFAULT NULL,
  `ROLEDESC` varchar(50) DEFAULT NULL,
  `ENABLE` int(11) DEFAULT NULL,
  `ORGANID` varchar(50) DEFAULT NULL COMMENT '组织ID为空，则为公共角色',
  `ISSWITCH` char(1) DEFAULT 'F',
  `PUB` char(1) DEFAULT NULL,
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pub_user_organs` */

DROP TABLE IF EXISTS `pub_user_organs`;

CREATE TABLE `pub_user_organs` (
  `USERID` varchar(50) NOT NULL,
  `ORGANID` varchar(50) NOT NULL,
  `DEPTID` varchar(50) NOT NULL,
  `TEAMID` varchar(50) NOT NULL,
  PRIMARY KEY (`USERID`,`ORGANID`,`DEPTID`,`TEAMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pub_userproxy` */

DROP TABLE IF EXISTS `pub_userproxy`;

CREATE TABLE `pub_userproxy` (
  `PROXYID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(50) NOT NULL,
  `PROXYUSERID` varchar(50) NOT NULL,
  `STARTTIME` datetime DEFAULT NULL COMMENT 'null为即时开始',
  `ENDTIME` datetime DEFAULT NULL COMMENT 'null为无限制时间',
  `ENABLE` char(1) DEFAULT NULL,
  PRIMARY KEY (`PROXYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pub_userroles` */

DROP TABLE IF EXISTS `pub_userroles`;

CREATE TABLE `pub_userroles` (
  `USERID` varchar(50) NOT NULL,
  `ROLEID` varchar(50) NOT NULL,
  PRIMARY KEY (`USERID`,`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pub_users` */

DROP TABLE IF EXISTS `pub_users`;

CREATE TABLE `pub_users` (
  `USERID` varchar(50) NOT NULL,
  `ORGUSERNAME` varchar(50) DEFAULT NULL,
  `ORGPASSWORD` varchar(50) DEFAULT NULL,
  `TEAMID` varchar(50) DEFAULT NULL,
  `DEPTID` varchar(50) DEFAULT NULL,
  `ORGANID` varchar(50) DEFAULT NULL,
  `EXPIREDDATE` datetime DEFAULT NULL,
  `LOCKED` char(1) DEFAULT '0',
  `ORDERID` int(11) DEFAULT NULL,
  `LVL` int(11) DEFAULT '10',
  `BUNDLEID` varchar(20) DEFAULT NULL,
  `GRANTPC` char(1) DEFAULT 'F',
  `GARNTMOBILE` char(1) DEFAULT 'T',
  `DYNAMICCODE` varchar(20) DEFAULT NULL,
  `CODEEXPIRE` datetime DEFAULT NULL COMMENT '动态密码过期时间',
  `MOBILEINDEXID` varchar(200) DEFAULT NULL COMMENT 'SYSTEM、USER两个默认的，一个是系统默认、一个是用户自定义表单',
  `MOBILETIMEOUT` int(11) DEFAULT NULL COMMENT '移动平台专用单位分钟',
  `MAXMOBILE` int(11) DEFAULT NULL,
  `isDomainUser` char(1) DEFAULT 'F' COMMENT '是否域用户',
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
