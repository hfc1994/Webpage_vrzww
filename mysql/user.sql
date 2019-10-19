-- phpMyAdmin SQL Dump
-- version 3.4.8
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 05 月 28 日 22:45
-- 服务器版本: 5.5.28
-- PHP 版本: 5.3.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `hfc1994`
--

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uId` int(16) NOT NULL AUTO_INCREMENT,
  `username` char(16) NOT NULL,
  `loginName` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `question` varchar(20) NOT NULL,
  `answer` varchar(20) NOT NULL,
  `identity` char(1) NOT NULL,
  `registerTime` datetime NOT NULL,
  `headPortrait` varchar(256) DEFAULT NULL,
  `deleteState` char(1) NOT NULL,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10011 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uId`, `username`, `loginName`, `password`, `question`, `answer`, `identity`, `registerTime`, `headPortrait`, `deleteState`) VALUES
(10000, '不明情况的吃瓜管理员', 'huang@qq.com', '1F5523A8F535289B3401B29958D01B2966ED61D2', '你好', '哦', '0', '2017-01-13 12:24:16', '/heads/admin.jpg', '1'),
(10001, '赵', 'zhao@qq.com', '7C4A8D09CA3762AF61E59520943DC26494F8941B', '你好', '哦', '1', '2017-01-15 08:24:16', '/heads/zhao.jpg', '1'),
(10002, '钱', 'qian@qq.com', '7C4A8D09CA3762AF61E59520943DC26494F8941B', '你好', '哦', '1', '2017-01-15 09:24:16', '/heads/qian.jpg', '1'),
(10003, '孙', 'sun@qq.com', '7C4A8D09CA3762AF61E59520943DC26494F8941B', '你好', '哦', '1', '2017-01-15 10:24:16', '/heads/sun.jpg', '1'),
(10004, '李', 'li@qq.com', '7C4A8D09CA3762AF61E59520943DC26494F8941B', '你好', '哦', '1', '2017-01-15 11:24:16', '/heads/li.jpg', '1'),
(10005, '周', 'zhou@qq.com', '7C4A8D09CA3762AF61E59520943DC26494F8941B', '你好', '哦', '1', '2017-01-15 12:24:16', '/heads/zhou.jpg', '1'),
(10006, '吴', 'qu@qq.com', '7C4A8D09CA3762AF61E59520943DC26494F8941B', '你好', '哦', '1', '2017-01-16 12:24:16', '/heads/qu.jpg', '0'),
(10007, 'sd', 'ddd', '7C4A8D09CA3762AF61E59520943DC26494F8941B', 'fdd', 'fd', '1', '2017-02-08 01:00:25', '/heads/sd.jpg', '1'),
(10008, '吴', 'wu@qq.com', '7C4A8D09CA3762AF61E59520943DC26494F8941B', '你好', '哦', '1', '2017-02-09 00:49:19', '/heads/wu.jpg', '0'),
(10009, 'smk', 'smk@qq.com', '1F5523A8F535289B3401B29958D01B2966ED61D2', 'smk', 'smk', '0', '2017-03-10 13:31:30', '/heads/smk.jpg', '1'),
(10010, 'huangweisuo', '1193184752@qq.com', '1D86D93B9A0042E53151FDD1D81F0371A2E46D3B', '牛皮', '蛇皮猪', '1', '2017-03-10 14:14:30', '/heads/zhou.jpg', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
