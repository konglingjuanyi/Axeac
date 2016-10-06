/*==============================================================*/
/* DBMS name:      MySQL 5.6.10                                 */
/* Created on:     2015/9/07 14:28:07                           */
/* Created By:     Zhao liguo                                   */
/*==============================================================*/

CREATE DATABASE khwc1;

USE khwc1;

drop table if exists MEIP_ADJUNCT;

drop table if exists MEIP_APP_VERSION;

drop table if exists MEIP_CERT;

drop table if exists MEIP_CERT_REQ;

drop table if exists MEIP_CONFIG;

drop table if exists MEIP_DATAITEM;

drop table if exists MEIP_DATASOURCE;

drop table if exists MEIP_EXCEPTION;

drop table if exists MEIP_FIREWALL;

drop table if exists MEIP_INDEX;

drop table if exists MEIP_INDEX_SNAP;

drop table if exists MEIP_LOGGER;

drop table if exists MEIP_LOGGER_ARCHIVES;

drop table if exists MEIP_MAPPING;

drop table if exists MEIP_NAVIGATION;

drop table if exists MEIP_OPERATION;

drop table if exists MEIP_OPERATION_CONDITION;

drop table if exists MEIP_OPERATION_ITEMS;

drop table if exists MEIP_PAGE;

drop table if exists MEIP_PAGE_DEVICE;

drop table if exists MEIP_PAGE_EVENT;

drop table if exists MEIP_PAGE_OPERATION;

drop table if exists MEIP_REGISTER;

drop table if exists MEIP_RESOURCES;

drop table if exists MEIP_RESOURCE_DEVICE;

drop table if exists MEIP_ROLEPAGES;

drop table if exists MEIP_USERPAGES;

drop table if exists MEIP_USER_DEVICES;

drop table if exists MEIP_USER_SECURITY;

drop table if exists PUB_MENU;

drop table if exists PUB_ORGAN;

drop table if exists PUB_ORGAN_INFO;

drop table if exists PUB_ORGAN_INFOTYPE;

drop table if exists PUB_ORGAN_TYPE;

drop table if exists PUB_RESOURCES;

drop table if exists PUB_ROLERESOURCES;

drop table if exists PUB_ROLES;

drop table if exists PUB_USERPROXY;

drop table if exists PUB_USERROLES;

drop table if exists PUB_USERS;

drop table if exists PUB_USER_ORGANS;

/*==============================================================*/
/* Table: meip_adjunct                                     */
/*==============================================================*/
CREATE TABLE meip_adjunct (
  FILEID varchar(32) NOT NULL COMMENT '文件ID',
  DSID varchar(50) DEFAULT NULL COMMENT '数据源ID',
  DATAID varchar(200) DEFAULT NULL COMMENT '数据源中数据ID',
  FILENAME varchar(200) DEFAULT NULL COMMENT '文件名',
  FILESIZE int(11) DEFAULT NULL COMMENT '文件大小，单位字节数',
  REMOTE varchar(1000) DEFAULT NULL COMMENT '远程地址',
  TYPE varchar(50) DEFAULT NULL COMMENT '类型，www,data,inside,auth',
  LOCAL varchar(1000) DEFAULT NULL COMMENT '本地地址',
  CACHE char(1) DEFAULT 'F' COMMENT '是否缓存(T\\F)，缓存后本地下载后，直接使用本地',
  STATUS int(11) DEFAULT '0' COMMENT '0：默认；1：下载中；2：下载完成',
  IMAGEPATH varchar(500) DEFAULT NULL COMMENT '本地路径，转后的存储，目录下文件为0.png,1.png',
  PAGES int(11) DEFAULT NULL COMMENT '页面总数，转后更新',
  PRIMARY KEY (`FILEID`),
  UNIQUE KEY `unique` (`DSID`,`DATAID`)
);


