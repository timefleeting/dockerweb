### 1. MySQL修改my.cnf配置不生效?
	2.1 参数没有写到[mysqld]下面,而是写到配置文件的末尾处
	2.2 没有重启
	2.3 没有退出当前会话
	2.4 参数写错了
	2.5 修改了错误的配置文件

### 2. MySQL读取各个my.cnf配置文件的先后顺序是:
	/etc/my.cnf
	/etc/mysql/my.cnf
	/usr/local/mysql/etc/my.cnf
	~/.my.cnf
	在MySQL中，是允许存在多个 my.cnf 配置文件的，有的能对整个系统环境产生影响，例如：/etc/my.cnf。有的则只能影响个别用户，例如：~/.my.cnf。

### 3. 出现this is incompatible with sql_mode=only_full_group_by
	3.1 错误说明
		这个错误发生在mysql 5.7 版本及以上版本会出现的问题：
		mysql .7版本默认的sql配置是:sql_mode="ONLY_FULL_GROUP_BY"，这个配置严格执行了"SQL92标准"。
		很多从5.6升级到5.7时，为了语法兼容，大部分都会选择调整sql_mode，使其保持跟5.6一致，为了尽量兼容程序。
	3.2 sql层面
		在sql执行时，出现该原因：
		简单来说就是：输出的结果是叫target list,就是select后面跟着的字段,还有一个地方group by column,就是
		group by后面跟着的字段。由于开启了ONLY_FULL_GROUP_BY的设置,所以如果一个字段没有在target list 
		和group by字段中同时出现,或者是聚合函数的值的话,那么这条sql查询是被mysql认为非法的,会报错误。
	3.3 修改sql_mode
		修改mysql配置文件,通过手动添加sql_mode的方式强制指定不需要ONLY_FULL_GROUP_BY属性
		sql_mode=NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION

### 4. 忘记密码
	4.1 mysql .7设置的密码中必须至少包含一个大写字母、一个小写字母、一个特殊符号、一个数字，密码长度至少为8个字符
	4.2 在/etc/my.cnf文件中【mysqld】后面 加入skip-grant-tables，让mysql可以免密码登录 mysql -uroot
	4.3 之后分别执行如下语句完成密码修改:
		mysql> use mysql；
		mysql> update user set authentication_string=password("NewPassword") where user="root";
		或
		mysql> alter user "root"@"localhost" identified by "NewPassword";
		mysql> flush privileges;
		mysql> show variables like '%password%'; --查看密码策略 （validate_password_policy low/medium）
		mysql> set global validate_password_policy=low 密码验证策略改成low，只检查密码长度
		退出重启mysql服务

### 5. 一般情况下 Linux 服务器默认安装 MySQL 的数据库表名是区分大小写的
	5.1 如果CentOS上安装的 MySQL 不支持表名区分大小下，则按照如下方法操作即可:
		用 root 登录，修改vim /etc/my.cnf （注意：以实际 my.cnf 配置文件路径为准）
		在 [mysqld] 节点下，加入一行： lower_case_table_names=

## 6. 外网访问设置
		mysql -u root -p
		mysql>use mysql;
		mysql>update user set host ="%" where user ="root";
		mysql>flush privileges;