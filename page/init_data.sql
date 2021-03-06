/* clean data
TRUNCATE TABLE page;
TRUNCATE TABLE api;
TRUNCATE TABLE operation;
TRUNCATE TABLE operation_api;
TRUNCATE TABLE page_api;
TRUNCATE TABLE white_list;
TRUNCATE TABLE `user`;
TRUNCATE TABLE role;
TRUNCATE TABLE user_role;
TRUNCATE TABLE permission;
*/

-- 页面数据
INSERT INTO `page`(id, CODE, NAME, pinyin, initial, url, icon, weight, LEVEL, parent_id) VALUES
('07b70b41-d718-424a-b481-545d61509427', 'auth', '授权管理', 'shouquanguanli', 'sqgl', NULL, NULL, '1', '0', NULL),
('a305284a-cc47-4064-906f-f16fc07c3310', 'auth-user', '用户管理', 'yonghuguanli', 'yhgl', '/auth/user/', NULL, '1', '1', '07b70b41-d718-424a-b481-545d61509427'),
('a10e57aa-00e6-4391-b708-87b4c45f3387', 'auth-role', '角色管理', 'jueseguanli', 'jsgl', '/auth/role/', NULL, '2', '1', '07b70b41-d718-424a-b481-545d61509427');

-- 操作数据
INSERT INTO `operation`(id, CODE, NAME, page_id) VALUES
('3a229249-cd16-4529-a6d3-4477124c7ed6', 'add', '新增', 'a10e57aa-00e6-4391-b708-87b4c45f3387'),
('00704959-1966-4fb7-9546-16efee9bf8b5', 'editable', '编辑', 'a10e57aa-00e6-4391-b708-87b4c45f3387'),
('f0bc0f68-6a86-465f-93f1-681dd612f6cf', 'abandonable', '作废', 'a10e57aa-00e6-4391-b708-87b4c45f3387'),
('1a7b7d45-fe19-4d3b-a3f0-6b634f170855', 'add', '新增', 'a305284a-cc47-4064-906f-f16fc07c3310'),
('7404d09d-5f4d-4cf8-88b4-d793ae870c17', 'editable', '编辑', 'a305284a-cc47-4064-906f-f16fc07c3310'),
('753fe40a-9502-4b9c-a716-77bcf8972ff4', 'disable', '冻结', 'a305284a-cc47-4064-906f-f16fc07c3310'),
('27e38283-1880-489e-a1f9-9501cd895e9f', 'enable', '解冻', 'a305284a-cc47-4064-906f-f16fc07c3310');

-- api
INSERT INTO `api`(id, NAME, http_method, url) VALUES
('122f3e34-42c4-4b3d-b6c7-cd7758e98ad0', '获取角色列表', 'GET', '/api/v1/roles'),
('5bef679f-6720-4a21-9053-57c73df50fcc', '新增角色', 'POST', '/api/v1/roles'),
('f2aabcd8-6487-4d1a-8ca9-3f8638486655', '修改角色', 'PUT', '/api/v1/roles/[0-9a-z-A-Z]+'),
('e61b75d0-6f84-4f06-9167-de45eb2c46c0', '获取角色详情', 'GET', '/api/v1/roles/[0-9a-z-A-Z]+'),
('a7c50896-c1e2-4e65-a495-fc5cfbdece8e', '修改角色权限以外的信息', 'PUT', '/api/v1/roles/[0-9a-z-A-Z]+/info'),
('8c68283c-651a-4e07-978f-e41c0beb1dff', '作废角色', 'PUT', '/api/v1/roles/[0-9a-z-A-Z]+/abandon'),
('2caf2455-5c3c-4f15-8364-ec8a4d16da58', '获取page列表', 'GET', '/api/v1/pages'),
('2ac0a6d5-f280-45f4-b61d-f1fbe531b694', '获取page详情', 'GET', '/api/v1/pages/[0-9a-z-A-Z]+'),
('bec0b4af-6f7a-4de7-8c0f-365e18c9e80b', '根据条件查询用户信息', 'GET', '/api/v1/users'),
('fe82e193-2f46-4377-86ab-7b90b28d8a3e', '新增用户', 'POST', '/api/v1/users'),
('9f19d4e0-bc7d-4116-9645-47dab1a0f419', '用户详细信息', 'GET', '/api/v1/users/[0-9a-z-A-Z]+'),
('8f245434-0e90-4ff7-9198-8832313ffb62', '修改用户信息', 'PUT', '/api/v1/users/[0-9a-z-A-Z]+'),
('5f3ae617-a1ff-4052-858a-58f65171bbeb', '冻结用户', 'PUT', '/api/v1/users/[0-9a-z-A-Z]+/disable'),
('0d0f8b8c-2adb-4d58-8b31-a8dd77b9e909', '解冻用户', 'PUT', '/api/v1/users/[0-9a-z-A-Z]+/enable'),
('fcfb995e-deeb-11e7-a6ed-00e04c368b96', '获取当前用户信息', 'GET', '/api/v1/users/me'),
('f02caa0e-4bba-42d0-aa1e-48c0c9c4eacf', '获取当前用户可访问的菜单项', 'GET', '/api/v1/users/me/pages'),
('a40194b7-7492-45e8-92d5-e600e5e98d8c', '获取指定页当前用户的权限', 'GET', '/api/v1/users/me/pages/[0-9a-z-A-Z]+'),
('fad44448-e077-11e7-b4fe-005056b56136', '注销', 'POST', '/api/v1/logout');

