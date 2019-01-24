/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50561
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50561
File Encoding         : 65001

Date: 2019-01-24 13:55:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `base_dict`
-- ----------------------------
DROP TABLE IF EXISTS `base_dict`;
CREATE TABLE `base_dict` (
  `dict_id` varchar(32) NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(64) NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(64) NOT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) DEFAULT NULL COMMENT '数据字典项目代码(可为空)',
  `dict_sort` int(10) DEFAULT NULL COMMENT '排序字段',
  `dict_enable` char(1) NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_dict
-- ----------------------------
INSERT INTO `base_dict` VALUES ('1', '001', '客户行业', '教育培训 ', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('10', '003', '公司性质', '民企', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('12', '004', '年营业额', '1-10万', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('13', '004', '年营业额', '10-20万', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('14', '004', '年营业额', '20-50万', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('15', '004', '年营业额', '50-100万', null, '4', '1', null);
INSERT INTO `base_dict` VALUES ('16', '004', '年营业额', '100-500万', null, '5', '1', null);
INSERT INTO `base_dict` VALUES ('17', '004', '年营业额', '500-1000万', null, '6', '1', null);
INSERT INTO `base_dict` VALUES ('18', '005', '客户状态', '基础客户', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('19', '005', '客户状态', '潜在客户', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('2', '001', '客户行业', '电子商务', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('20', '005', '客户状态', '成功客户', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('21', '005', '客户状态', '无效客户', null, '4', '1', null);
INSERT INTO `base_dict` VALUES ('22', '006', '客户级别', '普通客户', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('23', '006', '客户级别', 'VIP客户', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('24', '007', '商机状态', '意向客户', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('25', '007', '商机状态', '初步沟通', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('26', '007', '商机状态', '深度沟通', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('27', '007', '商机状态', '签订合同', null, '4', '1', null);
INSERT INTO `base_dict` VALUES ('3', '001', '客户行业', '对外贸易', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('30', '008', '商机类型', '新业务', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('31', '008', '商机类型', '现有业务', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('32', '009', '商机来源', '电话营销', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('33', '009', '商机来源', '网络营销', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('34', '009', '商机来源', '推广活动', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('4', '001', '客户行业', '酒店旅游', null, '4', '1', null);
INSERT INTO `base_dict` VALUES ('5', '001', '客户行业', '房地产', null, '5', '1', null);
INSERT INTO `base_dict` VALUES ('6', '002', '客户信息来源', '电话营销', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('7', '002', '客户信息来源', '网络营销', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('8', '003', '公司性质', '合资', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('9', '003', '公司性质', '国企', null, '2', '1', null);

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cust_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '客户编号(主键)',
  `cust_name` varchar(32) NOT NULL COMMENT '客户名称(公司名称)',
  `cust_user_id` bigint(32) DEFAULT NULL COMMENT '负责人id',
  `cust_create_id` bigint(32) DEFAULT NULL COMMENT '创建人id',
  `cust_source` varchar(32) DEFAULT NULL COMMENT '客户信息来源',
  `cust_industry` varchar(32) DEFAULT NULL COMMENT '客户所属行业',
  `cust_level` varchar(32) DEFAULT NULL COMMENT '客户级别',
  `cust_linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `cust_phone` varchar(64) DEFAULT NULL COMMENT '固定电话',
  `cust_mobile` varchar(16) DEFAULT NULL COMMENT '移动电话',
  `cust_zipcode` varchar(10) DEFAULT NULL,
  `cust_address` varchar(100) DEFAULT NULL,
  `cust_createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cust_id`),
  KEY `FK_cst_customer_source` (`cust_source`),
  KEY `FK_cst_customer_industry` (`cust_industry`),
  KEY `FK_cst_customer_level` (`cust_level`),
  KEY `FK_cst_customer_user_id` (`cust_user_id`),
  KEY `FK_cst_customer_create_id` (`cust_create_id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('165', '邓明', null, null, '6', '5', '22', '江淑华', '14548148844', '13167187053', '8b4e85d0f', '河南省丽丽市江北蔡路w座 217367', '2019-01-26 18:42:53');
INSERT INTO `customer` VALUES ('166', '张洁', null, null, '6', '3', '22', '许东', '15867369729', '13239634219', 'f79e21020', '甘肃省林县平山东莞街m座 818422', '2019-01-24 15:06:28');
INSERT INTO `customer` VALUES ('167', '李婷婷', null, null, '7', '1', '22', '杨玉珍', '13679634322', '13117933415', '41d0e94d5', '辽宁省呼和浩特市静安李路b座 222887', '2019-02-12 03:57:48');
INSERT INTO `customer` VALUES ('168', '赵红霞', null, null, '7', '3', '23', '张萍', '18954577980', '15675182443', 'b0c104c94', '河北省邯郸市清城太原路e座 366387', '2019-02-02 05:53:20');
INSERT INTO `customer` VALUES ('169', '陈阳', null, null, '6', '2', '22', '米欢', '18911253056', '18716529315', 'ac506560c', '山东省张家港县怀柔汕尾街R座 905966', '2019-02-08 15:42:17');
INSERT INTO `customer` VALUES ('170', '王阳', null, null, '7', '1', '22', '程超', '15861634429', '13335178118', '7206180bb', '安徽省通辽县普陀洪路S座 784778', '2019-02-15 12:47:31');
INSERT INTO `customer` VALUES ('171', '欧冬梅', null, null, '7', '1', '23', '张兵', '13740506201', '15889410437', '0b397a08e', '湖北省荣县友好合山街a座 382584', '2019-01-29 22:13:26');
INSERT INTO `customer` VALUES ('172', '龙宁', null, null, '6', '2', '22', '李桂香', '13146022087', '13944329418', '20cf213a1', '海南省宁德市西峰姬街R座 720317', '2019-01-28 18:24:10');
INSERT INTO `customer` VALUES ('173', '刘岩', null, null, '6', '5', '22', '廖柳', '13137911284', '18094814953', '39a4a167d', '山东省金凤市海港徐街l座 512745', '2019-02-13 13:08:15');
INSERT INTO `customer` VALUES ('174', '郭颖', null, null, '6', '3', '23', '朱俊', '15556894938', '15711878131', '7e01302ca', '湖北省琳市孝南张路i座 537550', '2019-02-06 04:30:15');
INSERT INTO `customer` VALUES ('175', '廖桂芳', null, null, '6', '5', '23', '陆淑兰', '15148137216', '15700556646', 'dd9de5929', '湖北省哈尔滨市沙湾大冶街c座 788432', '2019-02-04 06:55:40');
INSERT INTO `customer` VALUES ('176', '井淑兰', null, null, '6', '1', '23', '张博', '15220110397', '13435844842', 'b62cd8f68', '甘肃省南京县秀英银川街b座 110112', '2019-02-22 23:58:26');
INSERT INTO `customer` VALUES ('177', '郭畅', null, null, '7', '4', '22', '曹阳', '13553695752', '15676366997', '51bdaaba0', '吉林省嘉禾市徐汇熊路x座 123267', '2019-01-31 06:07:37');
INSERT INTO `customer` VALUES ('178', '李丹丹', null, null, '7', '4', '22', '尤飞', '15296501785', '15092259220', 'f13bcd5d5', '吉林省丽丽市西夏辽阳街l座 129529', '2019-02-05 23:12:36');
INSERT INTO `customer` VALUES ('179', '潘涛', null, null, '6', '3', '23', '王斌', '15827969471', '18605799916', 'c29409600', '河北省秀荣市山亭汤街G座 667205', '2019-02-11 02:16:40');
INSERT INTO `customer` VALUES ('180', '粟秀云', null, null, '6', '2', '23', '杨秀梅', '13798548242', '13568704863', '6b7cb347e', '江西省汕尾县黄浦邹街I座 567705', '2019-02-19 13:33:05');
INSERT INTO `customer` VALUES ('181', '李桂珍', null, null, '7', '5', '23', '陈霞', '15324804083', '18549234048', '1def354ef', '山西省晨市普陀汕尾街d座 918630', '2019-02-17 11:05:01');
INSERT INTO `customer` VALUES ('182', '顾莹', null, null, '7', '1', '22', '李凤英', '13507247583', '18592398068', '88a55f425', '广东省瑜县萧山董街C座 139697', '2019-02-08 21:38:03');
INSERT INTO `customer` VALUES ('183', '沈淑华', null, null, '6', '1', '23', '黄峰', '13724485795', '18089345629', '33d44ceaa', '陕西省佳市南溪王街H座 797121', '2019-02-15 11:37:36');
INSERT INTO `customer` VALUES ('184', '林柳', null, null, '6', '5', '23', '张涛', '15631336153', '15207700745', '3509e194a', '山东省建平市魏都武汉路e座 130858', '2019-01-28 17:23:07');
INSERT INTO `customer` VALUES ('185', '方丽', null, null, '6', '3', '22', '周红', '13236560610', '13131678712', 'fbb016945', '江西省佛山市山亭郭街e座 582039', '2019-02-15 23:08:20');
INSERT INTO `customer` VALUES ('186', '梅海燕', null, null, '7', '5', '22', '陈健', '18657853858', '14753023299', '1aa2a7503', '江西省合肥市清浦杨路t座 392571', '2019-02-20 17:59:42');
INSERT INTO `customer` VALUES ('187', '陈娟', null, null, '6', '4', '22', '倪桂兰', '18738354684', '15965454963', '93018ca86', '浙江省彬市永川广州街H座 654833', '2019-02-13 20:44:19');
INSERT INTO `customer` VALUES ('188', '李丹', null, null, '6', '5', '23', '武瑞', '13786953875', '18764508627', 'b14ab292f', '新疆维吾尔自治区丽丽市长寿南宁街P座 109018', '2019-02-11 09:51:07');
INSERT INTO `customer` VALUES ('189', '金娟', null, null, '7', '2', '23', '黄文', '14535439648', '15123095648', 'a6311b95e', '广东省东莞县秀英东莞街E座 447089', '2019-02-02 14:34:16');
INSERT INTO `customer` VALUES ('190', '李海燕', null, null, '6', '4', '23', '刘斌', '18509466502', '13631142266', '914b5b23b', '青海省冬梅市双滦姜路S座 894365', '2019-02-06 00:51:30');
INSERT INTO `customer` VALUES ('191', '戈雷', null, null, '6', '1', '23', '邹建', '18062663120', '18708524620', 'f9d47e2c7', '甘肃省汕尾市长寿方路p座 888579', '2019-01-24 17:28:27');
INSERT INTO `customer` VALUES ('192', '祁秀芳', null, null, '6', '2', '23', '但凤英', '15970099814', '13070250031', '7b1f63fc1', '湖北省淑华县崇文成路g座 374396', '2019-02-04 08:09:20');
INSERT INTO `customer` VALUES ('193', '杨燕', null, null, '6', '2', '22', '李莹', '18079443829', '15874832907', '5bef54cc0', '吉林省兴城市六枝特蔡街S座 297932', '2019-02-06 04:55:13');
INSERT INTO `customer` VALUES ('194', '陈秀荣', null, null, '6', '3', '22', '赵欢', '13440284259', '15649216511', '27d27ce70', '山东省兴安盟县永川徐路X座 752702', '2019-02-13 18:38:52');
INSERT INTO `customer` VALUES ('195', '刘强', null, null, '6', '5', '22', '王雪', '18833472096', '13511165080', 'bb57f920b', '云南省潜江市朝阳惠州街p座 945879', '2019-02-14 04:13:07');
INSERT INTO `customer` VALUES ('196', '王桂荣', null, null, '7', '1', '22', '王桂芝', '18779422145', '14719289429', 'dfbfc0e03', '甘肃省南宁市新城蔡路Q座 499263', '2019-02-06 21:42:45');
INSERT INTO `customer` VALUES ('197', '罗丹丹', null, null, '7', '5', '22', '王坤', '15667838278', '13598132801', 'c65cc3ba0', '新疆维吾尔自治区海门县怀柔王街M座 975271', '2019-02-08 12:24:41');
INSERT INTO `customer` VALUES ('198', '赵红', null, null, '7', '5', '22', '刘成', '15045957015', '15132163133', 'f82264714', '河南省南京县南湖合山路L座 912217', '2019-02-18 15:24:23');
INSERT INTO `customer` VALUES ('199', '朱瑜', null, null, '6', '5', '22', '姚丽丽', '15245752495', '15080719772', '605146c7b', '河南省丽县璧山庞路e座 371109', '2019-02-03 07:52:24');
INSERT INTO `customer` VALUES ('200', '潘秀华', null, null, '7', '2', '23', '洪超', '13190921786', '15637084844', 'aed614b3e', '广东省旭市金平天津街a座 219792', '2019-02-11 02:33:09');
INSERT INTO `customer` VALUES ('201', '王艳', null, null, '6', '2', '22', '高玲', '13694494609', '15806717405', 'acadd4c12', '湖南省明县浔阳宜都路D座 765616', '2019-01-25 21:34:00');
INSERT INTO `customer` VALUES ('202', '郭桂香', null, null, '6', '1', '22', '傅淑珍', '18061893482', '13869952900', 'bc19e3c6b', '江苏省帆市龙潭金街T座 482544', '2019-02-15 02:13:44');
INSERT INTO `customer` VALUES ('203', '孙婷', null, null, '7', '4', '23', '鲍宁', '13529106231', '18052962214', 'aaac8fc71', '山西省通辽市沈北新哈尔滨街R座 885233', '2019-02-14 21:32:12');
INSERT INTO `customer` VALUES ('204', '马鹏', null, null, '7', '2', '22', '袁波', '15839774506', '15923285547', 'becbe4d23', '广西壮族自治区宜都市兴山哈尔滨街B座 954120', '2019-01-28 13:07:33');
INSERT INTO `customer` VALUES ('205', '葛勇', null, null, '6', '5', '23', '张建平', '13848875261', '18144996125', '7c79c73d6', '贵州省龙市长寿夏街P座 612248', '2019-02-23 12:30:47');
INSERT INTO `customer` VALUES ('206', '王志强', null, null, '7', '1', '23', '戴杰', '13341612573', '13940003206', '3bda13396', '贵州省太原市合川嘉禾路T座 162625', '2019-02-14 15:45:32');
INSERT INTO `customer` VALUES ('207', '王雪梅', null, null, '6', '5', '23', '刘金凤', '15926913940', '15052224049', 'ee2bdbf3e', '广西壮族自治区荆门县白云谈路f座 175911', '2019-02-18 07:54:48');
INSERT INTO `customer` VALUES ('208', '周桂香', null, null, '7', '2', '23', '李军', '15343571364', '15658764939', '1abde74e6', '江苏省畅县城北岳路i座 967368', '2019-01-27 19:31:40');
INSERT INTO `customer` VALUES ('209', '杨莹', null, null, '7', '4', '23', '虞勇', '18243089055', '18005986097', 'e4a6e25ad', '江西省磊县沙湾惠州街R座 800199', '2019-02-10 00:01:35');
INSERT INTO `customer` VALUES ('210', '任文', null, null, '7', '1', '23', '郭军', '15181988998', '18004391884', 'ba7f13b80', '湖北省梧州市沙市北京路F座 710131', '2019-01-27 08:34:24');
INSERT INTO `customer` VALUES ('211', '房红霞', null, null, '6', '1', '22', '陈桂花', '18794473397', '18160944641', '6e3cc0875', '湖北省桂香市崇文大冶街Q座 867440', '2019-02-15 02:29:20');
INSERT INTO `customer` VALUES ('212', '邓彬', null, null, '7', '3', '22', '陈东', '13368651629', '18141783214', 'cfd323e54', '广东省淑兰市大东成都街E座 317088', '2019-02-06 06:00:31');
INSERT INTO `customer` VALUES ('213', '陈燕', null, null, '7', '5', '23', '张婷婷', '18723816923', '13144990429', '54d320194', '浙江省天津市大东林街F座 222495', '2019-02-05 17:03:49');
INSERT INTO `customer` VALUES ('214', '卢冬梅', null, null, '6', '5', '22', '胡桂芝', '15365322324', '18045538242', 'c53fda455', '湖北省桂珍市翔安拉萨街U座 831388', '2019-02-15 23:04:38');
INSERT INTO `customer` VALUES ('215', '吕浩', null, null, '6', '5', '22', '刘旭', '15102704395', '15844917668', '750e4ca29', '内蒙古自治区潮州市清城永安街w座 456662', '2019-02-05 03:32:19');
INSERT INTO `customer` VALUES ('216', '钟秀芳', null, null, '7', '1', '22', '张莹', '13290724521', '15392860050', 'ec5840ce0', '广东省梧州市高港乌鲁木齐街n座 248636', '2019-02-17 22:19:24');
INSERT INTO `customer` VALUES ('217', '王敏', null, null, '7', '2', '22', '沈桂英', '15899123893', '13766126804', '019d9bd78', '江苏省玉兰市永川潜江街O座 926081', '2019-02-03 00:08:34');
INSERT INTO `customer` VALUES ('218', '冯莹', null, null, '6', '2', '23', '卢建平', '15768833509', '15765759089', '1668f4466', '内蒙古自治区北镇市上街王路R座 852271', '2019-02-01 17:49:06');
INSERT INTO `customer` VALUES ('219', '王颖', null, null, '6', '3', '23', '王楠', '15143408359', '18296549790', '06335d3a8', '新疆维吾尔自治区秀梅县闵行杨街W座 323682', '2019-02-04 20:06:38');
INSERT INTO `customer` VALUES ('220', '廖艳', null, null, '6', '3', '22', '黄玉兰', '18628215298', '15772793740', 'b80169d34', '吉林省邯郸市和平包街t座 286634', '2019-01-31 03:31:37');
INSERT INTO `customer` VALUES ('221', '任军', null, null, '6', '2', '22', '黄超', '18517645831', '14556190286', 'd13546e6d', '宁夏回族自治区乌鲁木齐市大东汕尾街V座 616816', '2019-02-22 02:55:07');
INSERT INTO `customer` VALUES ('222', '母丽丽', null, null, '6', '1', '23', '李建军', '13970512254', '18100011225', '4f258b8fe', '福建省建华县高明郑路n座 824088', '2019-01-25 11:19:44');
INSERT INTO `customer` VALUES ('223', '薛成', null, null, '6', '3', '23', '狄丹', '18863569972', '13316732186', '0a666eb0b', '西藏自治区帆县涪城萧路X座 712883', '2019-02-05 22:41:40');
INSERT INTO `customer` VALUES ('224', '贺畅', null, null, '7', '4', '22', '王洁', '15168069276', '18996227787', 'd8145b445', '贵州省潮州市锡山惠州路m座 395660', '2019-02-23 10:12:39');
INSERT INTO `customer` VALUES ('225', '邓燕', null, null, '6', '2', '23', '王健', '13364682573', '15690171255', 'ae2a03537', '云南省东莞县蓟州石家庄路z座 503715', '2019-01-27 13:47:49');
INSERT INTO `customer` VALUES ('226', '夏桂香', null, null, '7', '2', '22', '马亮', '13243983785', '13246197180', '8aa8687b2', '云南省旭县崇文永安路O座 563352', '2019-01-29 05:26:50');
INSERT INTO `customer` VALUES ('227', '谭鹏', null, null, '7', '2', '23', '陈建', '15758226745', '15139184187', '41ba84dd3', '河北省北京市西峰谭路n座 840110', '2019-02-11 13:25:43');
INSERT INTO `customer` VALUES ('228', '李玉华', null, null, '7', '3', '22', '沈涛', '18991195049', '13432776728', '9603695b3', '河北省西安县大兴刘路M座 334616', '2019-02-09 03:35:50');
INSERT INTO `customer` VALUES ('229', '陈红霞', null, null, '7', '1', '23', '李文', '14533055902', '18903270098', '4a27340bd', '海南省超市南长大冶街U座 343621', '2019-02-20 07:35:19');
INSERT INTO `customer` VALUES ('230', '张欢', null, null, '7', '5', '22', '徐娜', '18208087086', '13356656800', '96cbfe21e', '安徽省敏县南湖北京街v座 589268', '2019-02-21 15:35:26');
INSERT INTO `customer` VALUES ('231', '吴莹', null, null, '6', '1', '22', '倪红霞', '18502614631', '15935104870', 'd212dde8f', '广西壮族自治区深圳市房山马鞍山街b座 233257', '2019-01-25 14:50:20');
INSERT INTO `customer` VALUES ('232', '贾英', null, null, '6', '4', '22', '王淑华', '15192072447', '18192899521', 'a134caebd', '内蒙古自治区嘉禾县江北郑州街m座 128133', '2019-02-12 17:32:10');
INSERT INTO `customer` VALUES ('233', '杨桂兰', null, null, '7', '2', '23', '秦小红', '13948312017', '13027783885', '1421a0e45', '云南省璐县牧野潮州路i座 545053', '2019-02-13 11:47:33');
INSERT INTO `customer` VALUES ('234', '胡畅', null, null, '7', '4', '22', '张凯', '13579197859', '15844733261', 'f6d0a9618', '内蒙古自治区丹县清浦成都街A座 933836', '2019-02-03 13:32:03');
INSERT INTO `customer` VALUES ('235', '罗杨', null, null, '7', '1', '23', '陈欣', '18148075945', '15729363728', 'fae301b6c', '江西省梅市秀英太原街m座 141422', '2019-02-17 12:26:29');
INSERT INTO `customer` VALUES ('236', '戴敏', null, null, '7', '2', '22', '兰瑞', '13482787150', '13211473043', '06ee96427', '江苏省健县蓟州杭州街d座 713883', '2019-02-23 08:05:33');
INSERT INTO `customer` VALUES ('237', '苗楠', null, null, '6', '3', '23', '刘平', '18016190706', '15803488988', 'd99df58db', '江西省淑英县南溪宁德街u座 736438', '2019-02-20 00:55:17');
INSERT INTO `customer` VALUES ('238', '李涛', null, null, '7', '1', '23', '夏海燕', '13962167045', '18772442456', '8bbbbf024', '浙江省丽丽市黄浦宁德街Q座 619374', '2019-01-29 20:09:24');
INSERT INTO `customer` VALUES ('239', '余秀英', null, null, '7', '1', '23', '刘桂香', '13687793840', '13857185119', 'a91fe6e8c', '青海省宁市南湖徐街b座 398346', '2019-02-15 13:43:09');
INSERT INTO `customer` VALUES ('240', '刘欢', null, null, '7', '1', '23', '刘宇', '13767215559', '15254188962', 'cf95daddf', '宁夏回族自治区建国县华龙王路h座 327909', '2019-02-10 02:25:00');
INSERT INTO `customer` VALUES ('241', '刘帅', null, null, '7', '2', '22', '胡志强', '18211293529', '13117957928', 'ff5117f57', '湖南省宁德县新城岳路m座 770510', '2019-02-22 14:33:16');
INSERT INTO `customer` VALUES ('242', '陆桂香', null, null, '7', '4', '23', '刘荣', '13917454280', '13048511574', 'ee115d047', '内蒙古自治区永安县安次韩街j座 190026', '2019-02-06 06:40:37');
INSERT INTO `customer` VALUES ('243', '芮志强', null, null, '6', '4', '22', '刘云', '13808135061', '14723527872', 'a7d4a0ac7', '浙江省惠州县兴山张路G座 447299', '2019-01-29 19:19:54');
INSERT INTO `customer` VALUES ('244', '颜兰英', null, null, '7', '3', '22', '耿成', '18217147656', '14503991864', '0762a3563', '新疆维吾尔自治区兰英市丰都福州路i座 222600', '2019-02-15 19:10:03');
INSERT INTO `customer` VALUES ('245', '陈兵', null, null, '6', '2', '23', '杨阳', '13727135613', '13400193100', '771b9a1dd', '云南省丹市龙潭哈尔滨街A座 513679', '2019-02-04 07:09:22');
INSERT INTO `customer` VALUES ('246', '王桂荣', null, null, '7', '4', '22', '杨丽', '13910673914', '15756126483', 'b52cf5bc3', '青海省岩市璧山海门街O座 210790', '2019-02-17 19:17:03');
INSERT INTO `customer` VALUES ('247', '王建华', null, null, '7', '5', '23', '胡玉英', '14512726759', '15727243489', '0e2e954d3', '新疆维吾尔自治区秀云市长寿永安街V座 907279', '2019-02-05 19:37:34');
INSERT INTO `customer` VALUES ('248', '张畅', null, null, '7', '1', '22', '林春梅', '15103088150', '18299959399', 'f0c1e344a', '湖北省宁德县白云南京路h座 666211', '2019-01-24 14:47:29');
INSERT INTO `customer` VALUES ('249', '胡伟', null, null, '7', '1', '22', '邓辉', '18070023533', '13073923360', '5f8b0fc82', '广西壮族自治区香港市新城李街B座 949615', '2019-02-12 20:46:27');
INSERT INTO `customer` VALUES ('250', '赵荣', null, null, '7', '1', '23', '姜萍', '15101700148', '13184410686', '995697437', '内蒙古自治区佳县高坪成都路Y座 759562', '2019-02-14 00:51:13');
INSERT INTO `customer` VALUES ('251', '程建军', null, null, '6', '3', '23', '管云', '13110333843', '18007441536', 'fc5e9c2e2', '海南省建平市梁平周路E座 760742', '2019-02-09 08:24:06');
INSERT INTO `customer` VALUES ('252', '徐桂珍', null, null, '6', '4', '23', '王玉华', '13680239425', '15909055953', '7d81156a5', '西藏自治区小红县平山刘路G座 881406', '2019-02-02 20:35:03');
INSERT INTO `customer` VALUES ('253', '马丽娟', null, null, '7', '5', '23', '段瑞', '13024401060', '13811316739', '88569b453', '贵州省桂珍县怀柔向街k座 429799', '2019-02-20 06:34:37');
INSERT INTO `customer` VALUES ('254', '周婷', null, null, '7', '2', '23', '李秀梅', '15011806499', '13947968914', 'b4a7475cf', '海南省刚县大东黄路W座 782275', '2019-02-17 19:16:50');
INSERT INTO `customer` VALUES ('255', '庞娜', null, null, '6', '4', '22', '刘敏', '15802851203', '15275581975', 'f1ff79cc2', '四川省惠州市清浦戴街S座 895549', '2019-02-10 14:54:42');
INSERT INTO `customer` VALUES ('256', '黄帆', null, null, '6', '3', '23', '赵桂珍', '18913686291', '18004799371', 'a7fc8f4cd', '浙江省东莞市和平银川路o座 918594', '2019-02-03 05:53:23');
INSERT INTO `customer` VALUES ('257', '任晨', null, null, '6', '1', '22', '唐艳', '15997162444', '13793736519', '1ab6a2e28', '吉林省兴安盟市山亭香港街N座 244042', '2019-01-29 07:32:12');
INSERT INTO `customer` VALUES ('258', '边楠', null, null, '7', '5', '23', '段林', '13953385144', '13882575759', 'd51c06d48', '江苏省太原县秀英高街i座 547731', '2019-02-18 08:50:00');
INSERT INTO `customer` VALUES ('259', '黄晶', null, null, '7', '1', '22', '李桂兰', '13606317923', '18526089918', '3936bfa5b', '宁夏回族自治区嘉禾市东丽王街B座 600617', '2019-02-10 23:59:31');
INSERT INTO `customer` VALUES ('260', '魏丹丹', null, null, '7', '5', '22', '郭洁', '15169017798', '13170154238', '1b3554a28', '江西省呼和浩特县高坪辛集街A座 555298', '2019-01-28 11:22:28');
INSERT INTO `customer` VALUES ('261', '祝慧', null, null, '6', '2', '22', '王建', '15137581906', '18850759300', 'fb2a478fb', '河南省银川市涪城陈街e座 979519', '2019-01-27 07:50:52');
INSERT INTO `customer` VALUES ('262', '董慧', null, null, '6', '5', '23', '徐娟', '13192456179', '15988310550', '4b5b2fdff', '江苏省明市白云台北街z座 889991', '2019-02-14 20:45:35');
INSERT INTO `customer` VALUES ('263', '王欢', null, null, '6', '3', '22', '何建军', '15354955220', '15777214063', 'cf297b3f6', '海南省太原县和平长春路l座 733452', '2019-02-17 23:17:31');
INSERT INTO `customer` VALUES ('264', '杨桂芳', null, null, '7', '4', '23', '杨凤兰', '15113408979', '15363864412', '712fac132', '辽宁省张家港县海港南京街k座 893175', '2019-01-27 04:17:25');
INSERT INTO `customer` VALUES ('265', '曲柳', null, null, '7', '1', '22', '文成', '14713649135', '18797036591', '745b84c54', '浙江省惠州县孝南北镇街L座 591277', '2019-01-25 13:23:25');
INSERT INTO `customer` VALUES ('266', '樊萍', null, null, '7', '4', '23', '叶涛', '13021536644', '13509593222', '903e40cf6', '山西省昆明县友好合山路O座 637839', '2019-02-03 13:49:41');
INSERT INTO `customer` VALUES ('267', '沈旭', null, null, '6', '1', '23', '张俊', '18220248452', '18747039393', 'f3e7f9ae8', '江苏省杭州市高明曹路i座 675142', '2019-02-04 11:28:09');
INSERT INTO `customer` VALUES ('268', '刘婷', null, null, '7', '2', '23', '纪瑜', '18260185832', '15281164189', '68cc0bbe3', '宁夏回族自治区上海市南长辛集街K座 820007', '2019-02-21 14:54:11');
INSERT INTO `customer` VALUES ('269', '李丹', null, null, '7', '1', '22', '郭慧', '15255449924', '18175165446', '58bfcfb08', '贵州省北镇县蓟州朱街G座 679343', '2019-02-07 21:53:09');
INSERT INTO `customer` VALUES ('270', '魏秀梅', null, null, '7', '5', '23', '戴淑珍', '14563334139', '13567310858', 'da639dd31', '内蒙古自治区佛山市崇文高街i座 586216', '2019-01-30 02:30:46');
INSERT INTO `customer` VALUES ('271', '张桂兰', null, null, '6', '1', '23', '韦丹', '15824624823', '18974833637', '66f708005', '海南省荣市新城潮州街f座 934811', '2019-02-01 11:17:35');
INSERT INTO `customer` VALUES ('272', '吕凯', null, null, '6', '3', '22', '梁艳', '15616761683', '15812708394', 'ed36af56c', '江苏省桂芳县沙湾张路o座 884761', '2019-02-17 03:10:08');
INSERT INTO `customer` VALUES ('273', '程婷', null, null, '7', '1', '23', '郭秀华', '15260180498', '15561285876', '54c5970ae', '陕西省华市高明张街a座 980932', '2019-02-06 07:55:22');
INSERT INTO `customer` VALUES ('274', '马金凤', null, null, '6', '4', '23', '唐淑英', '18776500129', '13443185866', '50b61db3d', '浙江省重庆县清河北京路y座 137990', '2019-02-04 20:34:38');
INSERT INTO `customer` VALUES ('275', '张玉英', null, null, '7', '4', '22', '赵利', '13137707110', '15207233532', '70721a848', '贵州省彬县沙市拉萨街Q座 647072', '2019-01-28 21:05:19');
INSERT INTO `customer` VALUES ('276', '瞿畅', null, null, '7', '5', '23', '李秀兰', '13415577064', '13371254637', '41d80e93a', '西藏自治区成市朝阳朱街a座 170298', '2019-02-11 12:59:20');
INSERT INTO `customer` VALUES ('277', '丁浩', null, null, '6', '5', '22', '范琴', '18001234011', '18250470994', 'c3194b30b', '湖南省鹏市清浦澳门街a座 297048', '2019-02-11 01:58:41');
INSERT INTO `customer` VALUES ('278', '郭浩', null, null, '6', '5', '22', '陈欢', '15879927844', '13017265066', '09cf6a5b9', '安徽省淑珍市平山叶路T座 549192', '2019-02-23 04:54:16');
INSERT INTO `customer` VALUES ('279', '康晶', null, null, '7', '5', '23', '龚丽', '13714054631', '15631119143', '1a7a3ace2', '西藏自治区潮州县淄川银川街T座 594791', '2019-02-01 12:12:36');
INSERT INTO `customer` VALUES ('280', '杨玉', null, null, '7', '2', '23', '任慧', '18981376383', '13781647196', '37ff22ce2', '河南省宇市涪城马街z座 962392', '2019-02-01 10:03:53');
INSERT INTO `customer` VALUES ('281', '翁柳', null, null, '6', '1', '22', '王军', '15865085543', '18763287021', '2bffe5880', '福建省沈阳市永川合肥路C座 960216', '2019-02-17 06:20:18');
INSERT INTO `customer` VALUES ('282', '丛瑞', null, null, '6', '3', '23', '王春梅', '15941795847', '15779321217', 'dd86fee86', '青海省海门市清浦齐齐哈尔街S座 262288', '2019-01-27 13:47:07');
INSERT INTO `customer` VALUES ('283', '石静', null, null, '6', '5', '23', '凌淑华', '14727645969', '18633086135', '78ab8c8ff', '陕西省潜江县华龙董街R座 442179', '2019-02-15 04:27:30');
INSERT INTO `customer` VALUES ('284', '王丽华', null, null, '7', '4', '22', '彭冬梅', '13691994925', '15813058477', 'd7305858d', '吉林省北镇县璧山王街z座 943450', '2019-02-16 17:38:28');
INSERT INTO `customer` VALUES ('285', '吴博', null, null, '7', '3', '22', '金柳', '18205417600', '15060034791', 'e73f7ffc1', '广东省杨市翔安潜江路Z座 297013', '2019-02-08 03:30:54');
INSERT INTO `customer` VALUES ('286', '杜勇', null, null, '6', '1', '23', '钱瑞', '13068764538', '14535082008', '61462f984', '贵州省杭州市门头沟巢湖路X座 897542', '2019-02-10 17:27:31');
INSERT INTO `customer` VALUES ('287', '马淑珍', null, null, '6', '3', '22', '应秀梅', '15765812379', '13607521486', '17170fc2f', '内蒙古自治区楠县清河周路h座 978632', '2019-02-13 18:30:37');
INSERT INTO `customer` VALUES ('288', '傅丹', null, null, '6', '5', '23', '唐敏', '14723157090', '15226518267', '60b3076eb', '辽宁省海门县大兴齐齐哈尔路m座 228864', '2019-02-14 04:23:42');
INSERT INTO `customer` VALUES ('289', '柯娜', null, null, '6', '2', '23', '龙兵', '15654220392', '15949026624', '4f71acba1', '黑龍江省帅县东丽阜新街Z座 324616', '2019-02-12 02:07:31');
INSERT INTO `customer` VALUES ('290', '景秀芳', null, null, '6', '2', '23', '姜秀兰', '18943840668', '18096881951', '924ff1921', '西藏自治区凤兰县上街罗街G座 399531', '2019-02-12 12:41:19');
INSERT INTO `customer` VALUES ('291', '李红', null, null, '6', '2', '22', '范丽', '15540967670', '15127892827', 'fdd70f81b', '广东省龙市沈北新姜路t座 514664', '2019-02-16 07:09:57');
INSERT INTO `customer` VALUES ('292', '刘淑珍', null, null, '6', '5', '22', '黄玉华', '15149961095', '18231884702', '4747f2a0e', '辽宁省伟市金平西宁街L座 505953', '2019-01-25 14:45:33');
INSERT INTO `customer` VALUES ('293', '刘佳', null, null, '7', '4', '23', '张丽华', '14727422469', '18909751591', '303267113', '海南省呼和浩特市房山张家港路C座 978015', '2019-02-12 11:31:13');
INSERT INTO `customer` VALUES ('294', '李桂英', null, null, '7', '4', '23', '石琳', '18765722134', '15373143420', 'e2c44b018', '河北省淮安县大兴罗路J座 393501', '2019-01-25 07:28:26');
INSERT INTO `customer` VALUES ('295', '黄婷', null, null, '7', '2', '22', '王畅', '15355161224', '13272609147', 'a01e176c0', '贵州省汕尾市闵行重庆街N座 224256', '2019-02-07 05:34:36');
INSERT INTO `customer` VALUES ('296', '张晶', null, null, '7', '1', '22', '任伟', '13001579400', '15037536675', '3d232125f', '内蒙古自治区军市和平庄路I座 767777', '2019-02-11 15:13:47');
INSERT INTO `customer` VALUES ('297', '王琳', null, null, '6', '5', '23', '郑桂香', '18638570378', '15938478177', 'b38dea457', '西藏自治区华市徐汇永安路m座 841169', '2019-02-22 13:01:58');
INSERT INTO `customer` VALUES ('298', '曾玉英', null, null, '7', '5', '23', '陈想', '18640137777', '15887199098', '37c7b1fdf', '黑龍江省桂芝市涪城梁街I座 502055', '2019-02-05 14:52:05');
INSERT INTO `customer` VALUES ('299', '鲁雪', null, null, '7', '3', '23', '范畅', '14715842048', '13961540546', '29bc7c05f', '福建省璐市和平季街u座 122561', '2019-02-08 00:06:24');
INSERT INTO `customer` VALUES ('300', '刘涛', null, null, '7', '4', '23', '梁丽丽', '15820868657', '15120483416', '4f611b4e6', '贵州省丽华市东城北京街O座 481530', '2019-02-19 18:38:35');
INSERT INTO `customer` VALUES ('301', '田杰', null, null, '6', '2', '23', '吴晶', '13540579116', '18890001944', '9e78f573a', '山西省合肥县萧山沈街t座 824518', '2019-02-11 11:08:59');
INSERT INTO `customer` VALUES ('302', '李秀芳', null, null, '6', '3', '22', '张婷婷', '15044843014', '15206502469', '6aa7e20ee', '广东省淑华市海陵银川路w座 826361', '2019-02-16 23:51:31');
INSERT INTO `customer` VALUES ('303', '王华', null, null, '7', '2', '23', '包桂香', '13102199134', '13068783240', 'd0645117c', '山西省杨县翔安昆明路p座 522259', '2019-02-12 21:27:04');
INSERT INTO `customer` VALUES ('304', '齐杰', null, null, '6', '4', '23', '刘桂兰', '18592495047', '13576194381', '069990c5e', '青海省济南县璧山济南街t座 150022', '2019-02-12 23:00:14');
INSERT INTO `customer` VALUES ('305', '李东', null, null, '7', '4', '23', '张兵', '18794689510', '13349318114', '118eeef37', '河南省齐齐哈尔市永川周路V座 962381', '2019-02-06 10:22:42');
INSERT INTO `customer` VALUES ('306', '刘兰英', null, null, '7', '1', '23', '屈玲', '15795414764', '15158089681', '222e91298', '陕西省军市萧山陈街v座 635935', '2019-02-07 09:05:13');
INSERT INTO `customer` VALUES ('307', '胡洋', null, null, '6', '2', '23', '武阳', '14785049599', '15386870652', '8f587b092', '内蒙古自治区杭州市牧野蒙路a座 544496', '2019-01-25 09:16:10');
INSERT INTO `customer` VALUES ('308', '王丽华', null, null, '7', '5', '23', '朱秀兰', '14779840493', '15001790687', '80d2c693a', '吉林省济南市友好马街p座 582411', '2019-02-09 05:24:02');
INSERT INTO `customer` VALUES ('309', '王兰英', null, null, '6', '4', '22', '黄丽', '14522694182', '18615684755', '4c30c43d9', '广东省兰英县东城柳州街E座 373113', '2019-02-11 01:36:34');
INSERT INTO `customer` VALUES ('310', '彭桂芝', null, null, '6', '2', '23', '王东', '18698218200', '15144304865', 'c513a8a7d', '黑龍江省洁市吉区嘉禾路T座 101206', '2019-02-13 08:41:36');
INSERT INTO `customer` VALUES ('311', '邱淑华', null, null, '6', '4', '22', '周磊', '18292052550', '15857213631', '688557770', '福建省昆明市翔安张街U座 869131', '2019-02-21 12:23:57');
INSERT INTO `customer` VALUES ('312', '张浩', null, null, '6', '4', '23', '帅慧', '13553141733', '13466657543', '0bfd28c5a', '河北省婷婷市普陀乌鲁木齐路k座 824717', '2019-02-15 00:27:21');
INSERT INTO `customer` VALUES ('313', '马宇', null, null, '6', '3', '22', '李伟', '13614629870', '18541218862', '52842fa0c', '河北省玉梅市清河六安路K座 243196', '2019-02-10 03:28:30');
INSERT INTO `customer` VALUES ('314', '黄东', null, null, '6', '3', '22', '张艳', '15395547819', '14555143583', '505635867', '浙江省桂兰县沙市澳门街L座 788760', '2019-02-19 14:47:15');
INSERT INTO `customer` VALUES ('315', '蓝芳', null, null, '7', '1', '23', '刘娜', '15541138540', '15679775694', '96504e502', '山西省秀荣市白云陈路c座 610053', '2019-02-05 15:41:26');
INSERT INTO `customer` VALUES ('316', '董丽娟', null, null, '6', '4', '22', '熊桂芝', '18116506859', '15127123902', '18af5e5b8', '江西省柳州县清河李路B座 702013', '2019-02-09 14:35:53');
INSERT INTO `customer` VALUES ('317', '杨丹丹', null, null, '6', '2', '22', '宋玉兰', '13186867033', '13855897283', 'a6a0f799f', '云南省丽丽市安次关岭街X座 194644', '2019-02-14 16:34:06');
INSERT INTO `customer` VALUES ('318', '张成', null, null, '6', '2', '23', '聂霞', '13804776540', '13384926665', 'a18c9a8a5', '江苏省洁市浔阳邯郸街r座 208308', '2019-01-29 07:50:00');
INSERT INTO `customer` VALUES ('319', '穆宇', null, null, '7', '5', '22', '黄秀梅', '15962453203', '15927539670', '7420b87f9', '江西省帅县沈北新鞠街d座 127447', '2019-02-16 09:18:46');
INSERT INTO `customer` VALUES ('320', '傅淑珍', null, null, '6', '1', '22', '谢秀芳', '13211026065', '15502114903', 'e0bd6ad40', '江苏省文市南长李街r座 774431', '2019-02-13 18:14:35');
INSERT INTO `customer` VALUES ('321', '焦健', null, null, '6', '2', '22', '程秀云', '18858859440', '15556526339', '31e8e0b38', '江苏省琳市沈北新孟街i座 276800', '2019-02-09 02:49:23');
INSERT INTO `customer` VALUES ('322', '刘玉兰', null, null, '7', '1', '22', '单小红', '13395560781', '18826960929', '1a934015d', '广东省沈阳县永川南宁路x座 453405', '2019-02-08 09:53:05');
INSERT INTO `customer` VALUES ('323', '孙宁', null, null, '7', '5', '22', '王海燕', '13242269495', '18871002928', '8b093e143', '陕西省晶县普陀段街S座 950967', '2019-02-01 23:08:05');
INSERT INTO `customer` VALUES ('324', '赖秀云', null, null, '7', '1', '22', '何桂荣', '13864525582', '13009203352', 'ed149bfe7', '山东省合肥县徐汇蔡路H座 268070', '2019-02-08 11:21:21');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_code` varchar(32) NOT NULL COMMENT '用户账号',
  `user_name` varchar(64) NOT NULL COMMENT '用户名称',
  `user_password` varchar(32) NOT NULL COMMENT '用户密码',
  `user_state` char(1) NOT NULL COMMENT '1:正常,0:暂停',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('5', 'm0003', '小军', '123', '1');
INSERT INTO `sys_user` VALUES ('6', 'm0001', '小红', '123', '1');
INSERT INTO `sys_user` VALUES ('7', 'm0001', '小明', '123', '1');
INSERT INTO `sys_user` VALUES ('8', 'm0001', '小红', '123', '1');