/*==============================================================*/
/* Table: MEIP_APP_VERSION                                      */
/*==============================================================*/
create table MEIP_APP_VERSION
(
   SEQ                  int not null,
   APPVER               varchar(20) comment '主版本\次版本\修订版本\Build日期XXXX\SP1',
   UPDATEDESC           varchar(500),
   DOWNLOADURL          varchar(200),
   DEVICEOS             varchar(200) comment 'Android、iOS、WindowsPhone、Windows8、Windows',
   DEVICETYPE           varchar(20) comment 'Phone\PAD\PC',
   DEVICEOSVER          int,
   SCREENQULITY         varchar(20) comment 'ALL、HD、SD、ND',
   SCREEN               varchar(200) comment '宽度×高度,宽度×高度',
   STARTTIME            datetime comment '为空为立即生效',
   ENDDTM               datetime comment '为null代表不限制结束下载时间，有时间信息，在这时间后，该版本不再下载',
   ROLEID               varchar(50) comment '是否为某一角色的定制',
   ISFORCE              CHAR(1) DEFAULT NULL,
   ISCURRENT            char(1) DEFAULT NULL,
   primary key (SEQ)
);

/*==============================================================*/
/* Table: MEIP_CERT                                             */
/*==============================================================*/
create table MEIP_CERT
(
   USERID               varchar(50) not null,
   DEVICEID             varchar(100) not null,
   CERTID               varchar(200),
   REQID                varchar(200),
   DYNAMICKEY           varchar(4000),
   EXPIREDATE           datetime,
   CRDTM                datetime,
   DOWNLOADTIME         datetime,
   CERTDATA             longblob,
   ISDISABLE            char(1) default 'F',
   DISABLEDTM           datetime,
   DISABLEDESC          varchar(500),
   OPUSER               varchar(200),
   OPIP                 varchar(20),
   primary key (USERID, DEVICEID)
);

/*==============================================================*/
/* Table: MEIP_CERT_REQ                                         */
/*==============================================================*/
create table MEIP_CERT_REQ
(
   REQNUM               varchar(200) NOT NULL,
   USERID               varchar(50),
   USERPWD              varchar(200),
   DEVICEID             varchar(100),
   PHONE                varchar(100),
   IMSI                 varchar(100),
   WIFIMAC              varchar(100),
   GPSADDR              varchar(200),
   GPS                  varchar(50),
   REQDTM               datetime,
   ACCPETTYPE           varchar(20) comment '510一下为系统自动拒绝
            代码510，系统自动通过
            代码511，人工审核失败
            代码512，人工审核通过
            代码513，等待人工审核
            代码514，取消审核',
   ACCEPTDESC           varchar(200),
   ACCPETUSER           varchar(200),
   ACCPETDTM            datetime,
   ACCPETIP             varchar(100),
   CERTID               varchar(100),
   primary key (REQNUM)
);

/*==============================================================*/
/* Table: MEIP_CONFIG                                           */
/*==============================================================*/
create table MEIP_CONFIG
(
   CONFIGID             int not null,
   NAME                 varchar(200),
   CONFIGTYPE           varchar(200) comment '默认为SYSTEM，也可以用与其他类型的配置',
   CONFIGDATA           longblob,
   ENABLE               char(1) default 'T',
   ORDERID              int,
   UPDATEDTM            datetime,
   UPDATEUSER           varchar(50),
   UPDAETIP             varchar(200),
   primary key (CONFIGID)
);

/*==============================================================*/
/* Table: MEIP_DATAITEM                                         */
/*==============================================================*/
create table MEIP_DATAITEM
(
   ITEMID               varchar(50) not null,
   NAME                 varchar(200),
   DESCRIPTION          varchar(200),
   PUB                  char(1),
   DATASOURCEID         varchar(200),
   PROP                 longblob,
   ISROLLBACK           char(1),
   ROLLBACKPROP         longblob,
   CACHE                varchar(200) comment '1d=当天有效
            1M=1月
            1m=分钟
            USER
            SQL',
   EXECNUM              int,
   ERRNUM               int,
   ERRDESC              varchar(200),
   LASTCODE             int,
   LASTDESC             varchar(500),
   LASTDTM              datetime,
   LASTPAGE             varchar(200),
   LASTOPERATION        varchar(200),
   primary key (ITEMID)
);

