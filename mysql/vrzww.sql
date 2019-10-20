/*
Navicat MySQL Data Transfer

Source Server         : hfc
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : vrzww

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-03-01 02:38:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aId` int(16) NOT NULL AUTO_INCREMENT,
  `source` varchar(32) DEFAULT NULL,
  `author` varchar(16) NOT NULL,
  `publishTime` datetime NOT NULL,
  `title` varchar(16) NOT NULL,
  `content` text NOT NULL,
  `mainPic` varchar(128) NOT NULL,
  `likes` int(16) DEFAULT NULL,
  `deleteState` char(1) NOT NULL,
  PRIMARY KEY (`aId`)
) ENGINE=InnoDB AUTO_INCREMENT=1010040 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1010001', 'www.ithome.com', '某某a', '2017-01-13 13:24:16', '啊1', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '2', '1');
INSERT INTO `article` VALUES ('1010002', 'www.douban.com', '某某b', '2017-01-13 14:24:16', '嗯2', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '3', '1');
INSERT INTO `article` VALUES ('1010003', 'www.zhihu.com', '某某c', '2017-01-13 15:24:16', '如何3', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '4', '1');
INSERT INTO `article` VALUES ('1010004', 'www.baidu.com', '某某d', '2017-01-13 16:24:16', '是shan', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '1', '0');
INSERT INTO `article` VALUES ('1010005', 'www.zhihu.com', '某某c', '2017-01-13 17:24:16', '是4', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '6', '1');
INSERT INTO `article` VALUES ('1010006', 'www.hupu.com', '某某e', '2017-01-13 17:34:54', '是5', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '1', '1');
INSERT INTO `article` VALUES ('1010007', 'www.douban.com', '某某f', '2017-01-13 17:46:10', '是6', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '5', '1');
INSERT INTO `article` VALUES ('1010008', 'www.ithome.com', '某某g', '2017-01-13 18:16:19', '是7', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '2', '1');
INSERT INTO `article` VALUES ('1010009', 'www.zhihu.com', '某某h', '2017-01-13 18:34:43', '是8', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '7', '1');
INSERT INTO `article` VALUES ('1010010', 'www.zhihu.com', '某某i', '2017-01-13 18:54:12', '是9', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '1', '1');
INSERT INTO `article` VALUES ('1010011', 'www.zhihu.com', '某某i', '2017-01-13 18:55:14', '是10', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '2', '1');
INSERT INTO `article` VALUES ('1010012', 'www.zhihu.com', '某某j', '2017-01-13 18:58:34', '是11', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '5', '1');
INSERT INTO `article` VALUES ('1010013', 'www.zhihu.com', '某某h', '2017-01-13 19:58:34', '是12', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '3', '1');
INSERT INTO `article` VALUES ('1010014', 'www.douban.com', '某某i', '2017-01-13 19:59:34', '是13', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '1', '1');
INSERT INTO `article` VALUES ('1010015', 'www.baidu.com', '某某k', '2017-01-13 20:19:34', '是14', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '5', '1');
INSERT INTO `article` VALUES ('1010016', 'www.hupu.com', '某某l', '2017-01-13 20:29:34', '是15', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '4', '1');
INSERT INTO `article` VALUES ('1010017', 'www.ithome.com', '某某m', '2017-01-13 20:39:34', '是16', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '3', '1');
INSERT INTO `article` VALUES ('1010018', 'www.driver.com', '某某n', '2017-01-13 20:42:34', '是17', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '1', '1');
INSERT INTO `article` VALUES ('1010019', 'www.sina.com', '某某o', '2017-01-13 20:44:34', '是18', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '0', '1');
INSERT INTO `article` VALUES ('1010020', 'www.zhihu.com', '某某p', '2017-01-13 20:47:34', '是19', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '3', '1');
INSERT INTO `article` VALUES ('1010021', 'www.csdn.com', '某某q', '2017-01-13 21:41:31', '是20', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '4', '1');
INSERT INTO `article` VALUES ('1010022', 'www.baidu.com', '某某r', '2017-01-13 21:47:37', '是21', '\"上善若水\"是一个成语，指的是：最高境界，就像水的品性一样，泽被万物而不争名利。处于众人所不注意的地方或者细微的地方，所以是最接近道的。水，无色无味，在方而法方，在圆而法圆，无所滞，它以百态存于自然界，于自然无所违也。语出《老子》：“上善若水，水善利万物而不争，处众人之所恶（wù），故几于道。”在道家学说里，水为至善至柔；水性绵绵密密，微则无声，巨则汹涌；与人无争却又容纳万物。水有滋养万物的德行，它使万物得到它的利益，而不与万物发生矛盾、冲突，人生之道，莫过于此。', 'http://localhost:8080/Webpage_vrzww/img/show.jpg', '1', '1');
INSERT INTO `article` VALUES ('1010038', 'www.vrcnweb.com', 'admin', '2017-03-01 02:00:52', '测试推送第一篇', '<p>第一篇测试版内容推送</p>\n						<p><img src=\"http://localhost:8080/Webpage_vrzww/uploadImg/037c85d7-7de6-4ab0-a616-a507208e0f66.jpg\" alt=\"zip\"></p><p><b>划重点</b></p><p><br></p>', 'http://localhost:8080/Webpage_vrzww/uploadImg/ac2b2974-efe2-4fc6-aec2-afae0e9ad60f.jpg', '0', '1');
INSERT INTO `article` VALUES ('1010039', 'www.vrcnweb.com', 'admin', '2017-03-01 02:09:47', '测试推送第二篇', '<p>第二篇测试版内容推送balabala</p>\n						<p><img src=\"http://localhost:8080/Webpage_vrzww/uploadImg/037c85d7-7de6-4ab0-a616-a507208e0f66.jpg\" alt=\"zip\"></p><p><b>划重点</b></p><p><br></p>', 'http://localhost:8080/Webpage_vrzww/uploadImg/ac2b2974-efe2-4fc6-aec2-afae0e9ad60f.jpg', '0', '1');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cId` int(16) NOT NULL AUTO_INCREMENT,
  `categoryId` int(16) NOT NULL,
  `aId` int(16) NOT NULL,
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=100028 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('100001', '4', '1010001');
INSERT INTO `category` VALUES ('100002', '1', '1010002');
INSERT INTO `category` VALUES ('100003', '2', '1010003');
INSERT INTO `category` VALUES ('100004', '3', '1010004');
INSERT INTO `category` VALUES ('100005', '3', '1010005');
INSERT INTO `category` VALUES ('100006', '2', '1010006');
INSERT INTO `category` VALUES ('100007', '4', '1010007');
INSERT INTO `category` VALUES ('100008', '1', '1010008');
INSERT INTO `category` VALUES ('100009', '1', '1010009');
INSERT INTO `category` VALUES ('100010', '2', '1010010');
INSERT INTO `category` VALUES ('100011', '3', '1010011');
INSERT INTO `category` VALUES ('100012', '4', '1010012');
INSERT INTO `category` VALUES ('100013', '2', '1010013');
INSERT INTO `category` VALUES ('100014', '3', '1010014');
INSERT INTO `category` VALUES ('100015', '2', '1010015');
INSERT INTO `category` VALUES ('100016', '1', '1010016');
INSERT INTO `category` VALUES ('100017', '1', '1010017');
INSERT INTO `category` VALUES ('100018', '4', '1010018');
INSERT INTO `category` VALUES ('100019', '2', '1010019');
INSERT INTO `category` VALUES ('100020', '3', '1010020');
INSERT INTO `category` VALUES ('100021', '3', '1010021');
INSERT INTO `category` VALUES ('100022', '2', '1010022');
INSERT INTO `category` VALUES ('100023', '1', '1010038');
INSERT INTO `category` VALUES ('100024', '2', '1010038');
INSERT INTO `category` VALUES ('100025', '3', '1010038');
INSERT INTO `category` VALUES ('100026', '4', '1010038');
INSERT INTO `category` VALUES ('100027', '1', '1010039');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cId` int(16) NOT NULL AUTO_INCREMENT,
  `aId` int(16) NOT NULL,
  `uId` int(16) NOT NULL,
  `pId` int(16) NOT NULL,
  `content` char(150) NOT NULL,
  `postTime` datetime NOT NULL,
  `isLeaf` char(1) NOT NULL,
  `deleteState` char(1) NOT NULL,
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=600075 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('600001', '1010001', '10003', '0', '好', '2017-01-14 12:20:30', '0', '1');
INSERT INTO `comment` VALUES ('600002', '1010002', '10002', '0', '不好', '2017-01-14 12:21:11', '1', '1');
INSERT INTO `comment` VALUES ('600003', '1010001', '10004', '0', '哦', '2017-01-14 12:21:45', '1', '1');
INSERT INTO `comment` VALUES ('600004', '1010003', '10001', '0', '啊', '2017-01-14 12:23:01', '1', '1');
INSERT INTO `comment` VALUES ('600005', '1010004', '10004', '0', '哦', '2017-01-14 12:20:45', '0', '0');
INSERT INTO `comment` VALUES ('600006', '1010004', '10004', '0', '啊', '2017-01-14 12:21:25', '0', '0');
INSERT INTO `comment` VALUES ('600007', '1010002', '10005', '600002', '回复钱 哈', '2017-01-14 12:24:15', '0', '1');
INSERT INTO `comment` VALUES ('600008', '1010001', '10005', '600003', '回复李 嗯', '2017-01-14 12:25:11', '1', '1');
INSERT INTO `comment` VALUES ('600009', '1010002', '10001', '600002', '回复钱 哦', '2017-01-14 12:30:15', '0', '1');
INSERT INTO `comment` VALUES ('600010', '1010003', '10002', '600004', '回复赵 额', '2017-01-14 12:33:11', '1', '1');
INSERT INTO `comment` VALUES ('600011', '1010003', '10003', '0', '哈', '2017-01-14 12:40:13', '0', '1');
INSERT INTO `comment` VALUES ('600012', '1010004', '10003', '0', '哦', '2017-01-14 12:33:13', '0', '0');
INSERT INTO `comment` VALUES ('600013', '1010001', '10002', '0', '啊', '2017-01-14 12:33:14', '0', '1');
INSERT INTO `comment` VALUES ('600014', '1010003', '10000', '0', 'www', '2017-02-17 02:12:35', '1', '1');
INSERT INTO `comment` VALUES ('600017', '1010003', '10000', '0', '达到', '2017-02-17 02:18:48', '0', '1');
INSERT INTO `comment` VALUES ('600018', '1010003', '10000', '0', '事情', '2017-02-17 02:19:28', '1', '1');
INSERT INTO `comment` VALUES ('600019', '1010003', '10000', '0', '去', '2017-02-17 02:19:34', '0', '1');
INSERT INTO `comment` VALUES ('600020', '1010003', '10000', '0', '是', '2017-02-17 02:19:47', '0', '1');
INSERT INTO `comment` VALUES ('600021', '1010003', '10000', '0', '的', '2017-02-17 02:19:49', '0', '1');
INSERT INTO `comment` VALUES ('600022', '1010003', '10000', '0', '飞', '2017-02-17 02:19:51', '0', '1');
INSERT INTO `comment` VALUES ('600023', '1010003', '10000', '0', '个', '2017-02-17 02:19:58', '0', '1');
INSERT INTO `comment` VALUES ('600024', '1010003', '10000', '0', '好', '2017-02-17 02:20:00', '0', '1');
INSERT INTO `comment` VALUES ('600025', '1010001', '10000', '0', '34', '2017-02-18 23:20:51', '0', '1');
INSERT INTO `comment` VALUES ('600026', '1010001', '10000', '0', 'll', '2017-02-18 23:26:29', '0', '1');
INSERT INTO `comment` VALUES ('600027', '1010001', '10000', '0', 'ww', '2017-02-18 23:37:17', '0', '1');
INSERT INTO `comment` VALUES ('600028', '1010001', '10000', '0', 'qqqqwwwww', '2017-02-18 23:40:10', '0', '1');
INSERT INTO `comment` VALUES ('600029', '1010005', '10000', '0', 'err', '2017-02-18 23:59:23', '0', '1');
INSERT INTO `comment` VALUES ('600030', '1010005', '10000', '0', 'wwwww', '2017-02-19 00:01:43', '0', '1');
INSERT INTO `comment` VALUES ('600031', '1010005', '10000', '0', '想嘻嘻嘻想', '2017-02-19 00:10:53', '0', '1');
INSERT INTO `comment` VALUES ('600032', '1010005', '10000', '0', '信息时代', '2017-02-19 00:12:38', '0', '1');
INSERT INTO `comment` VALUES ('600033', '1010005', '10000', '0', '从线程执行', '2017-02-19 00:14:29', '0', '1');
INSERT INTO `comment` VALUES ('600034', '1010005', '10000', '0', 'w11w1', '2017-02-19 00:20:00', '0', '1');
INSERT INTO `comment` VALUES ('600035', '1010005', '10000', '0', 'w11w1', '2017-02-19 00:22:37', '0', '1');
INSERT INTO `comment` VALUES ('600036', '1010005', '10000', '0', 'plp', '2017-02-19 00:23:39', '0', '1');
INSERT INTO `comment` VALUES ('600037', '1010005', '10000', '0', 'ytt', '2017-02-19 00:25:01', '0', '1');
INSERT INTO `comment` VALUES ('600038', '1010005', '10000', '0', 'yuyt', '2017-02-19 00:25:37', '0', '1');
INSERT INTO `comment` VALUES ('600039', '1010005', '10000', '0', 'uuuuu', '2017-02-19 00:25:50', '0', '1');
INSERT INTO `comment` VALUES ('600040', '1010003', '10000', '600018', '回复不明情况的吃瓜管理员 sasas', '2017-02-19 00:31:42', '0', '1');
INSERT INTO `comment` VALUES ('600041', '1010001', '10000', '600008', '回复周 hfff', '2017-02-19 11:05:22', '1', '1');
INSERT INTO `comment` VALUES ('600042', '1010001', '10000', '600008', '回复周 asdasdasd', '2017-02-19 11:07:22', '1', '1');
INSERT INTO `comment` VALUES ('600043', '1010001', '10000', '600008', '回复周 四的十大', '2017-02-19 12:03:00', '0', '1');
INSERT INTO `comment` VALUES ('600044', '1010001', '10000', '600003', '回复李 阿大声道', '2017-02-19 12:03:08', '0', '1');
INSERT INTO `comment` VALUES ('600045', '1010001', '10000', '600042', '回复不明情况的吃瓜管理员 大舍大得', '2017-02-19 12:03:39', '0', '1');
INSERT INTO `comment` VALUES ('600046', '1010001', '10000', '600042', '回复不明情况的吃瓜管理员 sa', '2017-02-19 13:33:47', '0', '1');
INSERT INTO `comment` VALUES ('600047', '1010001', '10000', '600041', '回复不明情况的吃瓜管理员 ssaaaa', '2017-02-19 13:37:36', '0', '1');
INSERT INTO `comment` VALUES ('600048', '1010001', '10000', '600003', '回复李 xxxxx', '2017-02-19 13:38:09', '0', '1');
INSERT INTO `comment` VALUES ('600049', '1010001', '10000', '600008', '回复周 xxxxxaaaa', '2017-02-19 13:38:19', '0', '1');
INSERT INTO `comment` VALUES ('600050', '1010002', '10000', '0', '气球', '2017-02-19 22:59:19', '1', '1');
INSERT INTO `comment` VALUES ('600051', '1010002', '10000', '600050', '回复不明情况的吃瓜管理员 我问问', '2017-02-19 22:59:56', '0', '1');
INSERT INTO `comment` VALUES ('600052', '1010002', '10000', '0', '事实上', '2017-02-19 23:04:29', '0', '1');
INSERT INTO `comment` VALUES ('600053', '1010002', '10000', '0', '等等等', '2017-02-19 23:07:56', '0', '1');
INSERT INTO `comment` VALUES ('600054', '1010002', '10000', '0', '从', '2017-02-19 23:14:18', '1', '1');
INSERT INTO `comment` VALUES ('600055', '1010002', '10000', '0', '执行撤销', '2017-02-19 23:16:18', '0', '1');
INSERT INTO `comment` VALUES ('600056', '1010002', '10000', '0', '辅导', '2017-02-19 23:25:09', '0', '1');
INSERT INTO `comment` VALUES ('600057', '1010002', '10000', '0', 'asdas', '2017-02-19 23:25:48', '0', '1');
INSERT INTO `comment` VALUES ('600058', '1010002', '10000', '600054', '回复不明情况的吃瓜管理员 asdasdasdasd', '2017-02-19 23:25:58', '0', '1');
INSERT INTO `comment` VALUES ('600059', '1010003', '10000', '600010', '回复钱 vcvc', '2017-02-20 00:06:23', '1', '1');
INSERT INTO `comment` VALUES ('600060', '1010003', '10000', '600059', '回复不明情况的吃瓜管理员 asdasdas', '2017-02-20 00:07:00', '1', '1');
INSERT INTO `comment` VALUES ('600061', '1010003', '10000', '600060', '回复不明情况的吃瓜管理员 哈哈哈哈', '2017-02-20 00:48:50', '0', '1');
INSERT INTO `comment` VALUES ('600062', '1010003', '10000', '600014', '回复不明情况的吃瓜管理员 拖拖拖拖拖拖', '2017-02-20 00:51:22', '1', '1');
INSERT INTO `comment` VALUES ('600063', '1010003', '10000', '600062', '回复不明情况的吃瓜管理员 嘎嘎嘎嘎嘎嘎', '2017-02-20 00:52:02', '0', '1');
INSERT INTO `comment` VALUES ('600064', '1010005', '10000', '0', '防守打法', '2017-02-28 01:01:25', '0', '1');
INSERT INTO `comment` VALUES ('600065', '1010005', '10000', '0', '湖广会馆', '2017-02-28 01:01:32', '0', '1');
INSERT INTO `comment` VALUES ('600066', '1010005', '10000', '0', '玩儿', '2017-02-28 01:01:35', '0', '1');
INSERT INTO `comment` VALUES ('600067', '1010005', '10000', '0', 'IOP', '2017-02-28 01:01:40', '0', '1');
INSERT INTO `comment` VALUES ('600068', '1010005', '10000', '0', '荣耀', '2017-02-28 01:01:44', '0', '1');
INSERT INTO `comment` VALUES ('600069', '1010005', '10000', '0', 'uiyui', '2017-02-28 01:01:50', '0', '1');
INSERT INTO `comment` VALUES ('600070', '1010005', '10000', '0', 'iuiu', '2017-02-28 01:01:53', '0', '1');
INSERT INTO `comment` VALUES ('600071', '1010005', '10000', '0', 'poip', '2017-02-28 01:01:55', '0', '1');
INSERT INTO `comment` VALUES ('600072', '1010005', '10000', '0', 'm,.m,', '2017-02-28 01:01:59', '0', '1');
INSERT INTO `comment` VALUES ('600073', '1010005', '10000', '0', 'm,.m,', '2017-02-28 01:02:07', '0', '1');
INSERT INTO `comment` VALUES ('600074', '1010005', '10000', '0', 'hjkjh', '2017-02-28 01:02:10', '0', '1');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `test` int(10) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`test`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '2017-02-17 02:06:20');
INSERT INTO `test` VALUES ('2', '2017-02-17 02:09:50');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uId` int(16) NOT NULL AUTO_INCREMENT,
  `username` char(16) NOT NULL,
  `loginName` varchar(20) NOT NULL,
  `password` int(32) NOT NULL,
  `question` varchar(20) NOT NULL,
  `answer` varchar(20) NOT NULL,
  `identity` char(1) NOT NULL,
  `registerTime` datetime NOT NULL,
  `headPortrait` varchar(128) DEFAULT NULL,
  `deleteState` char(1) NOT NULL,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10000', '不明情况的吃瓜管理员', 'huang@qq.com', '999999', '你好', '哦', '0', '2017-01-13 12:24:16', 'http://localhost:8080/Webpage_vrzww/img/user_128px.png', '1');
INSERT INTO `user` VALUES ('10001', '赵', 'zhao@qq.com', '123456', '你好', '哦', '1', '2017-01-15 08:24:16', 'http://localhost:8080/Webpage_vrzww/img/user_128px.png', '1');
INSERT INTO `user` VALUES ('10002', '钱', 'qian@qq.com', '234567', '你好', '哦', '1', '2017-01-15 09:24:16', 'http://localhost:8080/Webpage_vrzww/img/user_128px.png', '1');
INSERT INTO `user` VALUES ('10003', '孙', 'sun@qq.com', '345678', '你好', '哦', '1', '2017-01-15 10:24:16', 'http://localhost:8080/Webpage_vrzww/img/user_128px.png', '1');
INSERT INTO `user` VALUES ('10004', '李', 'li@qq.com', '456789', '你好', '哦', '1', '2017-01-15 11:24:16', 'http://localhost:8080/Webpage_vrzww/img/user_128px.png', '1');
INSERT INTO `user` VALUES ('10005', '周', 'zhou@qq.com', '12345', '你好', '哦', '1', '2017-01-15 12:24:16', 'http://localhost:8080/Webpage_vrzww/img/user_128px.png', '1');
INSERT INTO `user` VALUES ('10006', '吴', 'qu@qq.com', '123456', '你好', '哦', '1', '2017-01-16 12:24:16', 'http://localhost:8080/Webpage_vrzww/img/user_128px.png', '0');
INSERT INTO `user` VALUES ('10007', 'sd', 'ddd', '231', 'fdd', 'fd', '1', '2017-02-08 01:00:25', 'http://localhost:8080/Webpage_vrzww/img/user_128px.png', '1');
INSERT INTO `user` VALUES ('10008', '吴', 'wu@qq.com', '123456', '你好', '哦', '1', '2017-02-09 00:49:19', 'http://localhost:8080/Webpage_vrzww/img/user_128px.png', '0');
