--�û���
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
--�����
CREATE TABLE topic(
    topicid bigint(24) not null primary key auto_increment,
    userid char(20) not null,
    sort char(10),
    title char(255),
    context varchar(1024),
    img varchar(255),
    time datetime
);
--���۱�
CREATE TABLE comment(
    commentid bigint(24) not null primary key auto_increment,
    userid char(20) not null,
    topicid bigint,
    context varchar1024),
    img varchar(255),
    time datetime
);
--ϵͳ��Ϣ��
CREATE TABLE sys_message(
    messageid int not null primary key comment 'ϵͳ��Ϣid',
    message varchar(255) not null comment 'ϵͳ��Ϣ'
);
insert into sys_message(messageid,message) values ('1','�û������������');
insert into sys_message(messageid,message) values ('2','�û����ѱ�ʹ��');
--���й����
CREATE TABLE sequence(
    name varchar(32) not null primary key comment '������',
    value int not null comment '����ֵ',
    next int not null comment '����ֵ'
);
insert into sequence(name,value,next) values('topic','0','1');
insert into sequence(name,value,next) values('comment','0','1');
insert into sequence(name,value,next) values('img','0','1');
--�½��¼�,ÿ�����sequence��value
CREATE EVENT ClearSequence  
    ON SCHEDULE EVERY 1 DAY   
    DO  
    UPDATE sequence SET value=0;
--�½�һ������next_trans_num()��ÿ�ε�����ȡsequence��valueֵ
begin
 UPDATE sequence SET value=last_insert_id(value+next) WHERE name=seq_name;
 RETURN last_insert_id();
end
--�½�һ������get_trans_num()����ȡ����+ָ���������еı��
begin
 DECLARE getval bigint(24);
 SET getval = (SELECT CONCAT(DATE_FORMAT(CURDATE(), '%Y%m%d'),  LPAD((SELECT next_trans_num(seq_name)), 8, '0')));
 RETURN getval;
end