/*==============================================================*/
/* Table: MEIP_DATASOURCE                                       */
/*==============================================================*/
create table MEIP_DATASOURCE
(
   DSID                 varchar(200) not null,
   NAME                 varchar(200),
   DESCRIPTION          varchar(500),
   ENABLE               char(1) default 'T',
   TYPE                 varchar(50),
   PROP                 longblob,
   EXECUTOR             varchar(200) comment '如果类型只有一个执行器，则不选择。如果有多个执行器，则此显示执行器的注册Bean的ID',
   CREATEDTM            datetime,
   UPDATEDTM            datetime,
   CREATEUSER           varchar(200),
   UPDATEUSER           varchar(200),
   primary key (DSID)
);

/*==============================================================*/
/* Table: MEIP_EXCEPTION                                        */
/*==============================================================*/
create table MEIP_EXCEPTION
(
   SEQ                  varchar(200) not null,
   CERTID               varchar(200),
   REQDTM               datetime,
   REQTIMEZONE          varchar(200),
   REQDTMLOC            datetime,
   REQPARAM             longblob,
   REQDATA              longblob,
   RESDATA              longblob,
   RESDTMLOC            datetime,
   RESCODE              int,
   RESMESSAGE           varchar(1000),
   RESEXCEPTION         longblob,
   primary key (SEQ)
);

/*==============================================================*/
/* Table: MEIP_FIREWALL                                         */
/*==============================================================*/
create table MEIP_FIREWALL
(
   SEQ                  int,
   DATAID               varchar(200),
   DATATYPE             varchar(20) comment 'PHONE\IMEI\IMSI\CLIENTID',
   ALLOWTYPE            char(1) comment 'T允许，F拒绝',
   STARTDTM             datetime,
   ENDDTM               datetime,
   CRDTM                datetime,
   CRUSER               varchar(50),
   DELDTM               datetime,
   DELUSERID            varchar(50)
);

/*==============================================================*/
/* Table: MEIP_INDEX                                            */
/*==============================================================*/
create table MEIP_INDEX
(
   USERID               varchar(50) not null comment 'MEIP_SYSTEM是系统主页',
   PAGEID               varchar(50) not null,
   PAGEVER              int not null,
   type                 varchar(50) comment 'System1=彩虹桥
            System2=九宫格',
   primary key (USERID, PAGEID, PAGEVER)
);

/*==============================================================*/
/* Table: MEIP_INDEX_SNAP                                       */
/*==============================================================*/
create table MEIP_INDEX_SNAP
(
   INDEXID              varchar(50) not null,
   DEVICE               varchar(50) not null comment 'iPhone、iPhone5、iPad、iPad Mini、AndroidHD、Android、AndroidSD、Windows8、WindowsPhone8',
   LARGEIMAGE           varchar(500),
   SMALLIMAGE           varchar(500),
   primary key (INDEXID, DEVICE)
);

/*==============================================================*/
/* Table: MEIP_LOGGER                                           */
/*==============================================================*/
create table MEIP_LOGGER
(
   SEQ                  varchar(200) not null,
   CERTID               varchar(200),
   USERID               varchar(50),
   CLIENTID             varchar(100),
   GPS                  varchar(100),
   REQTIMEZONG          varchar(200),
   REQOFFSET            int comment '正负分钟数',
   SERVERTIMEZONG       varchar(200),
   SERVEROFFSET         int,
   REQDTM               datetime,
   RECIVEDTM            datetime,
   RESDTM               datetime,
   REQOP                varchar(200),
   REQPAGE              varchar(200),
   REQPARAM             longblob,
   REQDATA              longblob,
   RESCODE              int comment '0为成功',
   RESMESSAGE           varchar(2000),
   RESPARAM             varchar(4000),
   RESDATA              longblob,
   EXCEPTIONS           longblob,
   REPORTS              longblob,
   PARSETIMES           int,
   AUTHTIMES            int comment '单位毫秒',
   SEARCHTIMES          int,
   DATATIMES            int,
   TOTALTIMES           int,
   ISEXCEPTION          int,
   ISSIMULATE           int,
   NETTIMES             int,
   primary key (SEQ)
);

