--用户表
CREATE TABLE user(
    userid char(20) not null primary key,
    password char(20),
    phone varchar(20),
    email char(30),
    birthday Date,
    gender char(2),
    image varchar(255),
    registertime datetime
);
--话题表
CREATE TABLE topic(
    topicid bigint(24) not null primary key auto_increment,
    userid char(20) not null,
    sort char(10),
    title char(255),
    context varchar(1024),
    img varchar(255),
    time datetime
);
--评论表
CREATE TABLE comment(
    commentid bigint(24) not null primary key auto_increment,
    userid char(20) not null,
    topicid bigint,
    context varchar1024),
    img varchar(255),
    time datetime
);
--系统消息表
CREATE TABLE sys_message(
    messageid int not null primary key comment '系统消息id',
    message varchar(255) not null comment '系统消息'
);
insert into sys_message(messageid,message) values ('1','用户名或密码错误');
insert into sys_message(messageid,message) values ('2','用户名已被使用');
--序列规则表
CREATE TABLE sequence(
    name varchar(32) not null primary key comment '序列名',
    value int not null comment '序列值',
    next int not null comment '递增值'
);
insert into sequence(name,value,next) values('topic','0','1');
insert into sequence(name,value,next) values('comment','0','1');
insert into sequence(name,value,next) values('img','0','1');
--新建事件,每天清空sequence的value
CREATE EVENT ClearSequence  
    ON SCHEDULE EVERY 1 DAY   
    DO  
    UPDATE sequence SET value=0;
--新建一个函数next_trans_num()，每次递增获取sequence中value值
begin
 UPDATE sequence SET value=last_insert_id(value+next) WHERE name=seq_name;
 RETURN last_insert_id();
end
--新建一个函数get_trans_num()，获取日期+指定长度序列的编号
begin
 DECLARE getval bigint(24);
 SET getval = (SELECT CONCAT(DATE_FORMAT(CURDATE(), '%Y%m%d'),  LPAD((SELECT next_trans_num(seq_name)), 8, '0')));
 RETURN getval;
end



