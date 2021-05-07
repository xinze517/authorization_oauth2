# 客户端持久化数据表
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(0) NULL DEFAULT NULL,
  `refresh_token_validity` int(0) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
);
INSERT INTO `oauth_client_details` VALUES ('edward', 'res1', '$2a$10$2g2K2Fn4S/hX.o85ObXpZ.yGxCvjbJ85uBH5Shtv6snmaL62KtYGu', 'all', 'authorization_code,refresh_token,implicit,password,client_credentials', 'http://localhost:8001/login,http://localhost:8002/login', NULL, 7200, 604800, NULL, 'true');

# 创建身份表
create table t_role
(
    id      bigint auto_increment primary key,
    name    varchar(255) not null unique,
    name_zh varchar(255) not null
);

# 创建用户表
create table t_user
(
    id       bigint auto_increment primary key,
    password varchar(255) not null,
    username varchar(255) not null unique ,
    enabled  bool         not null
);

# 创建用户身份对应表
create table t_users_roles
(
    id      bigint auto_increment primary key,
    user_id bigint not null,
    role_id bigint not null,
    constraint FK7l00c7jb4804xlpmk1k26texy
        foreign key (user_id) references t_user (id),
    constraint FKj47yp3hhtsoajht9793tbdrp4
        foreign key (role_id) references t_role (id)
);

# 持久化令牌
create table persistent_logins
(
    username  varchar(64) not null,
    series    varchar(64) primary key,
    token     varchar(64) not null,
    last_used timestamp   not null
);

# 生成角色数据
INSERT INTO t_role (name, name_zh)
VALUES ('ROLE_admin', '管理员'),
       ('ROLE_user', '普通用户');