/*==============================================================*/
/* Table: MEIP_LOGGER_ARCHIVES                                  */
/*==============================================================*/
create table MEIP_LOGGER_ARCHIVES
(
   SEQ                  varchar(200) not null,
   CERTID               varchar(200),
   USERID               varchar(50),
   CLIENTID             varchar(100),
   GPS                  varchar(100),
   REQTIMEZONG          varchar(200),
   REQOFFSET            int comment '正负分钟数',
   SERVERTIMEZONG       varchar(200),
   SERVEROFFSET         int,
   REQDTM               datetime,
   RECIVEDTM            datetime,
   RESDTM               datetime,
   REQOP                varchar(200),
   REQPAGE              varchar(200),
   REQPARAM             longblob,
   REQDATA              longblob,
   RESCODE              int comment '0为成功',
   RESMESSAGE           varchar(2000),
   RESPARAM             varchar(4000),
   RESDATA              longblob,
   EXCEPTIONS           longblob,
   REPORTS              longblob,
   PARSETIMES           int,
   AUTHTIMES            int comment '单位毫秒',
   SEARCHTIMES          int,
   DATATIMES            int,
   TOTALTIMES           int,
   ISEXCEPTION          int,
   ISSIMULATE           int,
   NETTIMES             int,
   primary key (SEQ)
);

/*==============================================================*/
/* Table: MEIP_MAPPING                                          */
/*==============================================================*/
create table MEIP_MAPPING
(
   USERID               varchar(200),
   DATASOURCEID         varchar(200),
   DSUSERID             varchar(50),
   DSPASSWORD           varchar(200),
   DSUSERNAME           varchar(200)
);

/*==============================================================*/
/* Table: MEIP_NAVIGATION                                       */
/*==============================================================*/
create table MEIP_NAVIGATION
(
   ID                   varchar(200) not null,
   NAME                 varchar(200),
   ICON                 varchar(200),
   DESCRIPTION          varchar(500),
   PARENTID             varchar(200),
   CCM                  varchar(1000),
   ENABLE               char(1),
   ORDERINDEX           int NOT NULL AUTO_INCREMENT,
   primary key (ID),
   KEY ORDERINDEX (ORDERINDEX)
);

/*==============================================================*/
/* Table: MEIP_OPERATION                                        */
/*==============================================================*/
create table MEIP_OPERATION
(
   OPID                 varchar(50) not null,
   OPNAME               varchar(200),
   OPNAMEPY             varchar(200),
   OPNAMEJP             varchar(200),
   PUB                  char(1),
   AFTERTYPE            char(1) comment 'P代表功能页面，O代表操作、B代表导航表单、N代表无操作。客户端默认返回上一级',
   AFTERID              varchar(200) comment '功能页面或操作ID',
   ISDYNAMIC            char(1) default 'F',
   DESCRIPTION          varchar(500),
   SHOWINPUB            char(1) default 'F' comment '是否显示在公共列表里',
   LASTUSER             varchar(200),
   LASTDTM              datetime,
   LASTCODE             int,
   LASTDESC             varchar(1000),
   ERRORTYPE            char(1) comment 'P代表功能页面，O代表操作、B代表导航表单、N代表无操作。客户端默认返回上一级',
   ERRORID              varchar(200),
   ISROLLBACK           char(1),
   primary key (OPID)
);

