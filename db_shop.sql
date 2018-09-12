/*
Navicat MySQL Data Transfer

Source Server         : sa
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : db_shop

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2018-09-12 16:09:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminName` varchar(16) NOT NULL COMMENT '管理员名称',
  `adminPassword` varchar(16) NOT NULL COMMENT '管理员密码',
  `adminIphone` char(11) NOT NULL COMMENT '管理员手机号',
  `adminEmail` varchar(25) NOT NULL COMMENT '管理员邮箱',
  `adminRoleID` int(11) NOT NULL COMMENT '管理员角色id',
  `adminJoinTime` datetime NOT NULL COMMENT '管理员加入时间',
  `adminState` int(11) NOT NULL default '1' COMMENT '管理员状态 0 停用 1 正在用',
  PRIMARY KEY  (`adminName`,`adminPassword`),
  KEY `adminRoleID` (`adminRoleID`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`adminRoleID`) REFERENCES `role` (`roleID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'adminnn', '18731332222', '1757243947@qq.com', '1', '2018-09-03 14:00:46', '1');

-- ----------------------------
-- Table structure for `adress`
-- ----------------------------
DROP TABLE IF EXISTS `adress`;
CREATE TABLE `adress` (
  `adressID` int(11) NOT NULL auto_increment COMMENT '地址编号',
  `adressName` varchar(255) NOT NULL COMMENT '详细地址',
  `userName` varchar(16) NOT NULL COMMENT '用户名',
  `consigneerPhone` char(11) NOT NULL COMMENT '收货人手机号',
  `consigneeName` varchar(255) NOT NULL COMMENT '收货人名称',
  `AdressState` int(11) NOT NULL default '1' COMMENT '地址状态 0 不常用 1 常用 默认是1',
  PRIMARY KEY  (`adressID`),
  KEY `userName` (`userName`),
  CONSTRAINT `adress_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adress
-- ----------------------------
INSERT INTO `adress` VALUES ('2', '河北省廊坊市北华航天工业学院', '123456', '18731334420', '高', '1');

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `authorityID` int(11) NOT NULL auto_increment COMMENT '权限id',
  `authorityName` varchar(25) NOT NULL COMMENT '权限名',
  `authorityAdress` varchar(255) NOT NULL COMMENT '管理地址名 多个',
  `authorityManageAdress` varchar(255) NOT NULL COMMENT '权限管理地址  多个',
  PRIMARY KEY  (`authorityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classID` int(11) NOT NULL auto_increment COMMENT '分类id',
  `className` varchar(255) NOT NULL COMMENT '分类名称',
  `classDescribe` varchar(255) NOT NULL COMMENT '分类描述',
  PRIMARY KEY  (`classID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '成功励志', '关于一些励志类型的书籍');
INSERT INTO `class` VALUES ('2', '经典小说', '关于一些历史的经典的小说故事');
INSERT INTO `class` VALUES ('3', '青春动漫', '关于青春的爱情故事和一些动漫类型的爱情故事');
INSERT INTO `class` VALUES ('4', '儿童用书', '关于儿童教育的一些书籍');
INSERT INTO `class` VALUES ('5', '文学经典', '关于中国文化传承的一些经典著作');
INSERT INTO `class` VALUES ('6', '艺术传记', '关于一些艺术类的名人的传记');
INSERT INTO `class` VALUES ('7', '健康养身', '关于一些保持健康，维护健康，一些健康常识的书籍');
INSERT INTO `class` VALUES ('8', '历史古籍', '关于一些记录历史的经典记录书籍');
INSERT INTO `class` VALUES ('9', '人文社科', '关于一些人文的知识和社会科学的书籍');
INSERT INTO `class` VALUES ('10', '哲学心理', '关于一些探讨哲学和心累心理学的书籍');
INSERT INTO `class` VALUES ('11', '精品小说', 'sssssssssssssssssssssssssssssssssssssssssss');
INSERT INTO `class` VALUES ('12', '精品小说', 'sssssssssssssssssssssssssssssssssssssssssssssssss');

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collectID` int(11) NOT NULL auto_increment COMMENT '收藏id',
  `userName` varchar(16) NOT NULL COMMENT '用户名',
  `productID` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY  (`collectID`),
  KEY `userName` (`userName`),
  KEY `productID` (`productID`),
  CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for `evaluation`
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `evaluationID` int(11) NOT NULL auto_increment COMMENT '评价id',
  `productID` int(11) NOT NULL COMMENT '商品id',
  `username` varchar(16) NOT NULL COMMENT '用户名称',
  `evaluationMessage` varchar(255) NOT NULL COMMENT '评价内容',
  `evaluationTime` datetime NOT NULL COMMENT '评价日期',
  PRIMARY KEY  (`evaluationID`),
  KEY `productID` (`productID`),
  KEY `username` (`username`),
  CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES ('1', '1', '123456', '还不错', '2018-08-01 10:01:20');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderID` int(11) NOT NULL auto_increment COMMENT '订单编号',
  `userName` varchar(16) NOT NULL COMMENT '用户名',
  `adressName` varchar(255) NOT NULL COMMENT '地址名称',
  `placeTime` datetime NOT NULL COMMENT '下单时间',
  `payTime` datetime default NULL COMMENT '支付时间',
  `deliveryTime` datetime default NULL COMMENT '发货时间',
  `accessTime` datetime default NULL COMMENT '确认收货时间',
  `orderState` int(11) NOT NULL COMMENT '订单状态 0 未支付 1 支付成功未发货 2 发货未收货 3 交易成功 4 未支付取消订单 5 退款 6 未发货取消订单 7 发货状态取消订单 8 收到货退货退款',
  `consigneerPhone` char(11) NOT NULL COMMENT '收件人电话',
  `consigneeName` varchar(20) NOT NULL COMMENT '收件人姓名',
  PRIMARY KEY  (`orderID`),
  KEY `userName` (`userName`),
  KEY `adressID` (`adressName`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `order-product`
-- ----------------------------
DROP TABLE IF EXISTS `order-product`;
CREATE TABLE `order-product` (
  `order-productID` int(11) NOT NULL auto_increment COMMENT '标识',
  `productID` int(11) NOT NULL COMMENT '商品id',
  `orderID` int(11) NOT NULL COMMENT '订单id',
  `productPrice` double NOT NULL COMMENT '商品下单价格',
  PRIMARY KEY  (`order-productID`),
  KEY `productID` (`productID`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `order-product_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON UPDATE CASCADE,
  CONSTRAINT `order-product_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order-product
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productID` int(11) NOT NULL auto_increment COMMENT '商品id',
  `prooductName` varchar(255) NOT NULL COMMENT '商品名称',
  `productPrice` double NOT NULL COMMENT '商品价格',
  `productStock` int(11) NOT NULL COMMENT '商品库存',
  `productAdress` varchar(255) NOT NULL COMMENT '商品地址',
  `productState` int(11) NOT NULL default '1' COMMENT '0 下架 1 正在销售',
  `productCast` varchar(2000) NOT NULL COMMENT '商品描述',
  `Press` varchar(255) NOT NULL COMMENT '商品出版社',
  `pressTime` datetime NOT NULL COMMENT '出版日期',
  `bookNum` varchar(255) NOT NULL COMMENT '书号',
  `printingTime` datetime NOT NULL COMMENT '印刷日期',
  `authorName` varchar(255) NOT NULL COMMENT '作者',
  `lessIntegral` int(11) NOT NULL default '0' COMMENT '购买商品最低积分',
  `productCsot` double NOT NULL COMMENT '商品成本价格',
  `productSales` int(11) NOT NULL default '0' COMMENT '销量',
  PRIMARY KEY  (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '断舍离', '32', '50', '河北廊坊', '1', '身边的杂物越堆越多，却怎么都丢不掉，因为“舍不得”、“好可惜”；', '广西科学技术出版社', '2013-07-03 00:00:00', '9787807639817', '2018-09-01 17:35:25', '(日)山下英子', '100', '30', '0');
INSERT INTO `product` VALUES ('2', '亲密关系：通往灵魂的桥梁', '35', '50', '河北廊坊', '1', '这是少数我读过两遍以上的书，我知道我还会再读它，因为生活当中的问题总是层出不穷，而我们又是如此健忘，常常忘了智慧和宝训其实都在我们唾手可得之处。', '湖南文艺出版社', '2015-03-07 00:00:00', '9787540471194', '2018-09-01 17:40:19', '克里斯多福·孟', '100', '30', '0');
INSERT INTO `product` VALUES ('3', '人性的弱点', '32', '50', '河北廊坊', '1', '《人性的弱点》是1937年*初首印版本原汁原味的复刻，收录了卡耐基本人、他的朋友为此书所写的内容推荐与背景介绍，并完整保留首版中卡耐基对婚姻与家庭的真知灼见。此外，本版新译的语言风格更贴近当下人们的阅读喜好，在融合时下语言风潮的同时也不失中文特有的韵味。', '天津人民出版社', '2014-09-01 00:00:00', '9787201088822', '2018-09-01 17:41:56', '戴尔·卡耐基', '100', '30', '0');
INSERT INTO `product` VALUES ('4', '生活需要仪式感 ', '32', '50', '河北廊坊', '1', '出门前给爱人一个亲吻，每周为自己做一桌丰盛的大餐，帮同事庆祝一次生日，陪父母参观一次升旗仪式，定期给朋友打个问候电话……生活中的仪式感，无处不在，只是我们渐渐忽视、淡忘了。', '山东文艺出版社', '2017-12-03 00:00:00', '9787532955732', '2018-09-01 17:43:29', '李思圆', '100', '30', '0');
INSERT INTO `product` VALUES ('5', '谁的青春不迷茫', '45', '50', '河北廊坊', '1', '你觉得孤独就对了，那是让你认识自己的机会。', '北京联合出版有限公司', '2018-07-01 00:00:00', '9787559623232', '2018-09-01 17:47:15', '刘同', '100', '30', '0');
INSERT INTO `product` VALUES ('6', '遇见未知的自己', '38', '50', '河北廊坊', '1', '华语世界超300万册的身心灵自我修行必读经典', '湖南文艺出版社', '2016-04-03 00:00:00', '9787540475017', '2018-09-01 17:49:07', '张德芬', '100', '30', '0');
INSERT INTO `product` VALUES ('7', '百年孤独', '55', '50', '河北廊坊', '1', '《百年孤独》是魔幻现实主义文学的代表作，描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰，反映了拉丁美洲一个世纪以来风云变幻的历史。作品融入神话传说、民间故事、宗教典故等因素，巧妙地糅合了现实与虚幻，展现出一个瑰丽的想象世界，成为20世纪重要的经典文学巨著。1982年加西亚·马尔克斯获得诺贝尔文学奖，奠定*文学大师的地位，很大程度上便是凭借《百年孤独》的巨大影响', '南海出版公司', '2017-08-01 00:00:00', '9787544291170', '2018-09-03 13:36:58', '马尔克斯', '100', '30', '0');
INSERT INTO `product` VALUES ('8', '活着', '28', '50', '河北廊坊', '1', '《活着》是一部充满血泪的小说。余华通过一位中国农民的苦难生活 讲述了人如何去承受巨大的苦难；讲述了眼泪的丰富和宽广；讲述了*望 的不存在：讲述了人是为了活着本身而活着…… 《活着》这部小说荣获意大利格林扎纳·卡佛文学奖*高奖项(1998年 )，台湾《中国时报》10本好书奖(1994年)，香港“博益”15本好书奖 (1990年)；并入选香港《亚洲周刊》评选的“20世纪中文小说百年百强” ；入选中国百位批评家和文学编辑评选的“九十年代*有影响的10部作品 ”。', '作家出版社', '2012-08-01 00:00:00', '9787506365437', '2018-09-03 13:39:33', '余华', '100', '30', '0');
INSERT INTO `product` VALUES ('9', '那不勒斯的萤火', '42', '50', '河北廊坊', '1', '在那不勒斯有这么一群人，他们代表着这片地区ZUI强大的生命力，却默默无闻，被这座城市的黑暗淹没，迷失在无为的生活里。也有那么一些人，他们无视绚丽的霓虹，在这片黑暗中追寻着希望的萤火。', '百花洲文艺出版社', '2018-05-01 00:00:00', '9787550027510', '2018-09-03 13:41:11', '马西米利亚诺· 威尔吉利奥，白马时光', '100', '30', '0');
INSERT INTO `product` VALUES ('10', '平凡的世界', '108', '50', '河北廊坊', '1', '这是一部现实主义小说，也是小说化的家族史。作家高度浓缩了中国西北农村的历史变迁过程，作品达到了思想性与艺术性的高度统一，特别是主人公面对困境艰苦奋斗的精神，对今天的大学生朋友仍有启迪。这是一部全景式地表现中国当代城乡社会生活的长篇小说，本书共三部。作者在近十年问广阔背景上，通过复杂的矛盾纠葛，刻划了社会各阶层众多普通人的形象。劳动与爱情，挫折与追求，痛苦与欢乐，日常生活与巨大社会冲突，纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。', '北京十月文艺出版社', '2017-06-01 00:00:00', '9787530216781', '2018-09-03 13:42:50', '路遥', '100', '30', '0');
INSERT INTO `product` VALUES ('11', '凤囚凰', '88', '50', '河北廊坊', '1', '楚玉以山阴公主的身份开始于后宫生活，周旋于各色美男之间。弱水三千，是只取一瓢饮，还是悉数收了？当离丧与自由并存，当放纵与傲气共生。在这个靡乱而浪漫、华丽且张扬的时代，在幽回的清雅与洒落的狂放间，楚玉踯躅而行……', '四川文艺出版社', '2018-09-03 13:44:15', '9787541142710', '2018-09-03 13:44:17', '天衣有风', '100', '30', '0');
INSERT INTO `product` VALUES ('12', '就喜欢你看不惯我 又干不掉我的样子', '46', '50', '河北廊坊', '1', '这是在微博上被数百万次转发的名猫“吾皇”的故事。在书中，少年讲述了与吾皇相遇的故事，和一家三口在家中的日常。在书中，不仅有白茶老爹乱入，隔壁老王躺枪，还有编辑对少年的超长篇采访记。惊喜不容错过(*￣︶￣)y', '长江文艺出版社', '2018-09-03 13:45:31', '9787535479860', '2018-09-03 13:45:35', '白茶', '100', '30', '0');
INSERT INTO `product` VALUES ('13', '夏目友人帐', '32.8', '50', '河北廊坊', '1', '★古董店主人遗留的奇妙信件究竟有什么古怪？', '百花洲文艺出版社', '2018-09-03 13:46:47', '9787550017771', '2018-09-03 13:46:49', '村井贞', '100', '30', '0');
INSERT INTO `product` VALUES ('14', '延禧攻略（全两册）', '88', '50', '河北廊坊', '1', '乾隆六年，少女魏璎珞为寻求长姐死亡真相，入紫禁城为 宫女。经调查，璎珞证实姐姐之死与荒唐王爷弘昼有关，立志要讨回公道。富察皇后娴于礼法，担心璎珞走上歧途，竭力给予她温暖与帮助。在皇后的悉心教导下，魏璎珞一步步成长为正直坚强的宫廷女官，并放下怨恨、认真生活。皇后不幸崩逝，令璎珞对乾隆误会重重，二人从互相敌视到*终彼此理解、互相扶持。', '九州出版社', '2018-09-03 13:47:46', '787510874000', '2019-09-01 00:00:00', '笑脸猫', '100', '30', '0');
INSERT INTO `product` VALUES ('15', '儒林外史', '25', '50', '河北廊坊', '1', '《儒林外史》，是一部描绘知识分子群像的长篇讽刺小说。作品描写了深受八股毒害的儒生的种种荒诞与虚', '花山文艺出版社', '2015-07-12 13:39:14', '9787551123426', '2015-09-12 13:39:46', '吴敬梓', '100', '30', '0');
INSERT INTO `product` VALUES ('16', '三体', '42', '50', '河北廊坊', '1', '庞大的三体舰队杀气腾腾直扑太阳系，尖端科技被锁死的地球人面对前所未有的危局，*的突破口在于三体人透明的思维。于是，人类制订了神秘莫测的“面壁计划”，秘密展开对三体人的反击。\r\n\r\n“面壁计划”与人类的太空舰队，哪一样才是人类的希望？“黑暗森林”意味着什么？文明在波谲云诡的宇宙中又该如何存续？\r\n\r\n宇宙就是一座黑暗森林，每个文明都是带枪的猎人\r\n\r\n瑰丽万方的科学幻想灼烧你每一根神经，风云翻覆的道德追问压迫你每一次呼吸', '重庆出版社', '2016-06-12 13:42:53', '9787229100612', '2016-09-12 13:43:15', '刘慈欣', '100', '30', '0');
INSERT INTO `product` VALUES ('17', '成语故事绘本', '160', '50', '河北廊坊', '1', '成语故事绘本大全小学生注音版一年级课外书儿童书籍童话拼音故事书1-2年级阅读绘本3-6-12周岁78-10岁带拼音儿童书成语故事书幼儿\r\n成语故事绘本大全小学生注音版一年级课外书儿童书籍童话拼音故事书1-2年级阅读绘本3-6-12周岁78-10岁带拼音儿童书成语故事书幼儿\r\n', ' 延边大学出版社', '2017-03-12 13:46:19', '9787568822305', '2017-09-12 13:46:44', '余婷', '100', '30', '0');
INSERT INTO `product` VALUES ('18', '妈妈我能行', '15', '50', '河北廊坊', '1', '全10册幼儿情商故事绘本 妈妈我能行 中英文双语读物 0-3岁婴儿早教书籍宝宝启蒙认知幼儿绘本0-1-2-3-4-5-6岁幼儿园图书儿童书籍', ' 广东旅游出版社', '2016-09-12 13:48:36', '787534758900', '2018-09-12 13:49:27', '胡媛媛', '100', '30', '0');
INSERT INTO `product` VALUES ('19', '海洋世界', '16.79', '50', '河北廊坊', '1', '奇妙的海底王国全8册宝宝早教书 自然科学启蒙儿童绘本故事书6-7周岁 海洋世界动物故事 海底小纵队 儿童书籍 3-6岁幼儿园老师推荐', '明天出版社', '2011-04-12 14:07:28', '9787533264659', '2018-09-12 14:07:50', '吕军燕', '100', '30', '0');
INSERT INTO `product` VALUES ('20', '趣味找不同', '138', '50', '河北廊坊', '1', '儿童书籍益智游戏书趣味找不同儿童图书全套4册专注力训练3-6岁2-4-5-6-7岁幼儿12逻辑全脑思维训练智力开发宝宝强大脑孩子的书籍', '武汉理工大学出版社', '2018-06-12 14:11:12', '9787562947486', '2018-09-12 14:11:26', '杨丹', '100', '30', '0');
INSERT INTO `product` VALUES ('21', '三字经', '19.9', '50', '河北廊坊', '1', '三字经书正版彩图注音版有声伴读完整版 三字经弟子规唐诗三百首全套幼儿书小学生版一年级早教儿童书籍0-3-6岁国学启蒙经典早教', '吉林美术出版社', '2012-03-12 14:12:40', '9787538665420', '2012-04-12 14:12:13', '崔钟雷', '100', '30', '0');
INSERT INTO `product` VALUES ('22', '游世界', '30', '50', '河北廊坊', '1', '这是一本人文地理历史百科知识读本，特别适合家长孩子共读。书中两个旅程涉及30多个知识主题、约900个知识点，全书由28幅手绘图连接成3.78米长双面8开大幅画卷来呈现这个丰富多彩的世界（蒲公英出品） 十万童书每满100减50,爆品限量秒杀>', '贵州人民出版社', '2018-08-12 14:15:10', '9787221098726', '2018-09-12 14:15:27', '波兰】尼科拉·库哈尔斯卡 著绘 宋麟 乌兰 译', '100', '30', '0');
INSERT INTO `product` VALUES ('23', '月亮与六便士', '39.8', '50', '河北廊坊', '1', '“满地都是六便士，他却抬头看见了月亮。”\r\n    银行家查尔斯，人到中年，事业有成，为了追求内心隐秘的绘画梦想，突然抛妻别子，弃家出走。他深知：人的每一种身份都是一种自我绑架，唯有失去是通向自由之途。\r\n    在异国他乡，他贫病交加，对梦想却愈发坚定执着。他说：我必须画画，就像溺水的人必须挣扎。\r\n    在经历种种离奇遭遇后，他来到南太平洋的一座孤岛，同当地一位姑娘结婚生子，成功创作出一系列惊世杰作。就在此时，他被绝症和双目失明击倒，临死之前，他做出了让所有人震惊的决定……    \r\n    人世漫长得转瞬即逝， 有人见尘埃， 有人见星辰。查尔斯就是那个终其一生在追逐星辰的人。\r\n', '浙江文艺出版社', '2017-01-12 14:18:56', '9787533936020', '2018-09-12 14:19:13', '威廉·萨默塞特·毛姆', '100', '30', '0');
INSERT INTO `product` VALUES ('24', '追风筝的人', '36', '50', '河北廊坊', '1', '“许多年过去了，人们说陈年旧事可以被埋葬，然而我终于明白这是错的，因为往事会自行爬上来。回首前尘，我意识到在过去二十六年里，自己始终在窥视着那荒芜的小径。”\r\n　　12岁的阿富汗富家少爷阿米尔与仆人哈桑情同手足。然而，在一场风筝比赛后，发生了一件悲惨不堪的事，阿米尔为自己的懦弱感到自责和痛苦，逼走了哈桑，不久，自己也跟随父亲逃往美国。\r\n　　成年后的阿米尔始终无法原谅自己当年对哈桑的背叛。为了赎罪，阿米尔再度踏上暌违二十多年的故乡，希望能为不幸的好友尽一点心力，却发现一个惊天谎言，儿时的噩梦再度重演，阿米尔该如何抉择？\r\n　　小说如此残忍而又美丽，作者以温暖细腻的笔法勾勒人性的本质与救赎，读来令人荡气回肠', '上海人民出版社', '2006-09-12 14:20:49', '9787208061644', '2018-09-12 14:21:14', '卡勒德·胡赛尼', '100', '30', '0');
INSERT INTO `product` VALUES ('25', '边城', '29.8', '50', '河北廊坊', '1', '中国现当代文学小说畅销书经典 初中学生课外书必阅读书籍原版', '江苏人民出版社', '2014-01-12 14:23:13', ' 9787214108463', '2018-09-12 14:23:29', '沈从文', '100', '30', '0');
INSERT INTO `product` VALUES ('26', '穆斯林的葬礼(2015版)', '49.8', '50', '河北廊坊', '1', '霍达著 茅盾文学奖经典作品 现代/当代小说民族畅销书', ' 北京出版集团公司 北京十月文艺出版社', '2015-09-12 14:24:44', '9787530212837', '2018-09-12 14:24:59', '霍达', '100', '30', '0');
INSERT INTO `product` VALUES ('27', '挪威的森林', '33', '50', '河北廊坊', '1', '村上春树著 林少华译 现当代经典 都市情感 言情小说书籍 世界文学名著 日本文学现代经典 ', '上海译文出版社', '2018-09-12 14:28:14', '9787532742929', '2018-09-12 14:27:27', '村上春树', '100', '30', '0');
INSERT INTO `product` VALUES ('28', '四世同堂(完整版)', '89', '50', '河北廊坊', '1', '老舍文学创作巅峰之作/中国现当代文学长篇小说 经典名著文学/经典名著老师推荐读物 ', ' 东方出版中心', '2017-09-01 14:30:22', '9787547311790', '2018-09-12 14:30:46', '老舍', '100', '30', '0');
INSERT INTO `product` VALUES ('29', ' *追风筝的人', '29', '50', '河北廊坊', '1', '灿烂千阳作者胡塞尼著高圆圆力荐现当代文学世界经典排行榜中文小说畅销文艺书籍正版', '上海人民出版社', '2013-06-12 14:32:08', ' 9787208061644', '2018-09-12 14:32:25', ' 卡勒德.胡赛尼', '100', '30', '0');
INSERT INTO `product` VALUES ('30', '红楼梦', '39.1', '50', '河北廊坊', '1', '新课标 精装四大名著 足本典藏 无障碍阅读 注音解词释疑）', '商务印书馆', '2016-09-12 14:37:36', '11975786', '2018-09-12 14:37:47', '曹雪芹', '100', '30', '0');
INSERT INTO `product` VALUES ('31', '贝多芬', '19.8', '50', '河北廊坊', '1', '正版 贝多芬 榜样的力量 艺术篇 让学生受益一生的世界名人传记 艺术篇 畅销书 青少年儿童课外阅读精选', '团结出版社', '2012-09-12 14:41:06', '9787512611870', '2018-09-12 14:41:21', ' 张亮', '100', '30', '0');
INSERT INTO `product` VALUES ('32', ' 列奥纳多·达·芬奇传-从凡人到天才的创造力密码', '99', '50', '河北廊坊', '1', '正版现货 列奥纳多·达·芬奇传：从凡人到天才的创造力密码 沃尔特·艾萨克森著 文艺复兴时期伟大艺术家--达芬奇人物传记畅销书', '中信出版社', '2015-09-12 14:43:47', '9787508690322', '2018-09-12 14:43:57', '[美]沃尔特·艾萨克森', '100', '30', '0');
INSERT INTO `product` VALUES ('33', ' 亲爱的提奥 梵高传 艺术天才的不朽传奇', '38', '50', '河北廊坊', '1', '艺术天才的不朽传奇 文森特 精装正版书籍 畅销书 正版包邮名人传记\r\n', '长江文艺出版社', '2018-09-12 14:46:40', '9787535490308', '2018-09-12 14:46:47', '文森特·威廉·梵高,约翰娜·梵高·邦格', '100', '30', '0');
INSERT INTO `product` VALUES ('34', '大匠之门-齐白石回忆录', '52', '50', '河北廊坊', '1', '正版现货 大匠之门：齐白石回忆录 世界文化名人近现代中国绘画艺术美术家国画大师齐白石自述文集自传名人传记历史故事畅销书籍', '新星出版社', '2018-09-12 14:48:24', '9787513325950', '2018-09-12 14:48:31', '齐白石', '100', '30', '0');
INSERT INTO `product` VALUES ('35', '世界名人大传.', '636', '50', '河北廊坊', '1', '正版包邮 世界名人大传大合集 传记丛书历史文库 政治军事科学文化艺术名人故事 中华线装书局 全套精装4册16开小学生课外阅读书籍', '辽海出版社', '2010-12-12 14:49:49', '9787545110777', '2018-09-12 14:50:07', '于立文', '100', '30', '0');
INSERT INTO `product` VALUES ('36', '永不放弃', '36', '50', '河北廊坊', '1', '永不放弃 特朗普自述 名人物传记自传 上海译文出版社 商传奇经历做生意的艺术成功之道畅销书籍排行榜正版 新华书店旗舰店官网', ' 上海译文出版社', '2018-09-12 14:51:38', '9787532771769', '2018-09-12 14:51:43', '无', '100', '30', '0');
INSERT INTO `product` VALUES ('37', '求医不如求己', '65.6', '50', '河北廊坊', '1', '自己的生命不要交给别人做主，努力改变身体，进而改变命运', '江西科学技术出版社', '2017-01-12 14:53:10', '9787539056883', '2018-09-12 14:53:30', '中里巴人', '100', '30', '0');
INSERT INTO `product` VALUES ('38', '时令养生速查轻图典', '28', '50', '河北廊坊', '1', '时令养生是中医养生学的核心内容之一，倡导遵循四季阴阳消长的变化规律和特点，适时调节人体各部机能，与自然保持协调平衡，进而达到健康长寿的目的。', '江苏科学技术出版社', '2018-09-12 14:55:29', '9787553725758', '2018-09-12 14:55:47', '谭兴贵 于雅婷', '100', '30', '0');
INSERT INTO `product` VALUES ('39', '现代人养生长寿健康宝典', '58', '50', '河北廊坊', '1', '　阅读此书，让通俗的语言告诉你如何掌握健康长寿的生活方式，从而改变你对长寿的看法。你会从这里得到超乎想象的、掌握自身健康与长寿的自主能力，从而实现我们的共同目标：亲近健康、获得长寿。', '新世界出版社', '2011-02-12 14:57:37', '23294581', '2018-09-12 14:57:48', '王耀堂', '100', '30', '0');
INSERT INTO `product` VALUES ('40', '《养生堂》系列套装全4册', '113.4', '50', '河北廊坊', '1', '书中精选了人们生活中非常关注、非常迫切的各类健康问题，如心脑血管疾病、三高困扰、如何养肺、如何养肝、如何养脾胃、如何强健骨本、男女典型疾病等几十种常见疾病，每一种疾病先由主持人悦悦、观众、专家通过形象的场景和有趣的对话引出，并逐渐展开，深入浅出地解析疾病出现的原因、症状，以及相应的解决方案等\r\n', '江苏科学技术出版社', '2018-05-12 14:59:33', '9787553770727', '2018-09-12 14:59:52', '北京电视台《养生堂》栏目组 凤凰含章出品', '100', '30', '0');
INSERT INTO `product` VALUES ('41', '养胃养生健康粥', '32.4', '50', '河北廊坊', '1', '“每天喝点粥，养生防病入。”自己在家熬粥，没有防腐剂，零添加，好吸收，好消化，一碗好粥可以轻松滋补全家人。\r\n出版社:电子工业出版社', '电子工业出版社', '2016-05-12 15:01:25', '9787121284588', '2018-09-12 15:01:44', '史文丽', '100', '30', '0');
INSERT INTO `product` VALUES ('42', '只有医生知道（1-3套装）', '84', '50', '河北廊坊', '1', '每看完一本《只有医生知道》，对身体的了解程度都增加不止5%。', '江苏文艺出版社', '2015-12-12 15:03:07', '23816455', '2018-09-12 15:03:25', '张羽', '100', '30', '0');
INSERT INTO `product` VALUES ('43', '半小时漫画中国史2（《半小时漫画中国史》系列第2部，其实是一本严谨的极简中国史！）', '29.9', '50', '河北廊坊', '1', '《半小时漫画中国史2》是300万粉丝大号“混子曰”创始人陈磊（二混子）继《半小时漫画中国史》《半小时漫画世界史》后推出的全新力作，看半小时漫画，通五千年历史，用漫画解读历史，开启阅读新潮流。读客出品 ', '海南出版社', '2018-05-12 15:04:50', '9787544382045', '2018-09-12 15:05:08', '陈磊（笔名：二混子)', '100', '30', '0');
INSERT INTO `product` VALUES ('44', '：大国的崩溃：苏联解体的台前幕后（老布什图书馆绝密档案新近解密！哈佛大学现代史专家，还原改变苏联命运和世界面貌的五个月）', '48', '50', '河北廊坊', '1', '吉尔伯奖、普希金俄语图书奖!新鲜史料，独特角度!西方世界对苏联解体以胜利者自居的观点其实是史学垃圾！ \r\n', '四川人民出版社', '2017-05-12 15:06:42', '9787220100338', '2018-09-12 15:06:59', '[美]沙希利·浦洛基 著，宋虹 译', '100', '30', '0');
INSERT INTO `product` VALUES ('45', '话说中国历史（套装共10册）', '77.6', '50', '河北廊坊', '1', '图说天下 中国通史 全彩色图文 给您带来色彩鲜艳的上下五千年 ', '吉林出版集团有限责任公司', '2012-07-12 15:08:12', '22926002', '2018-09-12 15:08:27', '龚书铎，刘德麟', '100', '30', '0');
INSERT INTO `product` VALUES ('46', '明朝那些事儿全集 : 图文增补版全9册（新版', '262.7', '50', '河北廊坊', '1', '全本明朝白话史，当年明月全新修订 ', '北京联合出版公司', '2017-05-12 15:09:06', '9787559602176', '2017-05-12 15:09:06', '当年明月', '100', '30', '0');
INSERT INTO `product` VALUES ('47', '全球通史:从史前史到21世纪（第7版修订版上下册，当当独家赠送全球通史主题笔记本）', '75.8', '50', '河北廊坊', '1', '斯塔夫里阿诺斯的这部潜心力作——《全球通史:从史前史到21世纪(第7版修订版)(中文版)(上下册)》自1970年初版问世以来，赞誉如潮，被译成多种语言流传于世，可谓经典之中的经典。第7版在保留原文精华的基础上，融入了时新的研究成果。新增了数百幅生动珍贵的图片和脉络清晰的地图，使这部名著在内容和体系上更加完善。作者文笔隽永，笔力深厚，才思横溢，整部著作风格前后一贯，令您在颇具历史韵律的行文中思接千载、视通万里。', '北京大学出版社', '2006-09-12 15:11:49', '9231298', '2018-09-12 15:12:10', '（美）斯塔夫里阿诺斯', '100', '30', '0');
INSERT INTO `product` VALUES ('48', ' 谁偷走了美国梦 : 从中产到新穷人', '64.6', '50', '河北廊坊', '1', '普利策新闻奖得主力作 赓续名作《光荣与梦想》 为你揭示美国中产之殇 特朗普上台执政路线图的预言之书 中美经贸关系未来走向的镜鉴之书 美国中产阶级走向没落的教训之书 ', '新星出版社', '2018-09-12 15:13:22', '9787513330367', '2018-09-12 15:13:33', '(美) 赫德里克˙史密斯著', '100', '30', '0');
INSERT INTO `product` VALUES ('49', '策略思维——商界、政界及日常生活中的策略竞争', '33.1', '50', '河北廊坊', '1', '博弈论大师的经典著作，通过讲故事，让读者在事例中领略博弈论策略思维的道理。即使是没有任何经济学基础的读者，阅读起来也毫无障碍。', '中国人民大学出版社', '2018-09-12 15:14:59', '9787300172620', '2018-09-12 15:15:13', '(美)阿维纳什.K.迪克西特 (美)巴里.J.奈尔伯夫', '100', '30', '0');
INSERT INTO `product` VALUES ('50', '第二性（ⅠⅡ 全两册）', '80.6', '50', '河北廊坊', '1', '《第二性》是二十世纪女性主义运动的理论基础，著名社会学家李银河称波伏瓦为“女性主义思想的泰斗”、“女权主义的思想导师和旗手”。', '上海译文出版社', '2011-09-12 15:16:28', '23429879', '2018-09-12 15:16:43', '（法）西蒙娜德波伏瓦　著，郑克鲁　译', '100', '30', '0');
INSERT INTO `product` VALUES ('51', '合作的进化', '33.2', '50', '河北廊坊', '1', '本书的确有资格取代《圣经》。 ', '上海人民出版社', '2016-12-12 15:17:49', '9787208141407', '2018-09-12 15:18:22', '[美]罗伯特·阿克塞尔罗德(Robert Axelrod) 著 吴坚忠 译', '100', '30', '0');
INSERT INTO `product` VALUES ('52', '明亮的对话', '26', '50', '河北廊坊', '1', '当前中国社会公共言论多显混乱戾气，公共对话往往蜕变为相互谩骂，《明亮的对话：公共说理十八讲》针对当下，切中要害，不讳饰虚指，在批判中构建，是公民教育启蒙之作。', '中信出版社', '2014-01-12 15:19:24', '9787508642253', '2018-09-12 15:19:43', '徐贲', '100', '30', '0');
INSERT INTO `product` VALUES ('53', '人性中的善良天使：暴力为什么会减少（上下册）', '90.4', '50', '河北廊坊', '1', '穿透10万年历史，度量人性的进化，哈佛大学心理学教授斯蒂芬平克关于人性的恢弘巨著。', '中信出版社', '2015-07-12 15:20:53', '9787508648583', '2018-09-12 15:21:17', '[美]斯蒂芬·平克', '100', '30', '0');
INSERT INTO `product` VALUES ('54', '乡土中国（精装修订版）', '20.5', '50', '河北廊坊', '1', '《乡土中国》一书，是从社区研究转入社会结构分析的一种尝试，对中国社会学而言，《乡土中国》极具示范性和开创性。 ', '北京大学出版社', '2016-07-12 15:22:51', '978730117482', '2018-09-12 15:23:07', '费孝通', '100', '30', '0');
INSERT INTO `product` VALUES ('55', '别跟自己过不去——心理不失衡并免于自我伤害', '16.9', '50', '河北廊坊', '1', '人生已经如此不易，你又何苦为难自己。别跟自己过不去，是一种精神的解脱，让人们在生活中懂得放松自己，懂得不断地清理身上的负重，让生活更轻松美好', '台海出版社', '2018-02-12 15:26:06', '9787516816516', '2018-09-12 15:26:14', '三吉', '100', '30', '0');
INSERT INTO `product` VALUES ('56', '零售哲学系列', '56.3', '50', '河北廊坊', '1', '（亚洲连锁便利店王国7-Eleven的创始人、日本“新经营之神”铃木敏文，为你讲述无论卖什么都能大卖的顾客心理学与零售哲读客图书', '读客图书', '2015-06-12 15:27:48', '23737315', '2018-09-12 15:28:04', '铃木敏文　著，顾晓琳 译', '100', '30', '0');
INSERT INTO `product` VALUES ('57', '人性的弱点', '25.6', '50', '河北廊坊', '1', '《人性的弱点》作为一本实用的人际关系著作，从人性本质的角度，挖掘出潜藏在人们体内的弱点，使人们能够充分认识自己，并不断改造自己，从而能有所长进，直至取得*后的成功', '天津人民出版社', '2014-03-12 15:29:18', '9787201088822', '2018-09-12 15:29:43', '戴尔·卡耐基', '100', '30', '0');
INSERT INTO `product` VALUES ('58', '温暖消逝', '64.5', '50', '河北廊坊', '1', '一本深度讲解临终关怀与死亡的书，思考死亡是为了活得更好； 全美点击上亿次的死亡公开课，死亡教育领域权威作品', '电子工业出版社', '2016-09-12 15:30:45', '9787121284625', '2018-09-12 15:31:04', '【美】迈克尔·R.雷明;乔治·E.迪金森 著，庞洋 周艳 译', '100', '30', '0');
INSERT INTO `product` VALUES ('59', '轴心时代', '57.3', '50', '河北廊坊', '1', '人类知识、心理、哲学、宗教创造性的时代；著名文化学者余秋雨、历史学家许倬云、秘鲁前总统加西亚?佩雷斯一致推荐', '海南出版社', '2010-05-12 15:32:32', '9787544331791', '2018-09-12 15:32:47', '凯伦阿姆斯特朗', '100', '30', '0');
INSERT INTO `product` VALUES ('60', '最好的抉择', '40', '50', '河北廊坊', '1', '关于临终、死亡与丧亲关怀(第八版）\r\n', '电子工业出版社', '2018-09-12 15:34:17', '9787508662022', '2018-09-12 15:34:34', '【美】迈克尔·R.雷明;乔治·E.迪金森,庞洋 周艳', '100', '30', '0');

-- ----------------------------
-- Table structure for `product_class`
-- ----------------------------
DROP TABLE IF EXISTS `product_class`;
CREATE TABLE `product_class` (
  `product_classID` int(11) NOT NULL auto_increment COMMENT '商品分类id',
  `productID` int(11) NOT NULL COMMENT '商品id',
  `classID` int(11) NOT NULL COMMENT '分类id',
  PRIMARY KEY  (`product_classID`),
  KEY `productID` (`productID`),
  KEY `classID` (`classID`),
  CONSTRAINT `product_class_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_class_ibfk_2` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_class
-- ----------------------------
INSERT INTO `product_class` VALUES ('1', '1', '1');
INSERT INTO `product_class` VALUES ('2', '2', '1');
INSERT INTO `product_class` VALUES ('3', '3', '1');
INSERT INTO `product_class` VALUES ('4', '4', '1');
INSERT INTO `product_class` VALUES ('5', '5', '1');
INSERT INTO `product_class` VALUES ('6', '6', '1');
INSERT INTO `product_class` VALUES ('7', '7', '2');
INSERT INTO `product_class` VALUES ('8', '8', '2');
INSERT INTO `product_class` VALUES ('9', '9', '2');
INSERT INTO `product_class` VALUES ('10', '10', '2');
INSERT INTO `product_class` VALUES ('11', '11', '3');
INSERT INTO `product_class` VALUES ('12', '12', '3');
INSERT INTO `product_class` VALUES ('13', '13', '3');

-- ----------------------------
-- Table structure for `product_picture`
-- ----------------------------
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE `product_picture` (
  `product_pictureID` int(11) NOT NULL auto_increment COMMENT '商品图片id',
  `productID` int(11) NOT NULL COMMENT '商品id',
  `pictureAdress` varchar(255) NOT NULL COMMENT '图片保存路径',
  `pictureAttrabute` int(11) NOT NULL COMMENT '图片属性 0 默认图片 1 详情图片',
  PRIMARY KEY  (`product_pictureID`),
  KEY `productID` (`productID`),
  CONSTRAINT `product_picture_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleID` int(11) NOT NULL auto_increment COMMENT '角色id',
  `roleName` varchar(30) NOT NULL COMMENT '角色名',
  `roleDescribe` varchar(255) NOT NULL COMMENT '角色描述',
  PRIMARY KEY  (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '拥有一切权限');

-- ----------------------------
-- Table structure for `role-authority`
-- ----------------------------
DROP TABLE IF EXISTS `role-authority`;
CREATE TABLE `role-authority` (
  `role-authorityID` int(11) NOT NULL auto_increment COMMENT '角色名-权限id',
  `roleID` int(11) NOT NULL COMMENT '角色id',
  `authorityID` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY  (`role-authorityID`),
  KEY `roleID` (`roleID`),
  CONSTRAINT `role-authority_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role-authority
-- ----------------------------

-- ----------------------------
-- Table structure for `shopcar`
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `shopcarID` int(11) NOT NULL auto_increment COMMENT '购物车id',
  `userName` varchar(16) NOT NULL COMMENT '用户名称',
  `productID` int(11) NOT NULL COMMENT '商品id',
  `buyNum` int(11) NOT NULL default '1' COMMENT '购买数量',
  `total` double NOT NULL COMMENT '总价',
  PRIMARY KEY  (`shopcarID`),
  KEY `userName` (`userName`),
  KEY `productID` (`productID`),
  CONSTRAINT `shopcar_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopcar_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcar
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userName` varchar(16) NOT NULL COMMENT '用户名',
  `userPassword` varchar(16) NOT NULL COMMENT '用户密码',
  `userIntegral` int(11) NOT NULL default '0' COMMENT '积分',
  PRIMARY KEY  (`userName`,`userPassword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123456', '123456', '0');
INSERT INTO `user` VALUES ('1234567', '1234567', '0');
