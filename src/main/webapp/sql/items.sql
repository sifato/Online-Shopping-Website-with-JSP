

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `city` varchar(50) default NULL,
  `price` int(11) default NULL,
  `number` int(11) default NULL,
  `picture` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', 'Water Basketball shoes', 'Foshan', '480', '380', '008.jpg');
INSERT INTO `items` VALUES ('2', 'I Am Groot', 'Fuzhou', '120', '800', '007.jpg');
INSERT INTO `items` VALUES ('3', 'Nike Sneakers', 'Guanzou', '500', '1000', '003.jpg');
INSERT INTO `items` VALUES ('4', 'Adidas Tshirt', 'Shanghai', '388', '600', '004.jpg');
INSERT INTO `items` VALUES ('5', 'Lego', 'Guanzou', '180', '900', '005.jpg');
INSERT INTO `items` VALUES ('6', 'Power Rangers', 'Beijing', '960', '481', '006.jpg');
INSERT INTO `items` VALUES ('7', 'Pikacho', 'Beijing', '299', '1000', '009.jpg');
INSERT INTO `items` VALUES ('8', 'MC Super Heros', 'Beijing', '999', '500', '010.jpg');
INSERT INTO `items` VALUES ('9', 'Thinkpad', 'Beijing', '6999', '500', '011.jpg');
INSERT INTO `items` VALUES ('10', 'Toy Bear', 'Beijing', '177', '500', '012.jpg');