/*==============================================================*/
/* Table: MEIP_OPERATION_CONDITION                              */
/*==============================================================*/
create table MEIP_OPERATION_CONDITION
(
   CNUM                 int not null AUTO_INCREMENT,
   OPID                 varchar(50),
   OPCONDITION          longblob,
   JUMPTYPE             varchar(20),
   JUMPID               varchar(50),
   primary key (CNUM)
);

/*==============================================================*/
/* Table: MEIP_OPERATION_ITEMS                                  */
/*==============================================================*/
create table MEIP_OPERATION_ITEMS
(
   OPID                 varchar(50) not null,
   ITEMID               varchar(50) not null,
   ENABLE               char(1),
   ISIGNORE             char(1),
   primary key (OPID, ITEMID)
);

/*==============================================================*/
/* Table: MEIP_PAGE                                             */
/*==============================================================*/
create table MEIP_PAGE
(
   PAGEID               varchar(50) not null,
   VER                  int not null,
   NAVID                varchar(200),
   NAME                 varchar(200),
   PAGEICON             varchar(50),
   DESCRIPTION          varchar(500),
   STATUS               varchar(2) comment '1为发布,0为测试,-1为历史版本。当点击发布操作后，测试版本变为0，其他都为-1',
   PROP                 longblob comment '逻辑层配置，自定义函数',
   ISMAINPAGE           char(1) comment '设置成功后，可以在主页管理里添加主要快照',
   FORMDATA             longblob comment '默认表单信息，在没有找表单时，使用此表单信息',
   FORMDATAH            longblob,
   PAGETYPE             varchar(20) comment '表单(FORM)、组件（CONTAINER）、脚本(SCRIPT)。脚本主要用来做二次请求的查询操作',
   EXISTSDEVICE         char(1) default 'F' comment '根据设备个性化的表单',
   CACHECODE            varchar(200) comment '设置缓存将不能执行事件及执行内容，直接返回编译后的表单信息',
   ERRORFORMID          varchar(200),
   ISSHOW               char(1),
   LASTUSER             varchar(200),
   LASTDTM              datetime,
   LASTCODE             int,
   LASTDESC             varchar(1000),
   ISAUTOBUTTON         CHAR(1),
   ISERRORFORM          CHAR(1),
   ORDERINDEX           int  NOT NULL AUTO_INCREMENT,
   primary key (PAGEID, VER),
   KEY  ORDERINDEX (ORDERINDEX)
);

/*==============================================================*/
/* Table: MEIP_PAGE_DEVICE                                      */
/*==============================================================*/
create table MEIP_PAGE_DEVICE
(
   SEQ                  int not null,
   PAGEID               varchar(50) not null,
   PAEGVER              int not null,
   DEVICE_OS            varchar(200) comment 'ALL、Windows、Windows8、Android、IOS、WindowsPhone8',
   DEVICE_OSVER         varchar(200) comment 'ALL或空，版本不限',
   DEVICE_TYPE          varchar(200) comment 'ALL、PHONE、PAD、PC',
   ROLEID               varchar(50) comment '针对某一角色的定制页面',
   DEVICE_SCREENQULITY  varchar(20) comment 'ALL、HD、SD、ND',
   DEVICE_SCREENSIZE    int comment '4.5=45',
   DEVICE_SCREEN        varchar(200) comment '宽度×高度,宽度×高度',
   FORMDATA             longblob,
   FORMDATAH            longblob,
   ENABLE               char(1) default 'F',
   primary key (SEQ)
);

/*==============================================================*/
/* Table: MEIP_PAGE_EVENT                                       */
/*==============================================================*/
create table MEIP_PAGE_EVENT
(
   PAGEID               varchar(50) not null,
   PAGEVER              int not null,
   ITEMID               varchar(50) not null,
   OPEVENT              varchar(20) not null comment 'BEFORE、AFTER、SUCCESS、ERROR、DATA。 DATA为页面数据。其他为页面事件',
   ORDERID              int,
   ENABLE               char(1),
   ISIGNORE             char(1),
   primary key (PAGEID, PAGEVER, ITEMID, OPEVENT)
);

