insert into user values(0001,"黄","huang@qq.com","huang","你好","哦",0,"2017-1-13 12:24:16");
insert into user values(1001,"赵","zhao@qq.com",123456,"你好","哦",1,"2017-1-15 8:24:16");
insert into user values(1002,"钱","qian@qq.com",234567,"你好","哦",1,"2017-1-15 9:24:16");
insert into user values(1003,"孙","sun@qq.com",345678,"你好","哦",1,"2017-1-15 10:24:16");
insert into user values(1004,"李","li@qq.com",456789,"你好","哦",1,"2017-1-15 11:24:16");
insert into user values(1005,"周","zhou@qq.com",012345,"你好","哦",1,"2017-1-15 12:24:16");

insert into article values(1010001,"www.ithome.com","某某a","2017-1-13 13:24:16","啊","哦",2,1);
insert into article values(1010002,"www.douban.com","某某b","2017-1-13 14:24:16","嗯","好",3,1);
insert into article values(1010003,"www.zhihu.com","某某c","2017-1-13 15:24:16","如何","哦",4,1);
insert into article values(1010004,"www.baidu.com","某某d","2017-1-13 16:24:16","是","啊",1,0);

insert into comment values(600001,1010001,1003,0,"好","2017-1-14 12:20:30",0,1);
insert into comment values(600005,1010004,1004,0,"哦","2017-1-14 12:20:45",0,1);
insert into comment values(600002,1010002,1002,0,"不好","2017-1-14 12:21:11",1,1);
insert into comment values(600006,1010004,1004,0,"啊","2017-1-14 12:21:25",0,0);
insert into comment values(600003,1010001,1004,0,"哦","2017-1-14 12:21:45",1,1);
insert into comment values(600004,1010003,1001,0,"啊","2017-1-14 12:23:01",1,1);
insert into comment values(600007,1010002,1005,600002,"哈","2017-1-14 12:24:15",1,1);
insert into comment values(600008,1010001,1005,600003,"嗯","2017-1-14 12:25:11",0,1);
insert into comment values(600009,1010002,1001,600002,"哦","2017-1-14 12:30:15",0,0);
insert into comment values(600010,1010003,1002,600004,"额","2017-1-14 12:33:11",0,1);
insert into comment values(600012,1010004,1003,0,"哦","2017-1-14 12:33:13",0,1);
insert into comment values(600013,1010001,1002,0,"啊","2017-1-14 12:33:14",0,0);
insert into comment values(600011,1010003,1003,0,"哈","2017-1-14 12:40:13",0,0);

insert into category values(1,1010001);
insert into category values(1,1010002);
insert into category values(2,1010003);
insert into category values(3,1010004);
