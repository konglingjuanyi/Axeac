
insert  into `pub_menu`(`ID`,`ICONID`,`NAME`,`PARENTID`,`ORDERID`,`PROP`,`RESOURCEID`,`SYS`,`ENABLE`,`HASCHILD`) 
values ('about','','关于我们','sysManage',19,'','about',0,1,0),
('appVersion',NULL,'版本管理','businessManage',1,NULL,'appVersion',0,1,0),
('businessManage','icon-system','业务管理','root',18,NULL,'businessManage',0,1,0),
('certificateManage',NULL,'证书管理','sysManage',13,NULL,'certificateManage',0,1,0),
('certificateVerify',NULL,'证书审批','sysManage',12,NULL,'certificateVerify',0,1,0),
('clientManage',NULL,'客户端管理','sysManage',15,NULL,'clientManage',0,1,0),
('dataitem','','数据项管理','businessManage',22,'','dataItem',0,1,0),
('dataSources','','数据源管理','businessManage',20,'','dataSources',0,1,0),
('dataPoolManage','','数据池管理','businessManage',21,'','dataPoolManage',0,1,0),
('fireWall',NULL,'防火墙设置','sysManage',14,NULL,'fireWall',0,1,0),
('functionManage',NULL,'功能管理','businessManage',21,NULL,'functionManage',0,1,0),
('indexPages','','主页管理','businessManage',17,'','indexPage',0,1,0),
('operation','','通用操作','businessManage',23,'','operation',0,1,0),
('realcom','','实时通讯','businessManage',26,'','realcom',0,1,0),
('resourceFile',NULL,'资源文件管理','businessManage',2,NULL,'resourceFile',0,1,0),
('root',NULL,'根目录',NULL,0,NULL,NULL,0,1,0),
('setting.sysmanage','icon-system','资源菜单','root',3,NULL,'setting.sysmanage.menumanager',0,1,0),
('setting.sysmanage.menumanager',NULL,'菜单管理','setting.sysmanage',1,NULL,'FusionApp.setting.sysmanager',0,1,0),
('setting.sysmanage.resourcemanager',NULL,'资源管理','setting.sysmanage',2,NULL,'setting.sysmanage.resourcemanager',0,1,0),
('setting.usermanage','icon-system','用户管理','root',2,NULL,'setting.usermanage',0,1,0),
('setting.usermanage.organization',NULL,'组织机构','setting.usermanage',1,NULL,'setting.usermanage.organization',0,1,0),
('setting.usermanage.rolemanager',NULL,'角色管理','setting.usermanage',3,NULL,'setting.usermanage.rolemanager',0,1,0),
('setting.usermanage.usermanager',NULL,'用户管理','setting.usermanage',2,NULL,'setting.usermanage.usermanager',0,1,0),
('sysManage','icon-system','系统管理','root',1,NULL,'sysManage',0,1,0),
('systemConfig',NULL,'系统配置','sysManage',11,NULL,'systemConfig',0,1,0),
('systemLogger',NULL,'系统日志','sysManage',16,NULL,'systemLogger',0,1,0);

INSERT  INTO `pub_organ`(`ORGANID`,`ORGANNAME`,`ORGANSHORTNAME`,`PARENTID`,`TYPEID`,`ORDERID`,`ENABLE`,`HASCHILD`)
VALUES('root','集团公司','集团公司','','COMP',1,1,0);

insert  into `pub_organ_type`(`TYPEID`,`TYPENAME`,`SUBTYPES`,`ICONOPEN`,`ICONCLOSE`) 
values ('COMP','公司','COMP,DEPT,EMP,TEAM,USER','open.gif','open.gif'),('DEPT','部门','EMP,TEAM,USER','dept.gif','dept.gif'),
('TEAM','小组','EMP,TEAM,USER','open.gif','open.gif'),
('USER','用户',NULL,'user.gif','user.gif');