/*==============================================================*/
/* Table: MEIP_PAGE_OPERATION                                   */
/*==============================================================*/
create table MEIP_PAGE_OPERATION
(
   PAGEID               varchar(50) not null,
   PAGEVER              int not null,
   OPID                 varchar(50) not null,
   ENABLE               char(1) default 'T',
   primary key (PAGEID, PAGEVER, OPID)
);

/*==============================================================*/
/* Table: MEIP_REGISTER                                         */
/*==============================================================*/
create table MEIP_REGISTER
(
   SEQUENCE             int not null,
   USERID               varchar(50),
   USERPWD              varchar(200),
   DEVICEID             varchar(100),
   DEVICETYPE           varchar(200),
   PHONE                varchar(200) comment '用于联系或发送激活代码',
   EMAIL                varchar(200) comment '用于激活邮件',
   COMPANY              varchar(200) comment '选填项',
   REQDTM               datetime,
   APPROVEDTM           datetime,
   APPROVEUSERID        varchar(50),
   OUSERID              varchar(50),
   OPASSWORD            varchar(200),
   ORGANID              varchar(50),
   DEPTID               varchar(50),
   TEAMID               varchar(50),
   isActive             char(1) default 'F' comment '是否立即激活用户，为验证用户，需要发送短信或邮件验证连接',
   ActiveCode           varchar(1000),
   LastActiveDtm        datetime,
   primary key (SEQUENCE)
);


/*==============================================================*/
/* Table: MEIP_RESOURCE_DEVICE                                  */
/*==============================================================*/
create table MEIP_RESOURCE_DEVICE
(
   RESID                varchar(200) not null,
   DEVICETYPE           varchar(20) not null comment 'Phone、Pad、PC',
   DEVICEOS             varchar(20) not null default 'F' comment 'Android\iOS\WindowsPhone',
   DEVICEWIDTH          int not null,
   DEVICEHEIGHT         int not null,
   VER                  int not null,
   PATH                 varchar(500),
   UPDATEDTM            datetime,
   UPDATEUSERID         varchar(50),
   UPDATEADDR           varchar(50),
   primary key (RESID, DEVICETYPE, DEVICEOS, DEVICEWIDTH, DEVICEHEIGHT, VER)
);


/*==============================================================*/
/* Table: MEIP_RESOURCES                                        */
/*==============================================================*/
create table MEIP_RESOURCES
(
   RESID                varchar(200) not null,
   RESVER               int not null,
   RESNAME              varchar(200),
   RESPATH              varchar(200),
   ISDYNAMIC            char(1) default 'F' comment '图标一般不选择',
   UPDATEDTM            datetime,
   UPDATEUSERID         varchar(50),
   UPDATEIP             varchar(50),
   primary key (RESID, RESVER)
);


/*==============================================================*/
/* Table: MEIP_ROLEPAGES                                        */
/*==============================================================*/
create table MEIP_ROLEPAGES
(
   ROLEID               varchar(50) not null,
   PAGEID               varchar(50) not null,
   ENABLE               char(1),
   primary key (ROLEID, PAGEID)
);

/*==============================================================*/
/* Table: MEIP_USER_DEVICES                                     */
/*==============================================================*/
create table MEIP_USER_DEVICES
(
   ID                   int not null,
   USERID               varchar(50),
   DEVICEOS             varchar(200) comment 'Android、iOS、WindowsPhone8、Windows、Windows8、Other',
   OSVER                varchar(200),
   DEVICECLASS          varchar(200) comment '手机、平板、PC',
   DEVICEID             varchar(100),
   DEVICETYPE           varchar(200) comment '设备型号',
   BUILDER              varchar(200),
   DEVICEIP             varchar(100),
   DEVICEMODEL          varchar(200),
   SCREENTYPE           varchar(200) comment 'PAD、PC、PHONE',
   SCREENSIZE           int comment '4.5=45',
   SCREENWIDTH          int,
   SCREENHEIGHT         int,
   SCREENQULITY         varchar(20) comment 'HD\SD\ND',
   PHONE                varchar(200),
   ISIM                 varchar(200),
   APPVER               varchar(200),
   ISCURRENT            char(1),
   DEVICEMAC            varchar(200),
   primary key (ID)
);

