-- phpMyAdmin SQL Dump
-- version 3.4.8
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 05 月 28 日 22:46
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
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `cId` int(16) NOT NULL AUTO_INCREMENT,
  `aId` int(16) NOT NULL,
  `uId` int(16) NOT NULL,
  `pId` int(16) NOT NULL,
  `content` varchar(150) NOT NULL,
  `postTime` datetime NOT NULL,
  `isLeaf` char(1) NOT NULL,
  `deleteState` char(1) NOT NULL,
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=600183 ;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`cId`, `aId`, `uId`, `pId`, `content`, `postTime`, `isLeaf`, `deleteState`) VALUES
(600001, 1010001, 10003, 0, '好', '2017-01-14 12:20:30', '1', '0'),
(600002, 1010002, 10002, 0, '不好', '2017-01-14 12:21:11', '1', '1'),
(600003, 1010001, 10004, 0, '哦', '2017-01-14 12:21:45', '1', '1'),
(600004, 1010003, 10001, 0, '啊', '2017-01-14 12:23:01', '1', '1'),
(600005, 1010004, 10004, 0, '哦', '2017-01-14 12:20:45', '0', '0'),
(600006, 1010004, 10004, 0, '啊', '2017-01-14 12:21:25', '0', '0'),
(600007, 1010002, 10005, 600002, '回复钱 哈', '2017-01-14 12:24:15', '0', '1'),
(600008, 1010001, 10005, 600003, '回复李 嗯', '2017-01-14 12:25:11', '1', '1'),
(600009, 1010002, 10001, 600002, '回复钱 哦', '2017-01-14 12:30:15', '0', '1'),
(600010, 1010003, 10002, 600004, '回复赵 额', '2017-01-14 12:33:11', '1', '0'),
(600011, 1010003, 10003, 0, '哈', '2017-01-14 12:40:13', '0', '1'),
(600012, 1010004, 10003, 0, '哦', '2017-01-14 12:33:13', '0', '0'),
(600013, 1010001, 10002, 0, '啊', '2017-01-14 12:33:14', '0', '0'),
(600014, 1010003, 10000, 0, 'www', '2017-02-17 02:12:35', '1', '1'),
(600017, 1010003, 10000, 0, '达到', '2017-02-17 02:18:48', '0', '1'),
(600018, 1010003, 10000, 0, '事情', '2017-02-17 02:19:28', '1', '1'),
(600019, 1010003, 10000, 0, '去', '2017-02-17 02:19:34', '0', '1'),
(600020, 1010003, 10000, 0, '是', '2017-02-17 02:19:47', '0', '1'),
(600021, 1010003, 10000, 0, '的', '2017-02-17 02:19:49', '0', '1'),
(600022, 1010003, 10000, 0, '飞', '2017-02-17 02:19:51', '0', '1'),
(600023, 1010003, 10000, 0, '个', '2017-02-17 02:19:58', '0', '1'),
(600024, 1010003, 10000, 0, '好', '2017-02-17 02:20:00', '0', '1'),
(600025, 1010001, 10000, 0, '34', '2017-02-18 23:20:51', '0', '1'),
(600026, 1010001, 10000, 0, 'll', '2017-02-18 23:26:29', '0', '1'),
(600027, 1010001, 10000, 0, 'ww', '2017-02-18 23:37:17', '0', '1'),
(600028, 1010001, 10000, 0, 'qqqqwwwww', '2017-02-18 23:40:10', '0', '1'),
(600029, 1010005, 10000, 0, 'err', '2017-02-18 23:59:23', '0', '1'),
(600030, 1010005, 10000, 0, 'wwwww', '2017-02-19 00:01:43', '0', '1'),
(600031, 1010005, 10000, 0, '想嘻嘻嘻想', '2017-02-19 00:10:53', '0', '1'),
(600032, 1010005, 10000, 0, '信息时代', '2017-02-19 00:12:38', '0', '1'),
(600033, 1010005, 10000, 0, '从线程执行', '2017-02-19 00:14:29', '0', '1'),
(600034, 1010005, 10000, 0, 'w11w1', '2017-02-19 00:20:00', '0', '1'),
(600035, 1010005, 10000, 0, 'w11w1', '2017-02-19 00:22:37', '0', '1'),
(600036, 1010005, 10000, 0, 'plp', '2017-02-19 00:23:39', '0', '1'),
(600037, 1010005, 10000, 0, 'ytt', '2017-02-19 00:25:01', '0', '1'),
(600038, 1010005, 10000, 0, 'yuyt', '2017-02-19 00:25:37', '0', '1'),
(600039, 1010005, 10000, 0, 'uuuuu', '2017-02-19 00:25:50', '0', '1'),
(600040, 1010003, 10000, 600018, '回复不明情况的吃瓜管理员 sasas', '2017-02-19 00:31:42', '0', '1'),
(600041, 1010001, 10000, 600008, '回复周 hfff', '2017-02-19 11:05:22', '1', '1'),
(600042, 1010001, 10000, 600008, '回复周 asdasdasd', '2017-02-19 11:07:22', '1', '1'),
(600043, 1010001, 10000, 600008, '回复周 四的十大', '2017-02-19 12:03:00', '0', '1'),
(600044, 1010001, 10000, 600003, '回复李 阿大声道', '2017-02-19 12:03:08', '0', '1'),
(600045, 1010001, 10000, 600042, '回复不明情况的吃瓜管理员 大舍大得', '2017-02-19 12:03:39', '0', '1'),
(600046, 1010001, 10000, 600042, '回复不明情况的吃瓜管理员 sa', '2017-02-19 13:33:47', '0', '1'),
(600047, 1010001, 10000, 600041, '回复不明情况的吃瓜管理员 ssaaaa', '2017-02-19 13:37:36', '0', '1'),
(600048, 1010001, 10000, 600003, '回复李 xxxxx', '2017-02-19 13:38:09', '0', '1'),
(600049, 1010001, 10000, 600008, '回复周 xxxxxaaaa', '2017-02-19 13:38:19', '0', '1'),
(600050, 1010002, 10000, 0, '气球', '2017-02-19 22:59:19', '1', '1'),
(600051, 1010002, 10000, 600050, '回复不明情况的吃瓜管理员 我问问', '2017-02-19 22:59:56', '0', '1'),
(600052, 1010002, 10000, 0, '事实上', '2017-02-19 23:04:29', '0', '1'),
(600053, 1010002, 10000, 0, '等等等', '2017-02-19 23:07:56', '0', '1'),
(600054, 1010002, 10000, 0, '从', '2017-02-19 23:14:18', '1', '1'),
(600055, 1010002, 10000, 0, '执行撤销', '2017-02-19 23:16:18', '0', '1'),
(600056, 1010002, 10000, 0, '辅导', '2017-02-19 23:25:09', '0', '1'),
(600057, 1010002, 10000, 0, 'asdas', '2017-02-19 23:25:48', '0', '1'),
(600058, 1010002, 10000, 600054, '回复不明情况的吃瓜管理员 asdasdasdasd', '2017-02-19 23:25:58', '0', '1'),
(600059, 1010003, 10000, 600010, '回复钱 vcvc', '2017-02-20 00:06:23', '1', '0'),
(600060, 1010003, 10000, 600059, '回复不明情况的吃瓜管理员 asdasdas', '2017-02-20 00:07:00', '1', '0'),
(600061, 1010003, 10000, 600060, '回复不明情况的吃瓜管理员 哈哈哈哈', '2017-02-20 00:48:50', '0', '1'),
(600062, 1010003, 10000, 600014, '回复不明情况的吃瓜管理员 拖拖拖拖拖拖', '2017-02-20 00:51:22', '1', '1'),
(600063, 1010003, 10000, 600062, '回复不明情况的吃瓜管理员 嘎嘎嘎嘎嘎嘎', '2017-02-20 00:52:02', '0', '1'),
(600064, 1010005, 10000, 0, '防守打法', '2017-02-28 01:01:25', '0', '1'),
(600065, 1010005, 10000, 0, '湖广会馆', '2017-02-28 01:01:32', '0', '1'),
(600066, 1010005, 10000, 0, '玩儿', '2017-02-28 01:01:35', '0', '1'),
(600067, 1010005, 10000, 0, 'IOP', '2017-02-28 01:01:40', '0', '1'),
(600068, 1010005, 10000, 0, '荣耀', '2017-02-28 01:01:44', '0', '1'),
(600069, 1010005, 10000, 0, 'uiyui', '2017-02-28 01:01:50', '0', '1'),
(600070, 1010005, 10000, 0, 'iuiu', '2017-02-28 01:01:53', '0', '1'),
(600071, 1010005, 10000, 0, 'poip', '2017-02-28 01:01:55', '0', '1'),
(600072, 1010005, 10000, 0, 'm,.m,', '2017-02-28 01:01:59', '0', '1'),
(600073, 1010005, 10000, 0, 'm,.m,', '2017-02-28 01:02:07', '0', '1'),
(600074, 1010005, 10000, 0, 'hjkjh', '2017-02-28 01:02:10', '0', '1'),
(600075, 1010001, 10000, 600001, '??? ?', '2017-03-01 15:06:01', '0', '0'),
(600076, 1010001, 10000, 0, '??', '2017-03-01 19:31:18', '0', '1'),
(600077, 1010003, 10000, 600004, '??? ??test', '2017-03-01 22:06:10', '0', '0'),
(600078, 1010022, 10001, 0, '??', '2017-03-10 11:35:57', '0', '1'),
(600079, 1010042, 10001, 0, 'fsd', '2017-03-11 13:13:11', '1', '1'),
(600080, 1010042, 10001, 0, 'sdfds', '2017-03-11 13:13:14', '0', '1'),
(600081, 1010042, 10001, 0, 'sdfsffsdf', '2017-03-11 13:13:17', '0', '1'),
(600082, 1010042, 10001, 0, 'sdfsfdff', '2017-03-11 13:13:20', '0', '1'),
(600083, 1010042, 10001, 0, '我test啊', '2017-03-11 23:43:55', '0', '1'),
(600084, 1010042, 10002, 0, '?', '2017-03-12 00:24:37', '0', '1'),
(600085, 1010042, 10003, 0, '中文', '2017-03-12 00:36:14', '0', '1'),
(600086, 1010042, 10001, 600079, '回复赵 哦', '2017-03-13 02:27:11', '0', '1'),
(600087, 1010044, 10000, 0, '还行', '2017-03-14 23:57:33', '0', '1'),
(600088, 1010057, 10001, 0, '期待', '2017-03-17 14:11:40', '1', '1'),
(600089, 1010057, 10001, 0, '挺有意思', '2017-03-17 14:11:49', '1', '1'),
(600090, 1010056, 10001, 0, 'HoloLens挺厉害的样子', '2017-03-17 14:12:14', '0', '1'),
(600091, 1010055, 10001, 0, '刺激', '2017-03-17 14:12:40', '1', '1'),
(600092, 1010054, 10001, 0, '自high', '2017-03-17 14:12:56', '0', '1'),
(600093, 1010053, 10001, 0, '挺有意思的样子', '2017-03-17 14:13:12', '0', '1'),
(600094, 1010052, 10001, 0, '四国以', '2017-03-17 14:13:31', '0', '1'),
(600095, 1010051, 10001, 0, '厉害', '2017-03-17 14:13:46', '0', '1'),
(600096, 1010057, 10002, 600088, '回复赵 哦', '2017-03-17 14:14:17', '1', '1'),
(600097, 1010057, 10002, 0, '可以可以', '2017-03-17 14:14:24', '0', '1'),
(600098, 1010056, 10002, 0, '还不错嘛', '2017-03-17 14:14:36', '1', '1'),
(600099, 1010055, 10002, 0, '啦啦啦', '2017-03-17 14:14:59', '0', '1'),
(600100, 1010054, 10002, 0, '楼上+1', '2017-03-17 14:15:11', '0', '1'),
(600101, 1010053, 10002, 0, '恩', '2017-03-17 14:15:22', '1', '1'),
(600102, 1010052, 10002, 0, '哦', '2017-03-17 14:15:37', '0', '1'),
(600103, 1010051, 10002, 0, '(⊙o⊙)', '2017-03-17 14:15:46', '1', '1'),
(600104, 1010049, 10002, 0, '电影不好看', '2017-03-17 14:16:10', '1', '1'),
(600105, 1010048, 10002, 0, '上上下下左右左右...不好意思，走错片场了...(⊙o⊙)', '2017-03-17 14:16:49', '1', '1'),
(600106, 1010057, 10003, 0, '换了个新头像', '2017-03-17 14:17:19', '1', '1'),
(600107, 1010056, 10003, 600098, '回复钱 是啊', '2017-03-17 14:17:35', '0', '1'),
(600108, 1010054, 10003, 0, '楼上-2', '2017-03-17 14:17:49', '0', '1'),
(600109, 1010053, 10003, 600101, '回复钱 真高冷', '2017-03-17 14:18:14', '1', '1'),
(600110, 1010052, 10003, 0, '看看去', '2017-03-17 14:18:28', '0', '1'),
(600111, 1010051, 10003, 600103, '回复钱 (⊙o⊙)', '2017-03-17 14:18:43', '0', '1'),
(600112, 1010050, 10003, 0, '沙发', '2017-03-17 14:18:54', '0', '1'),
(600113, 1010057, 10004, 600106, '回复孙 o', '2017-03-17 14:19:29', '0', '1'),
(600114, 1010056, 10004, 0, '可以模拟开船了', '2017-03-17 14:19:55', '0', '1'),
(600115, 1010055, 10004, 0, '那还要船干嘛', '2017-03-17 14:20:18', '0', '1'),
(600116, 1010054, 10004, 0, '五花肉博物馆', '2017-03-17 14:20:55', '1', '1'),
(600117, 1010053, 10004, 0, '啥时候上船', '2017-03-17 14:21:12', '0', '1'),
(600118, 1010052, 10004, 0, '老家', '2017-03-17 14:21:22', '0', '1'),
(600119, 1010051, 10004, 0, '哦', '2017-03-17 14:21:36', '0', '1'),
(600120, 1010050, 10004, 0, '板凳', '2017-03-17 14:21:57', '0', '1'),
(600121, 1010049, 10004, 600104, '回复钱 是的', '2017-03-17 14:22:12', '0', '1'),
(600122, 1010048, 10004, 600105, '回复钱 你是猴子请来的...', '2017-03-17 14:22:30', '0', '1'),
(600123, 1010057, 10005, 600106, '回复孙 哦', '2017-03-17 14:23:04', '0', '1'),
(600124, 1010056, 10005, 0, '我朝也要整一个', '2017-03-17 14:23:30', '1', '1'),
(600125, 1010055, 10005, 0, '我朝也要整一个', '2017-03-17 14:23:41', '1', '1'),
(600126, 1010054, 10005, 600116, '回复李 金家博物馆', '2017-03-17 14:23:58', '1', '1'),
(600127, 1010053, 10005, 0, '我朝也要整一个', '2017-03-17 14:24:06', '0', '1'),
(600128, 1010052, 10005, 0, '我朝也要整一个', '2017-03-17 14:24:14', '0', '1'),
(600129, 1010051, 10005, 0, '我朝也要整一个', '2017-03-17 14:24:23', '0', '1'),
(600130, 1010049, 10005, 600104, '回复钱 我朝也要整一个', '2017-03-17 14:24:36', '0', '1'),
(600131, 1010048, 10005, 0, '我朝也要整一个', '2017-03-17 14:24:44', '0', '1'),
(600132, 1010057, 10001, 600096, '回复钱 换号评论好麻烦', '2017-03-17 14:25:37', '1', '1'),
(600133, 1010057, 10001, 600106, '回复孙 渣渣', '2017-03-17 14:25:46', '1', '1'),
(600134, 1010055, 10001, 600125, '回复周 就你话多', '2017-03-17 14:26:15', '1', '1'),
(600135, 1010054, 10001, 600126, '回复周 就你话多', '2017-03-17 14:26:36', '1', '1'),
(600136, 1010053, 10001, 600109, '回复孙 是啊', '2017-03-17 14:26:49', '0', '1'),
(600137, 1010057, 10005, 600132, '回复赵 是的啊', '2017-03-17 14:27:33', '1', '1'),
(600138, 1010055, 10005, 600134, '回复赵 你想咋滴', '2017-03-17 14:27:53', '0', '1'),
(600139, 1010054, 10005, 600135, '回复赵 揍你信不信', '2017-03-17 14:28:14', '0', '1'),
(600140, 1010057, 10002, 0, '多刷两楼', '2017-03-17 14:28:46', '0', '1'),
(600141, 1010057, 10002, 0, '楼', '2017-03-17 14:28:52', '0', '1'),
(600142, 1010057, 10000, 600132, '回复赵 那能咋办呢', '2017-03-17 14:29:30', '1', '1'),
(600143, 1010057, 10000, 0, '困', '2017-03-17 14:29:37', '0', '1'),
(600144, 1010057, 10000, 600133, '回复赵 撞头像了', '2017-03-17 14:29:55', '0', '1'),
(600145, 1010057, 10003, 0, '没沙发', '2017-03-17 14:30:34', '0', '1'),
(600146, 1010057, 10003, 0, '没地板', '2017-03-17 14:30:38', '1', '1'),
(600147, 1010057, 10003, 600146, '回复孙 错了，是没板凳', '2017-03-17 14:30:58', '0', '1'),
(600148, 1010057, 10003, 0, '只有地板', '2017-03-17 14:31:05', '0', '1'),
(600149, 1010057, 10003, 600089, '回复赵 恩', '2017-03-17 14:31:14', '0', '1'),
(600150, 1010057, 10003, 600133, '回复赵 你才渣渣', '2017-03-17 14:31:26', '0', '1'),
(600151, 1010057, 10004, 0, '地板咋了', '2017-03-17 14:32:05', '0', '1'),
(600152, 1010057, 10004, 0, '不行啊', '2017-03-17 14:32:12', '1', '1'),
(600153, 1010057, 10004, 600142, '回复不明情况的吃瓜管理员 弃疗', '2017-03-17 14:32:22', '0', '1'),
(600154, 1010056, 10004, 0, '啦啦啦', '2017-03-17 14:32:44', '0', '1'),
(600155, 1010056, 10004, 0, '开船啦', '2017-03-17 14:32:50', '0', '1'),
(600156, 1010056, 10004, 0, '要人上船嘛', '2017-03-17 14:33:00', '0', '1'),
(600157, 1010056, 10004, 0, '船票5毛', '2017-03-17 14:33:14', '0', '1'),
(600158, 1010056, 10004, 0, '错过再等一年', '2017-03-17 14:33:28', '1', '1'),
(600159, 1010055, 10004, 0, '哦', '2017-03-17 14:33:38', '0', '1'),
(600160, 1010055, 10004, 0, '哦', '2017-03-17 14:33:41', '0', '1'),
(600161, 1010055, 10004, 0, '额', '2017-03-17 14:33:45', '0', '1'),
(600162, 1010055, 10004, 0, '额', '2017-03-17 14:33:47', '0', '1'),
(600163, 1010057, 10000, 600106, '回复孙 话说，我换头像的功能还没完善好的啊', '2017-03-17 14:34:45', '0', '1'),
(600164, 1010057, 10000, 600152, '回复李 有理', '2017-03-17 14:34:57', '0', '1'),
(600165, 1010056, 10000, 600158, '回复李 那就等吧', '2017-03-17 14:35:15', '0', '1'),
(600166, 1010056, 10000, 0, 'lll', '2017-03-17 14:35:23', '0', '1'),
(600167, 1010056, 10000, 0, '嗨哈', '2017-03-17 14:35:36', '0', '1'),
(600168, 1010056, 10000, 600124, '回复周 勿发表非法言论', '2017-03-17 14:35:50', '1', '1'),
(600169, 1010055, 10000, 0, '困', '2017-03-17 14:36:03', '0', '1'),
(600170, 1010056, 10005, 600168, '回复不明情况的吃瓜管理员 想咋滴', '2017-03-17 14:36:39', '0', '1'),
(600171, 1010056, 10005, 0, 'QQQQ', '2017-03-17 14:36:48', '0', '1'),
(600172, 1010056, 10005, 0, 'QAQ', '2017-03-17 14:36:52', '0', '1'),
(600173, 1010056, 10005, 0, 'QWQ', '2017-03-17 14:36:55', '0', '1'),
(600174, 1010055, 10005, 0, '呃呃呃', '2017-03-17 14:37:20', '0', '1'),
(600175, 1010055, 10005, 0, 'www', '2017-03-17 14:37:22', '0', '1'),
(600176, 1010055, 10005, 0, '去去去', '2017-03-17 14:37:25', '0', '1'),
(600177, 1010055, 10005, 0, '柔柔弱弱', '2017-03-17 14:37:28', '0', '1'),
(600178, 1010055, 10005, 0, '吞吞吐吐', '2017-03-17 14:37:32', '0', '1'),
(600179, 1010055, 10005, 0, '一样一样', '2017-03-17 14:37:35', '0', '1'),
(600180, 1010055, 10001, 600091, '回复赵 哦', '2017-03-25 17:10:29', '1', '1'),
(600181, 1010055, 10001, 600180, '回复赵 0', '2017-03-25 17:10:48', '0', '1'),
(600182, 1010057, 10001, 600137, '回复周 ddd', '2017-04-11 10:16:36', '0', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;