insert  into `pub_resources`(`ID`,`NAME`,`PARENTID`,`ENABLE`,`ORDERID`,`URL`,`SYS`,`HASCHILD`) 
values ('about','关于我们','sysManage',1,21,'jsp/abort/abort.jsp',0,0),
('appVersion','版本管理','businessManage',1,19,'jsp/appVersionManage.jsp',NULL,1),
('businessManage','业务管理','root',1,18,NULL,NULL,1),
('certificateManage','证书管理','sysManage',1,5,'jsp/certificateManage.jsp',NULL,1),
('certificateVerify','证书审批','sysManage',1,6,'jsp/certificateVerify.jsp',NULL,1),
('clientManage','客户端管理','sysManage',1,15,'jsp/clientManage.jsp',NULL,1),
('dataItem','数据项管理','businessManage',1,24,'jsp/dataitem/dataitem.jsp',0,0),
('dataSources','数据源','businessManage',1,22,'jsp/datasource/datasource.jsp',0,0),
('dataPoolManage','数据池管理','businessManage',1,23,'jsp/dataPoolManage.jsp',0,0),
('fireWall','防火墙设置','sysManage',1,14,'fireWall!getFireWallPage.action',NULL,1),
('functionManage','功能管理','businessManage',1,23,'jsp/functionManage.jsp',NULL,1),
('FusionApp.setting.sysmanager','菜单管理','setting.sysmanage.menumanager',1,8,'jsp/menu/menuIndex.jsp',NULL,1),
('indexPage','主页管理','businessManage',1,17,'jsp/ipage/indexPage.jsp',0,0),
('operation','通用操作','businessManage',1,25,'jsp/operation/operationIndex.jsp',0,0),
('realcom','实时通讯','businessManage',1,26,'jsp/realcom.jsp',0,0),
('pageDesigner','页面设计','sysManage',1,20,'jsp/pageDesigner.jsp',NULL,1),
('resourceFile','资源文件管理','businessManage',1,20,'jsp/resourceFileManage.jsp',NULL,1),
('root','根目录',NULL,1,1,NULL,NULL,1),
('setting.sysmanage.menumanager','资源菜单','root',1,2,NULL,NULL,1),
('setting.sysmanage.resourcemanager','资源管理','setting.sysmanage.menumanager',1,9,'jsp/resource/resIndex.jsp',NULL,1),
('setting.usermanage','用户管理','root',1,3,NULL,NULL,1),
('setting.usermanage.organization','组织机构','setting.usermanage',1,10,'jsp/organ/organIndex.jsp',NULL,1),
('setting.usermanage.rolemanager','角色管理','setting.usermanage',1,11,'jsp/roles/rolesIndex.jsp',NULL,1),
('setting.usermanage.usermanager','用户管理','setting.usermanage',1,12,'jsp/users/usersIndex.jsp',NULL,1),
('sysManage','系统管理','root',1,4,NULL,NULL,1),
('systemConfig','系统配置','sysManage',1,7,'jsp/systemConfig.jsp',NULL,1),
('systemLogger','系统日志','sysManage',1,16,'jsp/searchSystemLogger.jsp',NULL,1);


INSERT  INTO `pub_roles`(`ROLEID`,`ROLENAME`,`ROLEDESC`,`ENABLE`,`ORGANID`,`ISSWITCH`,`PUB`)
VALUES ('public','普通人员','拥有基本权限',0,'root','F','F'),
('superadmin','超级管理员','',1,'root','F','F');


insert  into `pub_roleresources`(`ROLEID`,`RESOURCEID`) 
values ('public','about'),
('superadmin','setting.sysmanage.menumanager'),
('superadmin','setting.usermanage'),
('superadmin','sysManage'),
('superadmin','businessManage');


insert  into `meip_resources`(`RESID`,`RESVER`,`RESNAME`,`RESPATH`,`ISDYNAMIC`,`UPDATEDTM`,`UPDATEUSERID`,`UPDATEIP`) 
values ('default',1,'默认图标','default/panel.png','F','2015-07-09 15:30:21.0','superadmin','127.0.0.1');

insert  into `meip_navigation`(`ID`,`NAME`,`ICON`,`DESCRIPTION`,`PARENTID`,`CCM`,`ENABLE`) values ('root','根目录','img:r1','','root','','F');


insert  into `pub_userroles`(`USERID`,`ROLEID`) values ('superadmin','superadmin');

insert  into `pub_users`(`USERID`,`ORGUSERNAME`,`ORGPASSWORD`,`TEAMID`,`DEPTID`,`ORGANID`,`EXPIREDDATE`,`LOCKED`,`ORDERID`,`LVL`,`GRANTPC`,`GARNTMOBILE`,`DYNAMICCODE`,`CODEEXPIRE`,`MOBILEINDEXID`,`MOBILETIMEOUT`,`MAXMOBILE`,`isDomainUser`)
values ('superadmin','超级管理员','BD1DCBF68E0FFD226FF1CEBB78C2F023',NULL,NULL,'root','9999-12-31 23:59:59','F',0,100,'T','T','','2015-03-19 00:00:00','',20,2,'T');

insert into `meip_config` (`CONFIGID`, `NAME`, `CONFIGTYPE`, `CONFIGDATA`, `ENABLE`, `ORDERID`, `UPDATEDTM`, `UPDATEUSER`, `UPDAETIP`) values('1','DEMO','SYSTEM','MS_MESSAGE_PUSH_SEPTUM=3\r\nMS_RECEIPT_WAITING_TIME=2\r\nDEFAULT_SYSTEM_SECURITY=BLACK\r\nMS_SERVICE_ENABLE=T\r\nSYSTEM_SECURITY_LEVEL=L\r\nMS_POOL_SIZE=50\r\nSECURITY_CERT_REQ=HAND_HISTORY','T','1','2015-05-21 11:59:07','superadmin','127.0.0.1');