/*==============================================================*/
/* Table: MEIP_USER_SECURITY                                    */
/*==============================================================*/
create table MEIP_USER_SECURITY
(
   SECNUM               int not null AUTO_INCREMENT,
   USERID               varchar(50) not null,
   BINDTYPE             varchar(20) not null comment 'CLIENTID、MAC、PHONE、IMSI、CERT',
   BINDVALUE            varchar(200),
   BINDOS               varchar(20) comment 'ALL、Android、iOS、WindowsPhone、Windows8、Windows',
   ISONLY               char(1),
   primary key (SECNUM)
);


/*==============================================================*/
/* Table: MEIP_USERPAGES                                        */
/*==============================================================*/
create table MEIP_USERPAGES
(
   USERID               varchar(50) not null,
   PAGEID               varchar(50) not null,
   PAGESTATUS           int,
   ENABLE               char(1) comment '当该版本Page被',
   primary key (USERID, PAGEID)
);


/*==============================================================*/
/* Table: PUB_MENU                                              */
/*==============================================================*/
create table PUB_MENU
(
   ID                   varchar(50) not null,
   ICONID               varchar(50),
   NAME                 varchar(50),
   PARENTID             varchar(50),
   ORDERID              int,
   PROP                 varchar(2000),
   RESOURCEID           varchar(50),
   SYS                  int,
   ENABLE               int,
   HASCHILD             int default 0,
   primary key (ID)
);

/*==============================================================*/
/* Table: PUB_ORGAN                                             */
/*==============================================================*/
create table PUB_ORGAN
(
   ORGANID              varchar(50) not null,
   ORGANNAME            varchar(50),
   ORGANSHORTNAME       varchar(50),
   PARENTID             varchar(50),
   TYPEID               varchar(50),
   ORDERID              int,
   ENABLE               int,
   HASCHILD             int,
   LEADER               varchar(50),
   BUNDLEID             varchar(20) DEFAULT NULL,
   primary key (ORGANID)
);

/*==============================================================*/
/* Table: PUB_ORGAN_INFO                                        */
/*==============================================================*/
create table PUB_ORGAN_INFO
(
   ORGANID              varchar(50),
   INFOID               varchar(50),
   CONTENT              varchar(200),
   BUNDLEID             varchar(20) DEFAULT NULL,
   INFOTYPE             char(1) comment 'O组织机构U用户',
   primary key (ORGANID,INFOID,CONTENT)
);

/*==============================================================*/
/* Table: PUB_ORGAN_INFOTYPE                                    */
/*==============================================================*/
create table PUB_ORGAN_INFOTYPE
(
   INFOID               varchar(50) not null,
   NAME                 varchar(50),
   ICON                 varchar(20),
   BUNDLEID             varchar(20) DEFAULT NULL,
   primary key (INFOID)
);

/*==============================================================*/
/* Table: PUB_ORGAN_TYPE                                        */
/*==============================================================*/
create table PUB_ORGAN_TYPE
(
   TYPEID               varchar(50) not null,
   TYPENAME             varchar(50),
   SUBTYPES             varchar(50),
   ICONOPEN             varchar(50),
   ICONCLOSE            varchar(50),
   primary key (TYPEID)
);

/*==============================================================*/
/* Table: PUB_RESOURCES                                         */
/*==============================================================*/
create table PUB_RESOURCES
(
   ID                   varchar(50) not null,
   NAME                 varchar(50),
   PARENTID             varchar(50),
   ENABLE               int,
   ORDERID              int,
   URL                  varchar(2000),
   SYS                  int,
   HASCHILD             int,
   BUNDLEID             varchar(20) DEFAULT NULL,
   primary key (ID)
);