-- 页面 api 关系
INSERT INTO `page_api`(page_id, api_id) VALUES
('a10e57aa-00e6-4391-b708-87b4c45f3387', '122f3e34-42c4-4b3d-b6c7-cd7758e98ad0'),
('a10e57aa-00e6-4391-b708-87b4c45f3387', 'e61b75d0-6f84-4f06-9167-de45eb2c46c0'),
('a305284a-cc47-4064-906f-f16fc07c3310', 'bec0b4af-6f7a-4de7-8c0f-365e18c9e80b');

-- 操作 api 关系
INSERT INTO `operation_api`(operation_id, api_id) VALUES
 ('3a229249-cd16-4529-a6d3-4477124c7ed6', '2caf2455-5c3c-4f15-8364-ec8a4d16da58'),
 ('3a229249-cd16-4529-a6d3-4477124c7ed6', '2ac0a6d5-f280-45f4-b61d-f1fbe531b694'),
 ('3a229249-cd16-4529-a6d3-4477124c7ed6', '5bef679f-6720-4a21-9053-57c73df50fcc'),
 ('00704959-1966-4fb7-9546-16efee9bf8b5', '2caf2455-5c3c-4f15-8364-ec8a4d16da58'),
 ('00704959-1966-4fb7-9546-16efee9bf8b5', '2ac0a6d5-f280-45f4-b61d-f1fbe531b694'),
 ('00704959-1966-4fb7-9546-16efee9bf8b5', 'f2aabcd8-6487-4d1a-8ca9-3f8638486655'),
 ('00704959-1966-4fb7-9546-16efee9bf8b5', 'a7c50896-c1e2-4e65-a495-fc5cfbdece8e'),
 ('f0bc0f68-6a86-465f-93f1-681dd612f6cf', '8c68283c-651a-4e07-978f-e41c0beb1dff'),
 ('1a7b7d45-fe19-4d3b-a3f0-6b634f170855', 'fe82e193-2f46-4377-86ab-7b90b28d8a3e'),
 ('7404d09d-5f4d-4cf8-88b4-d793ae870c17', '8f245434-0e90-4ff7-9198-8832313ffb62'),
 ('753fe40a-9502-4b9c-a716-77bcf8972ff4', '5f3ae617-a1ff-4052-858a-58f65171bbeb'),
 ('27e38283-1880-489e-a1f9-9501cd895e9f', '0d0f8b8c-2adb-4d58-8b31-a8dd77b9e909');

INSERT INTO `white_list` (api_id) VALUES
('fcfb995e-deeb-11e7-a6ed-00e04c368b96'),
('f02caa0e-4bba-42d0-aa1e-48c0c9c4eacf'),
('a40194b7-7492-45e8-92d5-e600e5e98d8c'),
('fad44448-e077-11e7-b4fe-005056b56136');

SET @enterprise_id = '786b67b6-b424-11e7-b9e5-005056af50a8';
SET @creator_name = 'sql_import';
SET @creator_id = '00000000-0000-0000-0000-000000000000';
SET @admin_username = 'admin' COLLATE utf8_unicode_ci;
SET @admin_name = '管理员' COLLATE utf8_unicode_ci;

-- 初始化管理员账号
INSERT INTO `user`(id, NAME, username, create_time, creator_name, creator_id, enterprise_id, STATUS, row_version)
SELECT UUID(), @admin_name, @admin_username, NOW(), @creator_name, @creator_id, @enterprise_id, 2, CURRENT_TIMESTAMP() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `user` WHERE username = @admin_username);

SET @user_id = (SELECT id FROM `user` WHERE username = @admin_username);

INSERT INTO role(id, NAME, create_time, creator_name, creator_id, enterprise_id, STATUS, row_version)
SELECT UUID(), @admin_name, NOW(),  @creator_name, @creator_id, @enterprise_id, 2, CURRENT_TIMESTAMP() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `role` WHERE NAME = @admin_name);

SET @role_id = (SELECT id FROM `role` WHERE NAME = @admin_name);

INSERT INTO user_role (user_id, role_id)
SELECT @user_id, @role_id FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM user_role WHERE user_id = @user_id AND role_id = @role_id);

INSERT INTO permission (role_id, related_id, TYPE) 
SELECT @role_id, page.id, 1 FROM page 
WHERE NOT EXISTS (SELECT 1 FROM page AS sub WHERE page.id = sub.parent_id)
AND NOT EXISTS (SELECT 1 FROM permission WHERE TYPE = 1 AND role_id = @role_id AND permission.related_id = page.id);

INSERT INTO permission (role_id, related_id, TYPE) 
SELECT @role_id, operation.id, 2 FROM operation
WHERE NOT EXISTS (SELECT 1 FROM permission WHERE TYPE = 2 AND role_id = @role_id AND permission.related_id = operation.id);