/*==============================================================*/
/* Table: PUB_ROLERESOURCES                                     */
/*==============================================================*/
create table PUB_ROLERESOURCES
(
   ROLEID               varchar(50) not null,
   RESOURCEID           varchar(50) not null,
   primary key (ROLEID, RESOURCEID)
);

/*==============================================================*/
/* Table: PUB_ROLES                                             */
/*==============================================================*/
create table PUB_ROLES
(
   ROLEID               varchar(50) not null,
   ROLENAME             varchar(50),
   ROLEDESC             varchar(50),
   ENABLE               int,
   ORGANID              varchar(50) comment '组织ID为空，则为公共角色',
   ISSWITCH             char(1) default 'F',
   PUB                  char(1),
   primary key (ROLEID)
);



/*==============================================================*/
/* Table: PUB_USER_ORGANS                                       */
/*==============================================================*/
create table PUB_USER_ORGANS
(
   USERID               varchar(50) not null,
   ORGANID              varchar(50) not null,
   DEPTID               varchar(50) not null,
   TEAMID               varchar(50) not null,
   primary key (USERID, ORGANID, DEPTID, TEAMID)
);


/*==============================================================*/
/* Table: PUB_USERPROXY                                         */
/*==============================================================*/
create table PUB_USERPROXY
(
   PROXYID              int not null AUTO_INCREMENT,
   USERID               varchar(50) not null,
   PROXYUSERID          varchar(50) not null,
   STARTTIME            datetime comment 'null为即时开始',
   ENDTIME              datetime comment 'null为无限制时间',
   ENABLE               char(1),
   primary key (PROXYID)
);

/*==============================================================*/
/* Table: PUB_USERROLES                                         */
/*==============================================================*/
create table PUB_USERROLES
(
   USERID               varchar(50) not null,
   ROLEID               varchar(50) not null,
   primary key (USERID, ROLEID)
);

/*==============================================================*/
/* Table: PUB_USERS                                             */
/*==============================================================*/
create table PUB_USERS
(
   USERID               varchar(50) not null,
   ORGUSERNAME          varchar(50),
   ORGPASSWORD          varchar(50),
   TEAMID               varchar(50),
   DEPTID               varchar(50),
   ORGANID              varchar(50),
   EXPIREDDATE          datetime,
   LOCKED               char(1) default '0',
   ORDERID              int,
   LVL                  int default 10,
   BUNDLEID             varchar(20) DEFAULT NULL,
   GRANTPC              char(1) default 'F',
   GARNTMOBILE          char(1) default 'T',
   DYNAMICCODE          varchar(20),
   CODEEXPIRE           datetime comment '动态密码过期时间',
   MOBILEINDEXID        varchar(200) comment 'SYSTEM、USER两个默认的，一个是系统默认、一个是用户自定义表单',
   MOBILETIMEOUT        int comment '移动平台专用单位分钟',
   MAXMOBILE            int,
   isDomainUser         char(1) DEFAULT 'F' comment '是否域用户',
   primary key (USERID)
);



-- ----------------------------
-- Procedure structure for `proc_backupLogger`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_backupLogger`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `proc_backupLogger`()
BEGIN
INSERT INTO meip_logger_archives SELECT * FROM meip_logger t  WHERE t.reciveDtm<DATE_ADD(CURRENT_DATE(), INTERVAL -30 DAY);
delete from meip_logger where reciveDtm<DATE_ADD(CURRENT_DATE(), INTERVAL -30 DAY);
 END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `BACKUPLOGGER_DAY_EVENT`
-- ----------------------------
DROP EVENT IF EXISTS `BACKUPLOGGER_DAY_EVENT`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` EVENT `BACKUPLOGGER_DAY_EVENT` ON SCHEDULE EVERY 1 DAY STARTS '2015-08-27 02:00:00' ON COMPLETION PRESERVE ENABLE DO BEGIN
	    call PROC_BACKUPLOGGER();
	END
;;
DELIMITER ;