-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for WEBDANGBAI
CREATE DATABASE IF NOT EXISTS `WEBDANGBAI` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `WEBDANGBAI`;

-- Dumping structure for table WEBDANGBAI.ACCOUNT
CREATE TABLE IF NOT EXISTS `ACCOUNT` (
  `EMAIL` varchar(50) NOT NULL DEFAULT '',
  `STATE` varchar(20) NOT NULL DEFAULT '0',
  `PASSWORD` varchar(50) NOT NULL DEFAULT '',
  `ROLE` int(11) NOT NULL,
  PRIMARY KEY (`EMAIL`),
  KEY `FK1` (`ROLE`),
  CONSTRAINT `FK1` FOREIGN KEY (`ROLE`) REFERENCES `ROLE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.ACCOUNT: ~14 rows (approximately)
INSERT INTO `ACCOUNT` (`EMAIL`, `STATE`, `PASSWORD`, `ROLE`) VALUES
	('admin1@gmail.com', 'Hoạt động', 'admin', 1),
	('admin2@gmail.com', 'Hoạt động', 'admin', 1),
	('admin3@gmail.com', 'Hoạt động', 'admin', 1),
	('admin4@gmail.com', 'Khóa', 'admin', 1),
	('dml@gmail.com', 'Hoạt động', 'Dml@1234', 2),
	('dqm@gmail.com', 'Hoạt động', 'Dqm@1234', 2),
	('dvd@gmail.com', 'Hoạt động', 'Dvd@1234', 2),
	('hch@gmail.com', 'Hoạt động', 'Hch@1234', 2),
	('ltb@gmail.com', 'Hoạt động', 'Ltb@1234', 2),
	('nguyenhieuxt23@gmail.com', 'Hoạt động', 'Abcd1234@', 2),
	('nhg@gmail.com', 'Hoạt động', 'Nhg@1234', 2),
	('nnn@gmail.com', 'Khóa', 'Nnn@1234', 2),
	('nva@gmail.com', 'Hoạt động', 'Nva@1234', 2),
	('nvn@gmail.com', 'Hoạt động', 'Nvn@1234', 2),
	('ttk@gmail.com', 'Hoạt động', 'Ttk@1234', 2),
	('tvc@gmail.com', 'Hoạt động', 'Tvc@1234', 2);

-- Dumping structure for table WEBDANGBAI.ADMININFO
CREATE TABLE IF NOT EXISTS `ADMININFO` (
  `ADMINID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL DEFAULT '',
  `DOB` date NOT NULL,
  `SEX` varchar(10) NOT NULL DEFAULT '',
  `PHONE` varchar(10) NOT NULL DEFAULT '',
  `EMAIL` varchar(50) NOT NULL DEFAULT '',
  `ADDRESS` varchar(50) NOT NULL DEFAULT '',
  `AVATAR` longtext DEFAULT NULL,
  PRIMARY KEY (`ADMINID`),
  KEY `FK__account` (`EMAIL`),
  CONSTRAINT `FK__account` FOREIGN KEY (`EMAIL`) REFERENCES `ACCOUNT` (`EMAIL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.ADMININFO: ~4 rows (approximately)
INSERT INTO `ADMININFO` (`ADMINID`, `NAME`, `DOB`, `SEX`, `PHONE`, `EMAIL`, `ADDRESS`, `AVATAR`) VALUES
	(1, 'Admin Hiếu', '2003-06-14', 'Nam', '0968395850', 'admin1@gmail.com', 'Quảng Trị', NULL),
	(2, 'Admin Hoàng', '2003-01-01', 'Nam', '0767044762', 'admin2@gmail.com', 'Đà Nẵng', NULL),
	(3, 'Admin Minh Hiếu', '2003-12-12', 'Nam', '0968123456', 'admin3@gmail.com', 'Huế', NULL),
	(4, 'Nguyễn Hoàng Minh Hiếu', '2003-12-03', 'Nam', '0968987654', 'admin4@gmail.com', 'Vũng Tàu', NULL);

-- Dumping structure for table WEBDANGBAI.HCMDISTRICT
CREATE TABLE IF NOT EXISTS `HCMDISTRICT` (
  `IDDISTRICT` varchar(10) NOT NULL DEFAULT '',
  `DISTRICT` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`IDDISTRICT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.HCMDISTRICT: ~21 rows (approximately)
INSERT INTO `HCMDISTRICT` (`IDDISTRICT`, `DISTRICT`) VALUES
	('1', 'TP. Thủ Đức'),
	('10', 'Quận 11'),
	('11', 'Quận 12'),
	('12', 'Quận Bình Tân'),
	('13', 'Quận Bình Thạnh'),
	('14', 'Quận Gò Vấp'),
	('15', 'Quận Phú Nhuận'),
	('16', 'Quận Tân Bình'),
	('17', 'Quận Tân Phú'),
	('18', 'Huyện Bình Chánh'),
	('19', 'Huyện Cần Giờ'),
	('2', 'Quận 1'),
	('20', 'Huyện Củ Chi'),
	('21', 'Huyện Hóc Môn'),
	('22', 'Huyện Nhà Bè'),
	('3', 'Quận 3'),
	('4', 'Quận 4'),
	('5', 'Quận 5'),
	('6', 'Quận 6'),
	('7', 'Quận 7'),
	('8', 'Quận 8'),
	('9', 'Quận 10');

-- Dumping structure for table WEBDANGBAI.IMAGE
CREATE TABLE IF NOT EXISTS `IMAGE` (
  `IMAGEID` int(11) NOT NULL AUTO_INCREMENT,
  `NEWSID` int(11) NOT NULL,
  `IMAGE` longtext NOT NULL,
  PRIMARY KEY (`IMAGEID`),
  KEY `FK_image_newslist` (`NEWSID`),
  CONSTRAINT `FK_image_newslist` FOREIGN KEY (`NEWSID`) REFERENCES `NEWSLIST` (`NEWSID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.IMAGE: ~145 rows (approximately)
INSERT INTO `IMAGE` (`IMAGEID`, `NEWSID`, `IMAGE`) VALUES
	(51, 26, '1718001411882.jpg'),
	(52, 26, '1718001411884.jpg'),
	(53, 26, '1718001411886.jpg'),
	(54, 26, '1718001411887.jpg'),
	(55, 26, '1718001411888.png'),
	(56, 27, '1718001629536.jpg'),
	(57, 27, '1718001629537.jpg'),
	(58, 27, '1718001629538.jpg'),
	(59, 28, '1718001788234.jpg'),
	(60, 28, '1718001788236.png'),
	(61, 28, '1718001788241.jpg'),
	(62, 28, '1718001788242.jpg'),
	(63, 28, '1718001788243.jpg'),
	(64, 28, '1718001788245.jpg'),
	(65, 29, '1718002321531.jpg'),
	(66, 29, '1718002321531.jpg'),
	(67, 29, '1718002321531.jpg'),
	(68, 29, '1718002321532.jpg'),
	(69, 29, '1718002321532.jpg'),
	(70, 30, '1718002607793.jpg'),
	(71, 30, '1718002607793.jpg'),
	(72, 30, '1718002607794.jpg'),
	(73, 30, '1718002607794.jpg'),
	(74, 30, '1718002607795.jpg'),
	(75, 30, '1718002607795.jpg'),
	(76, 30, '1718002607796.jpg'),
	(77, 31, '1718002849768.jpg'),
	(78, 31, '1718002849769.jpg'),
	(79, 31, '1718002849770.jpg'),
	(80, 31, '1718002849771.jpg'),
	(81, 32, '1718003072777.jpg'),
	(82, 32, '1718003072778.jpg'),
	(83, 32, '1718003072779.jpg'),
	(84, 33, '1718003255772.jpg'),
	(85, 33, '1718003255773.jpg'),
	(86, 33, '1718003255773.jpg'),
	(87, 33, '1718003255773.jpg'),
	(88, 33, '1718003255773.jpg'),
	(89, 33, '1718003255774.jpg'),
	(90, 33, '1718003255774.jpg'),
	(91, 33, '1718003255775.jpg'),
	(92, 34, '1718003597039.jpg'),
	(93, 34, '1718003597039.jpg'),
	(94, 34, '1718003597041.jpg'),
	(95, 34, '1718003597042.jpg'),
	(96, 34, '1718003597043.jpg'),
	(97, 34, '1718003597043.jpg'),
	(98, 35, '1718003877761.jpg'),
	(99, 35, '1718003877762.jpg'),
	(100, 35, '1718003877762.jpg'),
	(101, 35, '1718003877763.jpg'),
	(102, 35, '1718003877767.jpg'),
	(103, 35, '1718003877769.jpg'),
	(104, 35, '1718003877770.jpg'),
	(105, 35, '1718003877772.jpg'),
	(106, 35, '1718003877773.jpg'),
	(107, 35, '1718003877774.jpg'),
	(108, 35, '1718003877775.jpg'),
	(109, 35, '1718003877776.jpg'),
	(110, 36, '1718004071521.jpg'),
	(111, 36, '1718004071522.jpg'),
	(112, 36, '1718004071523.jpg'),
	(113, 36, '1718004071524.jpg'),
	(114, 36, '1718004071525.jpg'),
	(115, 37, '1718004310286.jpg'),
	(116, 37, '1718004310289.jpg'),
	(117, 37, '1718004310291.jpg'),
	(118, 37, '1718004310293.jpg'),
	(119, 37, '1718004310294.jpg'),
	(120, 38, '1718004511213.jpg'),
	(121, 38, '1718004511216.jpg'),
	(122, 38, '1718004511218.jpg'),
	(123, 38, '1718004511219.jpg'),
	(124, 38, '1718004511220.jpg'),
	(125, 38, '1718004511221.jpg'),
	(126, 38, '1718004511222.jpg'),
	(127, 39, '1718004649451.jpg'),
	(128, 39, '1718004649453.jpg'),
	(129, 39, '1718004649453.jpg'),
	(130, 39, '1718004649455.jpg'),
	(131, 40, '1718005012074.jpg'),
	(132, 40, '1718005012075.jpg'),
	(133, 40, '1718005012075.jpg'),
	(134, 40, '1718005012076.jpg'),
	(135, 40, '1718005012078.jpg'),
	(136, 40, '1718005012079.jpg'),
	(137, 41, '1718005170303.jpg'),
	(138, 41, '1718005170313.jpg'),
	(139, 41, '1718005170316.jpg'),
	(140, 41, '1718005170319.jpg'),
	(141, 42, '1718005394994.jpg'),
	(142, 42, '1718005394995.jpg'),
	(143, 42, '1718005394995.jpg'),
	(144, 42, '1718005394996.jpg'),
	(145, 42, '1718005394997.jpg'),
	(146, 43, '1718005562294.jpg'),
	(147, 43, '1718005562296.jpg'),
	(148, 43, '1718005562298.jpg'),
	(149, 43, '1718005562300.jpg'),
	(150, 43, '1718005562300.jpg'),
	(151, 43, '1718005562301.jpg'),
	(152, 43, '1718005562303.jpg'),
	(153, 44, '1718005712150.jpg'),
	(154, 44, '1718005712151.jpg'),
	(155, 44, '1718005712152.jpg'),
	(156, 44, '1718005712153.jpg'),
	(157, 45, '1718005854958.jpg'),
	(158, 45, '1718005854959.jpg'),
	(159, 45, '1718005854960.jpg'),
	(160, 46, '1718008737872.jpg'),
	(161, 46, '1718008737873.jpg'),
	(162, 46, '1718008737874.jpg'),
	(165, 48, '1718047360610.jpg'),
	(166, 48, '1718047360612.jpg'),
	(167, 48, '1718047360613.jpg'),
	(168, 48, '1718047360614.jpg'),
	(169, 48, '1718047360615.jpg'),
	(170, 48, '1718047360616.jpg'),
	(171, 48, '1718047360617.jpg'),
	(172, 49, '1718051953841.jpg'),
	(173, 49, '1718051953843.jpg'),
	(174, 49, '1718051953844.jpg'),
	(175, 49, '1718051953845.jpg'),
	(176, 50, '1718052052576.jpg'),
	(177, 50, '1718052052578.jpg'),
	(178, 50, '1718052052578.jpg'),
	(179, 50, '1718052052579.jpg'),
	(180, 50, '1718052052584.jpg'),
	(181, 50, '1718052052585.jpg'),
	(182, 51, '1718135623920.jpg'),
	(183, 51, '1718135623921.jpg'),
	(184, 52, '1718157374385.jpg'),
	(185, 52, '1718157374391.jpg'),
	(186, 52, '1718157374400.jpg'),
	(187, 52, '1718157374406.jpg'),
	(188, 53, '1718158274276.jpg'),
	(189, 53, '1718158274284.jpg'),
	(190, 53, '1718158274294.jpg'),
	(191, 53, '1718158274304.jpg'),
	(192, 54, '1718158531310.jpg'),
	(193, 54, '1718158531315.jpg'),
	(194, 54, '1718158531317.jpg'),
	(195, 55, '1718158779499.jpg'),
	(196, 55, '1718158779524.jpg'),
	(197, 55, '1718158779538.jpg'),
	(198, 47, '1718159164830.jpg'),
	(199, 47, '1718159164831.jpg'),
	(200, 47, '1718159164835.jpg'),
	(201, 47, '1718159164836.jpg'),
	(202, 47, '1718159164840.jpg'),
	(203, 47, '1718159164843.jpg');

-- Dumping structure for table WEBDANGBAI.NEWSDETAIL
CREATE TABLE IF NOT EXISTS `NEWSDETAIL` (
  `NEWSID` int(11) NOT NULL AUTO_INCREMENT,
  `SPECIFICADDRESS` varchar(250) NOT NULL DEFAULT '',
  `TIMESTART` date DEFAULT NULL,
  `TIMEEND` date DEFAULT NULL,
  `DESCRIBE` longtext NOT NULL,
  PRIMARY KEY (`NEWSID`),
  CONSTRAINT `FK_newsdetail_newslist` FOREIGN KEY (`NEWSID`) REFERENCES `NEWSLIST` (`NEWSID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.NEWSDETAIL: ~28 rows (approximately)
INSERT INTO `NEWSDETAIL` (`NEWSID`, `SPECIFICADDRESS`, `TIMESTART`, `TIMEEND`, `DESCRIBE`) VALUES
	(26, '202 Đường Hiệp Bình, Phường Hiệp Bình Chánh', '2024-06-10', '2024-06-25', 'HONGBUIHOUSE\r\n\r\nPHÒNG CAO CẤP CHỢ HIỆP BÌNH - PHẠM VĂN ĐỒNG CHỈ 3,7TR 0972.277.298 ( A Hồng)\r\n\r\nPhòng mới xây nằm trong tòa nhà 3 tầng 35 phòng MẶT TIỀN đường Hiệp Bình chi tiết như sau:\r\n\r\nPhòng mới xây dạng chung cư mini, có gác lửng, Diện tích phòng: 18-24 m2\r\n\r\nPhòng thông thoáng, mỗi phòng điều có cửa sổ lấy sáng và gió nên thoáng và cực mát\r\n\r\nHành lang và khu vực công cộng được vệ sinh hàng ngày nên rất sạch sẽ, thoáng mát\r\n\r\nMỗi phòng điều trang bị bếp, chậu rửa, Lavabo, gương, sen tắm, WC riêng từng phòng tất cả điều sử dụng thiết bị cao cấp\r\n\r\nCó sân phơi riêng từng tầng, hệ thống Camera 24/24, hệ thống PCCC an toàn\r\n\r\nInternet, cáp TV cáp quang Viettel, WIFI tốc độ CAO cho bạn luôn LUÔN KẾT NỐI với thế giới bên ngoài qua công nghệ số.\r\n\r\n----------------------\r\n\r\nBán kính 1 - 3km:\r\n\r\nTrung tâm hành chính Thủ Đức, Gigamall Phạm Văn Đồng, ngân hàng, trường học, bệnh viện\r\n\r\nĐại Học Luật, chợ Bình Triệu, nhà ga Bình Triệu, BX Miền Đông\r\n\r\nSiêu thị Co.op Mart Bình Triệu, Bách hóa xanh, Vinmart\r\n\r\nGần các trường đại học: ĐH Luật, ĐH Văn Lang, Hutech, Ngoại Thương, GTVT\r\n\r\nChỉ mất 5 phút là đến Gò Vấp, ĐH Công Nghiệp TPHCM, Sân bay Tân Sơn Nhất\r\n\r\nChỉ mất 10-20 phút đi các quận 1, 2, Phú Nhuận, 7, Bình Thạnh và chỉ 5 phút là đến chợ Thủ Đức.\r\n\r\nKhông kẹt xe, không ngập nước.\r\n\r\nNhà để xe rộng rãi có bảo vệ 24/24.\r\n\r\nDịch vụ tiện ích bách hóa và giặt sấy\r\n\r\n-----------------------\r\n\r\nDiện tích phòng: 18-24 m2\r\n\r\nGiá cho thuê: 3.7 – 3.8 triệu đồng/ tháng\r\n\r\nĐịa chỉ: 202 Hiệp Bình, Phường Hiệp Bình Chánh, TP Thủ Đức, HCM\r\n\r\nSĐT: 0932.013.994 A Trưng (Quản Lý)\r\n\r\nSĐT: 0972.277.298 A Hồng (Chủ Nhà)'),
	(27, '22/2 7, Phường Linh Trung', '2024-06-11', '2024-07-11', 'KTX CAO CẤP CHO NAM MỚI KHAI TRƯƠNG NGAY ngã tư Thủ Đức\r\n\r\n- Được trải nghiệm Môi trường sống Tử Tế, đầy đủ mọi tiện nghi, Cực kỳ sạch sẽ và an ninh, có người lau dọn hàng ngày.\r\n\r\nKTX CHỈ DÀNH CHO NAM\r\n\r\nLiên hệ NGAY để đến tham quan nha\r\n\r\nMiễn phí toàn bộ tiền điện, nước, wifi, máy lạnh, máy giặt, dọn vệ sinh hàng ngày,..\r\n\r\nĐầy đủ mọi tiện nghi, Giờ giấc tự do, An ninh tuyệt đối.\r\n\r\n+ Có phòng học riêng, Phòng bếp riêng, Phòng ngủ riêng\r\n\r\n+ Có người giặt đồ cho hàng ngày\r\n\r\n+ Có người nấu ăn cho các bạn ăn hàng ngày\r\n\r\n+ Bãi xe rộng lớn\r\n\r\n+ Nhiều nhà vệ sinh dùng thoải mái, không lo ”kẹt phà”\r\n\r\n+ Giường tầng homestay cao cấp riêng tư, có sẵn ổ điện, đèn học, bàn riêng trên giường - như hình\r\n\r\n- Mỗi bạn có 2 Tủ đồ riêng có khóa\r\n\r\n+ Máy lạnh 24/24 sài thoải mái\r\n\r\n+ Có người dọn vệ sinh trong ngoài hàng ngày cực kỳ sạch sẽ\r\n\r\n+ Đầy đủ tiện nghi, nấu ăn, ăn uống thoải mái.\r\n\r\nĐịa chỉ: Số nhà 22/2 đường 7, P Linh Trung, TP Thủ Đức, TP HCM - Cách Đại học SPKT – 1,2km, Ngân hàng 500m, Hutech, ĐH Cảnh sát, Khoa học tự nhiên, Nông lâm\r\n\r\n----- Cách ngã tư thủ đức, Khu công nghệ cao – 2km\r\n\r\n*** Giá bao trọn gói 1tr5/ tháng.\r\n\r\nLiên hệ ngay để còn chỗ nhé'),
	(28, '154A Hà Huy Giáp, phường Thạnh Lộc', '2024-05-02', '2025-05-02', 'Vị trí ngay ngã 4 ga, CĐ Kinh tế Công nghệ, Đại học Nguyễn Tất Thành, gần Nguyễn Oanh thuận tiện di chuyển nội khu Q12, Gò Vấp, Tân Bình\r\n\r\nPhòng có 2 dạng: có gác và không gác\r\n\r\n+ Không gác: 13m2 - 2tr3\r\n\r\n+ Có gác: 20m2 2tr8\r\n\r\nTiện ích\r\n\r\nKhu trọ có thang máy nội khu, máy lọc nước uống MIỄN PHÍ\r\n\r\nNhà xe riêng, rộng rãi\r\n\r\nKhông gian khu trọ sạch sẽ, thông thoáng\r\n\r\nĐịa chỉ: 154A Hà Huy Giáp, phường Thạnh Lộc, Q12'),
	(29, '29/2 Đường Phan Văn Đối, Phường Bà Điểm', '2024-06-10', '2024-09-08', 'Cho cặp vợ chồng, gia đình thuê ở lâu dài, 3x5m + gác lửng, vệ sinh khép kín, giờ giấc tự do, không chung chủ, an ninh, sạch sẽ, không nuôi chó mèo, không tụ tập ăn nhậu. Lối đi rộng rãi thoáng mát, có sân rộng để xe và phơi đồ. Đi từ Phan Văn Hớn vô Phan Văn Đối 200m, qua Điện Máy Xanh 20m rẽ phải.\r\n\r\nChỉ phù hợp cho 1 cặp vợ chồng mới cưới, hoặc có 1 - 2 con nhỏ. Những trường hợp khác là không phù hợp.\r\n\r\nGiá: 1triệu 9/tháng, điện 2.500đ/kwh, nước 11.000đ/m3.\r\n\r\nLH Cường: 0707545990'),
	(30, '1 Đường số 5B, Phường An Lạc A', '2024-06-10', '2024-12-07', 'Cần cho thuê phòng khu dân cư đầy đủ tiện nghi , an ninh\r\n\r\nGần Aeon bình tân\r\n\r\nDiện tích 70m2\r\n\r\nKhu dân cư hiện hữu trường học cấp 1,2,3'),
	(31, '105A/17 Hồ Thị Kỷ, Phường 1', '2024-06-10', '2024-07-10', 'Phòng tuyệt đẹp tại trung tâm Quận 10, hẻm rộng rãi thông ra Lê Hồng Phong và Lý Thái Tổ\r\n\r\n️- Nhà đẹp, hẻm rộng an ninh sạch sẽ\r\n\r\n️- Bãi đậu xe rộng rãi an toàn\r\n\r\n️- Phòng ban công rất đẹp, mát mẻ\r\n\r\n️- WC sạch đẹp, sang trọng\r\n\r\n️- Nước tắm nóng lạnh NLMT\r\n\r\n️- Full nội thất và tiện ích: giường, tủ, bàn ghế, bếp, máy lạnh, tủ lạnh…\r\n\r\n️- Máy giặt, máy sấy hiện đại\r\n\r\n️Kế bên chợ hoa và Phố ẩm thực Hồ Thị Kỷ, bán kính 500m ko thiếu thứ gì\r\n\r\n- Giá phòng: 4.0 và 4.7T /1ng-1xe\r\n\r\n- Miễn phí: để xe, wifi, máy giặt, máy sấy, điện- nước và vệ sinh công cộng\r\n\r\nCó ưu đãi khủng cho bạn nào thiện chí và dễ thương nhé.\r\n\r\nLH chính chủ: a. Manh 0909610581\r\n\r\nHân hạnh chào đón các bạn.'),
	(32, 'Xã Nhơn Đức', '2024-06-10', '2024-08-09', 'Cho thuê nhà 1 trệt 1 lầu, gần cầu Long Kiểng giá rẻ.\r\n\r\nNhà rộng, mới xây đang hoàn thiện, thoáng mát, sạch sẽ, ổ điện, ổ mạng âm tường Camera an ninh, giờ giấc tự do\r\n\r\nĐường trước nhà lớn ô tô 7 chỗ vào tới nhà.\r\n\r\nKhu vực an ninh, yên tỉnh..thuận tiện đi Q4, Q5, Q7, Bình Chánh.\r\n\r\nCách Lotte Mart Q7, Vivo City, ĐH Tôn Đức Thắng 10 phút, ĐH mở cơ sở 3 1km.\r\n\r\nChính chủ cho thuê.\r\n\r\nVui lòng liên hệ để biết thêm thông tin. Xin cảm ơn.'),
	(33, 'Đường Nguyễn Hữu Thọ, Xã Phước Kiển', '2024-05-15', '2025-05-15', 'Cho thuê phòng Master Chung cư The Silver Star gần ĐH TĐT, RMIT\r\n\r\nDiện tích: 28m² - Giá 5tr2/ tháng.\r\n\r\nTiện ích:\r\n\r\nFull nội thất như: Giường, nệm, ga phủ, máy lạnh, tủ quần áo, bàn, ghế, sopha ... Có toilet riêng trong phòng.\r\n\r\nFull tiện ích trong khu như khuôn viên rộng rãi, phòng gym, BBQ ngoài trời, BV 24/24, an ninh tuyệt đối, tầng hầm để xe rộng (xe hơi đậu thoải mái), các dịch vụ nhà trẻ, quán ăn, spa,...\r\n\r\nCó dọn dẹp vệ sinh khu sinh hoạt chung 2 lần/ tuần.\r\n\r\nCó kỹ thuật sửa chữa và bảo trì miễn phí các hê thống thiết bị trong căn hộ.\r\n\r\nĐiện nước tính theo đơn giá của nhà nước.\r\n\r\nPhí Dịch Vụ: 170K/ tháng, Xe 100K/ Chiếc, Wifi 75K/ Tháng.\r\n\r\nNhà bếp đủ đồ dùng, máy giặt, tủ lạnh,...\r\n\r\nKề bên các trường Đại Học Tôn Đức Thắng, Đại học Kinh tế tài chính, Đại học RMIT, Lotte Mart, Vivo, BigC, Highland coffee, Phuc Long coffee & Tea.\r\n\r\nTất cả đều đã sẵn sàng xách vali vào ở thôi ạ.\r\n\r\nLiên hệ:0972795587 (Zalo/Mess) hoặc tới văn phòng ở D01 - 06 CC HAGL3 để được tư vấn kỹ hơn ạ.\r\n\r\nNote: Hình ảnh thực tế của phòng cho thuê.'),
	(34, 'Đường Lê Văn Sỹ, Phường 13', '2024-06-10', '2024-09-08', 'CĂN HỘ DỊCH VỤ 2PN +1 BẾP +BAN CÔNG FULL NỘI THẤT\r\n\r\nĐịa chỉ: 195/19 Lê Văn Sỹ, phường 13,Quận 3\r\n\r\nĐặc điểm: Full nội thất như hình, camera an ninh 24/7, giờ giấc tự do, ra vào vân tay, vị trí trung tâm thuận tiện đi lại Q1,Phú Nhuận\r\n\r\nPhí: Điện 3,8k/Kwh, nước 100k/ng, free 2 xe.\r\n\r\nPhí dịch vụ 150k/1ph (wifi, rác, vệ sinh).'),
	(35, '139 Đường Tân Mỹ, Phường Tân Thuận Tây', '2024-06-10', '2024-12-07', 'Cần sang lại dãy phòng trọ đang cho thuê tốt\r\n\r\nBao gồm 41 phòng trọ + 1 mặt bằng (xây dựng năm 2017)\r\n\r\nDiện tích phòng từ 12m2-30m2, giá cho thuê từ 3.5tr-5tr/phòng\r\n\r\nMặt bằng 40m2, giá cho thuê 11.5tr/tháng\r\n\r\nNội thất bao gồm: tivi, tủ lạnh, máy lạnh, máy nước nóng, giường, tủ, bếp\r\n\r\nHệ thống an ninh camera, cửa vân tay, thang máy, hầm để xe, truyền hình cap, wifi\r\n\r\nGiá sang 1.1 tỷ (bao gồm 800tr tiền nội thất và 300tr tiền cọc)\r\n\r\nGiá cho thuê 130tr/tháng, hợp đồng thuê còn 18 năm\r\n\r\nĐịa chỉ: 139 Tân Mỹ, Tân Thuận Tây, Q7 (kế bên trường ĐH Tài Chính-Marketing)\r\n\r\nLiên hệ chính chủ :0963.768.687 gặp Hải để biết thông tin chi tiết'),
	(36, 'Hẻm 350 Huỳnh tấn phát q7 Đường Huỳnh Tấn Phát', '2024-06-10', '2024-08-09', 'Homestay Hoàng Phúc - CAO CẤP - ĐẦY ĐỦ TIỆN NGHI - CHUẨN 2 SAO- Trọn gói chỉ từ 700k trong tháng đầu- các tháng sau chỉ từ 900k đã bao gồm: tiền phòng, điện nước, máy giặt, giữ xe, máy lạnh,wifi, máy tắm nước nóng, nước uống... ( Cam kết không phát sinh).\r\n\r\nTiện ích :\r\n\r\n- Giường tầng thoáng mát, rộng rãi.\r\n\r\n- Tủ quần áo.\r\n\r\n- Máy tắm nước nóng.\r\n\r\n- Máy lạnh.\r\n\r\n- Máy giặt.\r\n\r\n- Nhà bếp tiện nghi đầy đủ dụng cụ.\r\n\r\n- Nước uống miễn phí.\r\n\r\n- Internet 100 Mbps.\r\n\r\n- Phòng sinh hoạt, phòng khách, đọc sách tiện nghi.\r\n\r\n- Máy tắm nước nóng.\r\n\r\n- Sân phơi đồ rộng rãi, dàn phơi thông minh.\r\n\r\n- Có camera an ninh,có bảo vệ.\r\n\r\n- Có người dọn vệ sinh MIỄN PHÍ.\r\n\r\n- Nhà vệ sinh với thiết bị cao cấp (vòi sen, lavabo,...), nước nóng lạnh.\r\n\r\n- Giờ giấc tự do\r\n\r\n- Giữ xe miễn phí.\r\n\r\nChi phí sinh hoạt, ăn uống khu vực xung quanh cực dễ chịu, gần siêu thị Coop mart, Ngay KCX Tan Thuan, Khu Phú Mỹ Hưng...tiện đi lại các quận trung tâm và quận 7.\r\n\r\nYêu cầu: người đi làm có lí lịch rõ ràng, công việc ổn định hoặc học sinh, sinh viên.\r\n\r\nĐịa chỉ: Hẻm 350 Huỳnh tấn phát q7\r\n\r\n———— Địa chỉ: Các chi nhánh q7————\r\n\r\nCs1: 34 đường 36 P. Tân Quy, Q7 (Cách Lotte Mart chỉ 400m )\r\n\r\nCs2: Hẻm 350 Huỳnh Tấn Phát,Q7 (Cách KCX Tan thuan, ĐH Tài Chính Marketing chỉ 500m)\r\n\r\nCác chi nhánh quận khác:\r\n\r\nCs4: 233/11/6 Nguyễn Trãi, P2, Q5\r\n\r\nCs5: 84 Nguyễn tất thành Q4- cách đại học Luật 200m, đại học Nguyễn Tất Thành.\r\n\r\nCs6: Hẻm C4 đường Phạm Hùng Q8 (Gần siêu thị Satra) đến gọi mình ra đón\r\n\r\nThông tin và hình ảnh chính xác 100%'),
	(37, '201/15 Lê Văn Việt, Phường Hiệp Phú', '2024-06-10', '2024-07-10', 'NHÀ TRỌ CAO CẤP LÊ VĂN VIỆT ️️ QUẬN 9\r\n\r\nVì khách trả phòng nên mình cần cho thuê\r\n\r\nGiá: 4 triệu/ tháng\r\n\r\nDiện tích : 22m2\r\n\r\nĐịa chỉ: 201/15 Lê Văn Việt, Phường Hiệp Phú, Q. 9\r\n\r\nFull nội thất\r\n\r\nPhòng thoáng đẹp. An ninh. Hẻm rộng yên tịnh\r\n\r\nCó bảo vệ 24/24 giờ giấc tự do. ⏱⏱\r\n\r\nCó wifi. SCTV ️️\r\n\r\nCó thang máy thẻ từ.\r\n\r\nCó máy lạnh. ️️️\r\n\r\nĐiện: 3.5k/ kwh\r\n\r\nNước: 100k/người ( có nước nóng năng lượng )\r\n\r\n️️Liên hệ: 0932199887 - C Linh\r\n\r\n0933769104 - A Khải'),
	(38, ' Đường Nguyễn Thị Minh Khai, Phường Bến Nghé', '2024-06-10', '2024-08-09', 'Phòng ghép giường tầng Nam Nữ riêng biệt cho sinh viên và người đi làm\r\n\r\nGiá từ 950k - 1tr150k\r\n\r\n- Bao điện, nước, wifi và máy lạnh\r\n\r\n- Phòng và nhà vệ sinh được dọn sạch sẽ hằng ngày\r\n\r\n- Tủ Đồ cá nhân riêng an toàn\r\n\r\n- Khu vực bếp nấu ăn riêng tiện nghi.\r\n\r\n- Có chỗ phơi đồ không bị ẩm mốc trong phòng.\r\n\r\n- Có camera an ninh,có bảo vệ 24/24.\r\n\r\n- Giờ giấc tự do, thoải mái.\r\n\r\n- Môi trường văn minh, Nhân viên thân thiện\r\n\r\n- Khu vục dân trí an ninh'),
	(39, '192 Xóm Chiếu, Phường 14', '2024-06-10', '2024-07-10', 'Nhà còn 1 phòng đầy đủ tiện nghi gồm máy lạnh, tu lạnh, giường, tu quan áo! Nhà ngay mặt tiền cửa so thoáng mát! Ban công trước! Khu dân cư an ninh xe hơi tận cửa! Siêu thị cách vài bước chân! Rất thuận tiện cho các bạn công chức làm việc tại trung tâm! Alo chính chủ!'),
	(40, '965/2-3-4 Đường Trần Hưng Đạo, Phường 7', '2024-04-07', '2025-04-07', 'Cho thuê Phòng Trọ Tiêu Chuẩn Khách sạn ngay Trung Tâm quận 5 - Giá ưu đãi chỉ từ 2.8tr/ tháng\r\n\r\nTIỆN ÍCH:\r\n\r\n- Phòng mới sang sửa, có sẵn nội thất: giường, nệm Kimdan, tủ quần áo, tủ lạnh, máy lạnh, tivi,...\r\n\r\n- Cửa sổ thoáng mát, đồng hồ điện nước riêng cho mỗi phòng.\r\n\r\n- Nhà vệ sinh riêng biệt, sạch sẽ và thoải mái.\r\n\r\n- Free 1 chỗ để xe cho mỗi phòng\r\n\r\n- Khu an ninh, yên tĩnh\r\n\r\nVỊ TRÍ:\r\n\r\n- 956/2 - 3 - 4 Đ. Trần Hưng Đạo, Phường 7, Quận 5, TP.Hồ Chí Minh.\r\n\r\n- Ngay trung tâm quận 5, giao thông thuận tiện đi quận 1, 6, 4, Bình Thạnh.\r\n\r\n- Tiếp giáp với các cung đường lớn: Võ Văn Kiệt, Nguyễn Văn Cừ, Hùng Vương, Ngô Gia Tự,...\r\n\r\n- Gần các trường Đại học lớn: Y Dược, Kinh Tế UEH, ĐH Sài Gòn, ĐH Văn Lang, ĐH Sư Phạm\r\n\r\nƯu tiên sinh viên, nhân viên văn phòng\r\n\r\n️ Hotline: - 0903014454\r\n\r\n- 02839232662\r\n\r\n- 02839232627\r\n\r\nPhòng trọ Ngân Vũ - mang đến không gian sống lý tưởng và tiện nghi'),
	(41, '215B Đường Mai Xuân Thưởng, Phường 6', '2024-06-10', '2024-06-25', 'Phòng trọ mới xây, sạch sẽ, thoáng mát, có nhà vệ sinh riêng, có gác lửng, gần bệnh viện, chợ lớn, trường học, đi lại thuận tiện, an ninh đảm bảo, wifi miễn phí, có chỗ nấu ăn.\r\n\r\nGiá 2tr500 đến 2tr800'),
	(42, '45A/5F Phạm Hùng, Phường 9', '2024-05-08', '2024-08-06', 'Địa chỉ: 45A/5F Phạm Hùng, Phường 9, Quận 8, Hồ Chí Minh. Hẻm kế 37 Phạm Hùng P9 Q8. Khu vực an ninh và yên tĩnh\r\n\r\nGần các trường đại học lớn: ĐH Y Dược, ĐH Y Phạm Ngọc Thạch, ĐH Kinh Tế, ĐH Công Nghệ Sài Gòn,...\r\n\r\n- Phòng mới sơn sửa lại, mát mẻ, cửa sổ thoáng \r\n\r\n- Bếp, nhà vệ sinh riêng trong phòng, có tủ lạnh\r\n\r\n- Sử dụng lối đi riêng, không chủ chung chủ\r\n\r\n- Có máy lạnh\r\n\r\nGIÁ: \r\n\r\n- Còn phòng 3 triệu\r\n\r\n - Đồng hồ điện nước riêng\r\n\r\n- Miễn phí wifi, chỗ để xe \r\n\r\nLIÊN HỆ:  0983766876 & Zalo ( gặp anh Sơn)'),
	(43, '81/27 Đường Tân Thới Nhất 1, Phường Tân Thới Nhất', '2024-06-10', '2024-12-07', 'THÁNG 6 NÀY CHỈ TRỐNG 2 SIÊU PHẨM FULL NỘI THẤT NHANH TAY ĐỂ GIỮ PHÒNG Ạ\r\n\r\nChỉ 3Trx7️, Thiện chí có hỗ trợ thêm\r\n\r\nNgay Tân Thới Nhất 1 - Trường Chinh - Ngã tư An Sương - cầu Tham Lương\r\n\r\nNội thất:\r\n\r\nMáy lạnh , Tủ lạnh\r\n\r\nMệm , Ấm siêu tốc\r\n\r\nBếp từ, Tủ quần áo\r\n\r\nKệ bếp , Máy giặt riêng ...\r\n\r\nTiện ích tòa nhà:\r\n\r\n- Camera 24/7, Bãi xe\r\n\r\n- Cửa cổng vân tay , Giờ giấc tự do\r\n\r\n-Thang máy , PCCC\r\n\r\nZalo/Gọi: 0708.717.289 (Huy) để được tư vấn và xem phòng'),
	(44, '30/2 Đường Calmette, Phường Nguyễn Thái Bình', '2024-06-10', '2024-12-07', 'CHO THUÊ PHÒNG FULL nội thất 30/2 Đường Calmette, Quận 1.\r\n\r\n(link xem video căn hộ, xem thêm link các phòng khác trong album youtube)\r\n\r\n- NHỮNG TIỆN ÍCH MIỄN PHÍ\r\n\r\n• - Internet tốc độ cao\r\n\r\n• - Vệ sinh phòng mỗi tuần\r\n\r\n• - Thay grap, gối, mềm mỗi tuần\r\n\r\n• - Vệ sinh khu vực mỗi tuần\r\n\r\n• - Rác, giữ xe\r\n\r\n-Cho thuê phòng mới 100% FULL Option (hình thật) tại trung tâm Quận 1. Ngay khu tài chính, ngân hàng. Địa chỉ: 30/2 Calmette, Phường Nguyễn Thái Bình, Quận 1 (góc cầu Calmette giao Nguyễn Công Trứ)\r\n\r\n-Vị trí nhà được định vị theo Google Map nên rất dễ tìm kiếm cho việc giao nhận hàng hoặc cho công việc.\r\n\r\n-Toàn bộ căn hộ được thiết kế hiện đại, MỖI CĂN HỘ ĐỀU CÓ TOLET RIÊNG TRONG PHÒNG với trang thiết bị vệ sinh đầy đủ.\r\n\r\n- Nội thất Full option:\r\n\r\n• Giường 1.6m và 1.8m, grap, gối, nệm, táp đầu giường\r\n\r\n• Tủ quần áo 1.0m và 1.2m\r\n\r\n• Smart Tivi 40in, truyền hình kỹ thuật số (kho phim, nhạc, game show…..)\r\n\r\n• Bộ bàn ăn\r\n\r\n• Bàn làm việc\r\n\r\n• Bộ bàn giải trí ngoài ban công\r\n\r\n• Kệ trang trí\r\n\r\n• Tủ lạnh\r\n\r\n• Máy lạnh\r\n\r\n• Tủ bếp\r\n\r\n• Lò vi song, bếp từ, nồi, ấm đun siêu tốc….\r\n\r\n• Thùng rác, kệ giầy…..\r\n\r\n• Tolet: bồn cầu, lavabo, kệ gương, gương soi, vòi tắm sen nóng lạnh.\r\n\r\n-Hệ thống camera giám sát mọi hoạt động 24/24.\r\n\r\n-GIỜ GIẤC SINH HOẠT TỰ DO.\r\n\r\n-Giá phòng: 5 triệu/20m2, 6 triệu/25m2, 7 triệu/30m2, 8 triệu/35m2. Chưa bao gồm tiền điện nước.\r\n\r\nLiên hệ thuê PHÒNG: 0902.995.422\r\n\r\nĐịa chỉ: 30/2 Calmette, Phường Nguyễn Thái Bình, Quận 1, HCM, VN'),
	(45, '13 Thích Minh Nguyệt, Phường 2', '2024-06-10', '2024-07-10', 'Đ/c: số 13 đường Thích Minh Nguyệt, P2, quận Tân Bình\r\n\r\nThuận tiện đi xung quanh TPHCM, gần sân bay\r\n\r\nTiện ích đầy đủ, quán ăn, siêu thị nhiều\r\n\r\nKhu an ninh\r\r\nGần chợ, dành cho những ai đi học hoặc đi lam về trễ nhưng vẫn muốn tự nấu ăn\r\r\nGần công viên, có thể tập tdtt\r\r\nCó máy lạnh, giường 1,6m, đệm, drap mền gối, kệ treo quần áo, tủ lạnh, kệ bếp nấu ăn.\r\n\r\n Máy giặt chung\r\r\nWifi\r\r\nTự do giờ giấc\r\r\nPhí dv: 150k/ ng/ tháng\r\r\nĐiện 4k/kw\r\r\nNước 100k/ng\r\r\nFree dọn dẹp vs khu vực chung\r\r\nFree giặt quần áo\r\r\nFree Internet\r\r\nLH ngay: sđt 0984823523 Anh Hùng để được xem phòng (vui lòng liên hệ trước khi qua xem)'),
	(46, '47 Đường số 9A, Xã Bình Hưng', '2024-06-11', '2024-12-08', 'PHÒNG CÓ THỂ THƯƠNG LƯỢNG GIÁ VÀ CHIA CỌC ĐÓNG NHIỀU LẦN\r\n\r\nƯU ĐÃI NGAY 500.000-1.000.000 Khi checkin ngay\r\n\r\nThuận tiện di chuyển qua Q1, Q5, Q8,.....\r\n\r\nCách ĐH TĐT, RMIT, NTT ,.. chỉ 5 phút đi xe\r\n\r\nCách LotteMart chỉ 300m\r\r\nGiờ giấc tự do, bảo vệ 24/24\r\r\nKhông chung chủ, ra vào vân tay\r\r\nGần siêu thị, trường học, gym, trạm xe bus....\r\r\nPhòng thoáng mát đầy đủ tiện nghi, hầm xe bao rộng\r\r\nHỆ THỐNG PCCC đúng theo quy định\r\r\n‍️Đầy đủ nội thất & Đa dạng giá cả :\r\n\r\nCam kết : hình thật , giá thật\r\r\nLiên hệ: 0363062342'),
	(47, '10/20 Đoàn Nguyễn Tuấn, Xã Tân Quý Tây', '2024-06-12', '2024-07-12', 'Cho thuê phòng trọ mới xây được 2 tháng đường Đoàn Nguyễn Tuấn, Bình Chánh\r\n\r\ngía dao động từ 1tr7 đến 1tr8 tuỳ phòng Xem là thích !\r\n\r\nĐảm bảo\r\n\r\nPhòng đẹp mới xây, Thoáng mát, Sạch Sẽ\r\n\r\nAn Ninh, Chỗ để xe rộng rãi\r\r\nGần các trường đại Học cách ĐH văn hiến 15p đi xe, Cách ĐH Kinh tế 10p đi xe máy\r\r\nGần chợ đầu mối bình điền, khu công nghiệp tân tạo'),
	(48, 'Đường Lê Thúc Hoạch, Phường Phú Thọ Hòa', '2024-06-11', '2024-12-08', 'Khai trương Duplex mới xây ngay Kênh Nước Đen - Lê Thúc Hoạch\r\n\r\nVị trí: ngay Đường Số 4 ( Kênh Nước Đen ) xung quanh chợ, Bách Hoá Xanh,…\r\n\r\nGiá chỉ từ:\r\n\r\n3tr - 3tr2 ( cửa sổ hành lang )\r\n\r\n3tr5 - 3tr7 ( cửa sổ trời )\r\n\r\n4tr ( ban công )\r\n\r\nTrang bị nội thất mới: máy lạnh, tủ quần áo, kệ bếp\r\n\r\nPhòng mới xây chưa qua sử dụng, diện tích rộng, gác cao, cửa sổ thoáng ( view bao chill )\r\n\r\nKhu vực an ninh, giờ giấc tự do, camera an ninh, bãi gửi xe, cổng vân tay\r\r\n️Call/ Zalo: 0938.872.840 ( gặp Trí )\r\n\r\nHỗ trợ tư vấn - Tìm phòng miễn phí'),
	(49, 'Gò Dầu, Phường Tân Quý', '2024-06-11', '2024-07-11', 'Cho thuê phòng trọ 30m2 rộng, có gác lửng, kệ bếp, wc, chậu rửa\r\n\r\nSinh hoạt giờ giấc tự do, giữ xe miễn phí\r\r\nVị trí đắc địa, giao thông thuận tiện, đi 1 phút đến siêu thị AEON MALL TÂN PHÚ, dễ di chuyển đến các đường lớn như: Tân Kỳ Tân Qúy, Lê Trọng Tấn, Cộng Hòa, Âu Cơ,......\r\r\n Gần trường ĐH Công nghệ thực phẩm, Giao Thông Vận Tải, tiện đi đến các quận khác\r\r\nĐa dạng các loại phòng với diện tích và mức giá khác nhau: 20m2, 28m2, 30m2, 40m2\r\r\nPhòng 20m2 Gía 2.7tr/tháng\r\r\nPhòng 28m2 Gía 2.9tr - 3.2tr/tháng\r\r\nPhòng giá 4.tr/tháng (nguyên căn riêng không chung với ai)\r\r\nPhòng giá 3.5tr - 3.8tr/tháng (phòng đầu siêu đẹp, rộng 30m2 - 40m2)\r\r\nTiện ích đầy đủ:\r\r\nPhòng mới xây sửa mới, đẹp như hình\r\r\nCó gác lửng rộng, rộng rãi, kệ nấu căn, chậu rửa inox, nhà vệ sinh riêng\r\r\n Sinh hoạt giờ giấc tự do, tùy ý,  ra vào bằng 2 cửa vân tay bảo mật\r\r\nPhòng đều có cửa sổ mát mẻ, đón gió \r\r\nChỗ để xe siêu rộng, ĐẶC BIỆT KHÔNG THU PHÍ XE\r\r\nChỗ phơi đồ sạch, rộng wifi net rất mạnh, không chung chủ\r\r\nHẻm rộng, xe tải vô thoải mái, khu an ninh, camera giám sát 24/24\r\r\nGỌI NGAYgặp quản lý, để xem phòng0973012642\r\r\nĐịa chỉ: 227/7/9, Phường Tân Quý, Quận Tân Phú, Hồ Chí Minh'),
	(50, '102 Đường Hồ Văn Huê, Phường 9', NULL, NULL, 'Phòng đẹp: Giá: 2.1-2,2tr có của sổ, phòng trọ mới, có gác, WC riêng, Wifi, chỗ để xe, Bảo vệ 24/24, điện nước chính, giờ tự do, có lối đi riêng,có chỗ nấu ăn.\r\n\r\nThích hợp cho các bạn sinh viên hay nhân viên văn phòng ở nhóm 3-4ng ( gần các Trường Đại hoc: ĐH Maketing TP.HCM, ĐH Mỹ Thuật, CĐ Kinh Tế Đối Ngoại) Phòng rộng 20-25m2.\r\n\r\nĐịa chỉ: 102 Ho Văn Huê, P.9, Q.Phú Nhuận, HCM (cách ngã 4 Hoang Van Thu 500m\r\n\r\nTran Khac Chan 50m, ngã 4 Phu Nhuan 700m) .\r\n\r\nLh: chị Hiển Qly 090 6325918 - Mr Hạnh: 0906632009 (chính chủ).'),
	(51, '62D/28 Đường Nguyên Hồng, Phường 11', '2024-06-12', '2024-08-11', '62D/28 Nguyên Hồng ,phường 11 quận Bình Thạnh.\r\n\r\n️Giá 5tr7\r\n\r\nVị Trí khu vực an ninh,tiện di chuyển các quận trung tâm,gần chợ gần trường học,thuận tiện di chuyển các trục đường phạm văn đồng, quận gò vấp,tân bình,quận 1,quận3 đi đâu cũng gần.\r\n\r\n️ gần khu vực vạn kiếp có nhiều đồ ăn ngon .\r\n\r\n1 Tầng 70m2 ,2 phòng( 1Phòng 40 m2,1phòng15m2)\r\n\r\nNội Thất máy giặt,kệ bếp,máy lạnh, nệm,giường , tủ quần áo ,ban công cửa sổ thoáng mát.\r\n\r\nRa vào cửa vân tay, giờ giấc tự do.\r\n\r\nĐiện 4k/ 1 kw\r\r\nNước 100k 1 người / tháng\r\r\nxe 100k 1 chiếc / tháng\r\r\ndịch vụ 100k 1 người / tháng\r\r\nwifi 100k 1 phòng / tháng\r\r\nLiên hệ để được tư vấn và xem phòng trực tiếp sdt:*** zalo ,facebook (Mr Linh)'),
	(52, '97 man thiện, p.hiệp phú', NULL, NULL, 'Mô tả mẫu'),
	(53, ' 541/1 Đường Hương lộ 2, Phường Bình Trị Đông', NULL, NULL, 'Cho thuê phòng: 541/1 Hương Lộ 2, Phường Bình Trị Đông - Quận Bình Tân. HCM\r\n\r\nNgay ngã tư 4 xã ( 200m) - Hoà Bình - Phan Anh - Bình Long - Lũy Bán Bích-\r\r\nNgay cac trung tâm tiện đi lại các quận Tân Bình, 6, 10, 11….\r\r\nGần siêu thị, trung tâm anh ngữ, bến xe buýt,..\r\r\nDiện tích: 12 đến 18 m2, nhiều phòng view đẹp, đều có cửa sổ và Ban Công.\r\r\nGiờ giấc TỰ DO , có BẢO VỆ an ninh trông coi xe 24/24, có nhà ĐỂ XE RIÊNG.\r\r\nPhòng rộng thoáng mát, có GÁC LỬNG và VỆ SINH RIÊNG trong phòng.\r\r\nCó bếp nấu ăn riêng.\r\r\nCó người dọn dẹp vệ sinh\r\r\nCó camera an ninh cho toàn bộ tòa nhà.\r\r\nWifi\r\r\nKhông chung chủ.\r\r\nGiá chỉ từ: 1,9 triệu - 2,5 triệu /tháng.\r\r\nLiên hệ:\r\r\nAnh Hạnh : 0906632009 ( chính chủ)\r\r\nCô Út qly: 0947739903'),
	(54, ' Tân Hòa Đông, Phường Bình Trị Đông', NULL, NULL, 'Khai trương dự án mới toà nhà FULL NEW ngay TÂN HOÀ ĐÔNG - HƯƠNG LỘ 2\r\n\r\nZá chỉ: 2tr8 - 3tr - 3tr2 - 3tr4 ( ban công )\r\n\r\nVị trí siêu đẹp: ngay 298 Tân Hoà Đông tiện di chuyển Quận 6, Quận Tân Phú, Quận 11, Quận 5\r\r\nTrang bị sẵn máy lạnh mới\r\r\nToà nhà có thang máy\r\r\nKhu giặt sấy\r\r\nGiờ giấc tự do, ra vào vân tay\r\r\nBãi gửi xe, camera an ninh\r\r\nHỖ TRỢ TƯ VẤN - TÌM PHÒNG MIỄN PHÍ'),
	(55, '15 man thiện, p. hiệp phú', '2024-06-12', '2024-06-27', 'Mô tả bài đăng 15 ngày');

-- Dumping structure for table WEBDANGBAI.NEWSLIST
CREATE TABLE IF NOT EXISTS `NEWSLIST` (
  `NEWSID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `TITLE` text NOT NULL,
  `ACREAGE` float NOT NULL DEFAULT 0,
  `PRICE` float NOT NULL DEFAULT 0,
  `ADDRESS` varchar(50) NOT NULL DEFAULT '',
  `STATE` varchar(20) NOT NULL DEFAULT '',
  `POSTDURATION` int(11) NOT NULL,
  PRIMARY KEY (`NEWSID`),
  KEY `FK_newslist_userinfo` (`USERID`),
  KEY `FK_newslist_hcmdistrict` (`ADDRESS`),
  KEY `POSTDURATION` (`POSTDURATION`),
  CONSTRAINT `FK_newslist_hcmdistrict` FOREIGN KEY (`ADDRESS`) REFERENCES `HCMDISTRICT` (`IDDISTRICT`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_newslist_pricelist` FOREIGN KEY (`POSTDURATION`) REFERENCES `PRICELIST` (`POSTDURATION`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_newslist_userinfo` FOREIGN KEY (`USERID`) REFERENCES `USERINFO` (`USERID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.NEWSLIST: ~30 rows (approximately)
INSERT INTO `NEWSLIST` (`NEWSID`, `USERID`, `TITLE`, `ACREAGE`, `PRICE`, `ADDRESS`, `STATE`, `POSTDURATION`) VALUES
	(26, 39, 'Phòng cao cấp ngay chợ Hiệp Bình - Phạm Văn Đồng giá thuê chỉ 3,7Tr/tháng. Liên hệ 0972.277.298', 24, 3700000, '1', 'Đã ẩn', 15),
	(27, 39, 'Ngay ĐH SPKT, Ngân Hàng, Hutech Ngay Ngã Tư Thủ Đức - Nhà mới Xây 100% Full Nội Thất, Free Điện nước', 50, 1500000, '1', 'Hoạt động', 30),
	(28, 39, 'TRỌ CHÍNH CHỦ CÓ THANG MÁY, GẦN NGÃ 4 GA, CAO ĐẲNG KINH TẾ CÔNG NGHỆ', 20, 2300000, '11', 'Hoạt động', 365),
	(29, 41, 'Phòng trọ 3x5m + gác, gần chợ Bà Điểm', 15, 1900000, '21', 'Hoạt động', 90),
	(30, 42, 'Cho thuê phòng diện tích lớn 70m và 30m, Khu an ninh gần aeon bình tân tiện ích đầy đủ', 70, 8000000, '12', 'Hoạt động', 180),
	(31, 43, 'Phòng Q10 siêu đẹp full NT - Tiện Ích Full', 20, 4000000, '9', 'Hoạt động', 30),
	(32, 44, 'CHO THUÊ NHÀ TRỌ MỚI XÂY GÍA TỐT', 35, 2800000, '22', 'Hoạt động', 60),
	(33, 44, 'ChoThuê Phòng Master Chung Cư The Silver Star Gần ĐH TĐT, RMIT, ĐH Mở, TDTT', 28, 5200000, '22', 'Hoạt động', 365),
	(34, 45, 'Căn Hộ 2 PN Ban Công Full Nội Thất Mới 100% Ngay Cầu Lê Văn Sỹ', 55, 11000000, '3', 'Hoạt động', 90),
	(35, 46, 'Cần sang nhượng dãy phòng trọ 41 phòng+1 mặt bằng đang cho thuê. LH: 0963.768.687', 500, 1100000000, '7', 'Hoạt động', 180),
	(36, 46, 'Hệ thống Kytucxa Q7 trọn gói 700K: máy lạnh, máy giặt', 30, 700000, '7', 'Hoạt động', 60),
	(37, 47, 'Phòng trọ CHDV cao cấp full nội thất Q9.', 22, 3500000, '1', 'Hoạt động', 30),
	(38, 48, 'Còn tin là còn phòng, Khu trọ qua Q.1 khoảng 900m (giá thật ko đăng ảo)', 30, 950000, '2', 'Hoạt động', 60),
	(39, 48, 'Cho thuê phòng full NT, 20m2, 4tr3 ngay mặt tiền 192 Xóm Chiếu, phường 14, quận 4', 20, 4300000, '4', 'Hoạt động', 30),
	(40, 49, 'Cho thuê phòng trọ tiêu chuẩn khách sạn ngay Trung Tâm quận 5 - Giá ưu đãi chỉ từ 2.8 triệu/ tháng', 24, 2800000, '5', 'Hoạt động', 365),
	(41, 49, 'Cho thuê phòng trọ mới xây quận 6, gần trung tâm', 19, 250000, '6', 'Hoạt động', 15),
	(42, 43, 'Cho thuê phòng gần Đại học Y Dược, Y Phạm Ngọc Thạch, STU, UEH,.. Lối đi riêng, có tủ lạnh, free wifi, xe, giá 3tr/tháng', 18, 3000000, '8', 'Hoạt động', 90),
	(43, 39, 'TRỐNG 2 SIÊU PHẨM FULL NỘI THẤT Ở TÂN THỚI NHẤT 1', 25, 3500000, '10', 'Hoạt động', 180),
	(44, 47, 'Cho thuê phòng full nội thất 30/2 Đường Calmette, Quận 1', 35, 6000000, '2', 'Hoạt động', 180),
	(45, 44, 'Căn hộ full nội thất gần sân bay TSN', 35, 4600000, '16', 'Hoạt động', 30),
	(46, 42, 'Cho Thuê Phòng ở KDC Trung Sơn + Full Nội Thất', 30, 4200000, '18', 'Hoạt động', 180),
	(47, 42, 'Chính chủ cho thuê Nhà trọ mới xây 2 tháng, Phòng đẹp Bình Chánh', 30, 3000000, '1', 'Hoạt động', 30),
	(48, 39, 'Khai trương Duplex mới xây ngay Kênh Nước Đen - Lê Thúc Hoạch', 18, 3000000, '17', 'Đã xóa', 180),
	(49, 42, 'Phòng Trọ 30m2 Thoáng Đẹp, Có Gác Lửng, Kệ Bếp Ngay Aeon Mall Tân Phú', 25, 2600000, '17', 'Hoạt động', 30),
	(50, 44, 'Cho thuê phòng 102 Hồ Văn Huê, Phường 9, Q.Phú Nhuận', 28, 2300000, '15', 'Chờ thanh toán', 180),
	(51, 50, 'Phòng Trọ Full nội thất quận Bình Thạnh', 70, 5700000, '13', 'Hoạt động', 60),
	(52, 39, 'Tiêu đề mẫu', 28, 2500000, '1', 'Chờ duyệt', 60),
	(53, 42, 'Cho thuê phòng trọ rẻ đẹp: 541/1 Hương Lộ 2, P. Bình Trị Đông, Q. Bình Tân ( ngã tư 4 Xã)', 18, 1800000, '12', 'Bị từ chối', 90),
	(54, 42, 'Phòng trọ giá rẻ mới xây FREE DỊCH VỤ - có THANG MÁY ngay TÂN HÒA ĐÔNG', 25, 2800000, '12', 'Chờ duyệt', 365),
	(55, 42, 'Bài đăng 15 ngày', 15, 1500000, '1', 'Hoạt động', 15);

-- Dumping structure for table WEBDANGBAI.NOTIFICATION
CREATE TABLE IF NOT EXISTS `NOTIFICATION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `CONTENT` text NOT NULL,
  `REASON` text DEFAULT NULL,
  `TIME` datetime NOT NULL DEFAULT current_timestamp(),
  `CATEGORY` varchar(50) DEFAULT '',
  `SEEN` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_notification_userinfo` (`USERID`),
  CONSTRAINT `FK_notification_userinfo` FOREIGN KEY (`USERID`) REFERENCES `USERINFO` (`USERID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.NOTIFICATION: ~66 rows (approximately)
INSERT INTO `NOTIFICATION` (`ID`, `USERID`, `CONTENT`, `REASON`, `TIME`, `CATEGORY`, `SEEN`) VALUES
	(99, 39, 'Bài viết có mã số 26 đã được phê duyệt', '', '2024-06-10 14:52:41', 'Bài viết', 0),
	(100, 39, 'Bài viết có mã số 27 đã được phê duyệt', '', '2024-06-10 14:52:45', 'Bài viết', 0),
	(101, 39, 'Bài viết có mã số 28 đã được phê duyệt', '', '2024-06-10 14:52:56', 'Bài viết', 1),
	(102, 41, 'Bài viết có mã số 29 đã được phê duyệt', '', '2024-06-10 14:52:59', 'Bài viết', 0),
	(103, 42, 'Bài viết có mã số 30 đã được phê duyệt', '', '2024-06-10 14:53:02', 'Bài viết', 0),
	(104, 43, 'Bài viết có mã số 31 đã được phê duyệt', '', '2024-06-10 14:53:04', 'Bài viết', 0),
	(105, 44, 'Bài viết có mã số 32 đã được phê duyệt', '', '2024-06-10 14:53:07', 'Bài viết', 0),
	(106, 44, 'Bài viết có mã số 33 đã được phê duyệt', '', '2024-06-10 14:53:09', 'Bài viết', 0),
	(107, 45, 'Bài viết có mã số 34 đã được phê duyệt', '', '2024-06-10 14:53:11', 'Bài viết', 0),
	(108, 46, 'Bài viết có mã số 35 đã được phê duyệt', '', '2024-06-10 14:53:13', 'Bài viết', 0),
	(109, 46, 'Bài viết có mã số 36 đã được phê duyệt', '', '2024-06-10 14:53:16', 'Bài viết', 0),
	(110, 47, 'Bài viết có mã số 37 đã được phê duyệt', '', '2024-06-10 14:53:20', 'Bài viết', 0),
	(111, 48, 'Bài viết có mã số 38 đã được phê duyệt', '', '2024-06-10 14:53:23', 'Bài viết', 0),
	(112, 48, 'Bài viết có mã số 39 đã được phê duyệt', '', '2024-06-10 14:54:08', 'Bài viết', 0),
	(113, 49, 'Bài viết có mã số 40 đã được phê duyệt', '', '2024-06-10 14:54:11', 'Bài viết', 0),
	(114, 49, 'Bài viết có mã số 41 đã được phê duyệt', '', '2024-06-10 14:54:14', 'Bài viết', 0),
	(115, 43, 'Bài viết có mã số 42 đã được phê duyệt', '', '2024-06-10 14:54:16', 'Bài viết', 0),
	(116, 39, 'Bài viết có mã số 43 đã được phê duyệt', '', '2024-06-10 14:54:18', 'Bài viết', 0),
	(117, 47, 'Bài viết có mã số 44 đã được phê duyệt', '', '2024-06-10 14:54:21', 'Bài viết', 0),
	(118, 44, 'Bài viết có mã số 45 đã được phê duyệt', '', '2024-06-10 14:54:24', 'Bài viết', 0),
	(119, 39, 'Thanh toán có mã số 43 đã hoàn tất. Bài đăng 26 đã được hiển thị.', '', '2024-06-10 14:54:39', 'Thanh toán', 0),
	(120, 39, 'Thanh toán có mã số 44 bị lỗi: Thiếu 20k', '', '2024-06-10 14:54:58', 'Thanh toán', 0),
	(121, 39, 'Thanh toán có mã số 44 đã bị từ chối.', 'Không đủ tiền thanh toán', '2024-06-10 14:55:20', 'Thanh toán', 0),
	(122, 39, 'Bài đăng 27 bị từ chối', 'Thanh toán mã số 44 không thành công', '2024-06-10 14:55:20', 'Thanh toán', 0),
	(123, 41, 'Thanh toán có mã số 46 đã hoàn tất. Bài đăng 29 đã được hiển thị.', '', '2024-06-10 14:55:30', 'Thanh toán', 0),
	(124, 44, 'Thanh toán có mã số 62 đã hoàn tất. Bài đăng 45 đã được hiển thị.', '', '2024-06-10 14:55:46', 'Thanh toán', 0),
	(125, 49, 'Thanh toán có mã số 58 đã hoàn tất. Bài đăng 41 đã được hiển thị.', '', '2024-06-10 14:55:49', 'Thanh toán', 0),
	(126, 48, 'Thanh toán có mã số 55 đã hoàn tất. Bài đăng 38 đã được hiển thị.', '', '2024-06-10 14:55:52', 'Thanh toán', 0),
	(127, 46, 'Thanh toán có mã số 53 đã hoàn tất. Bài đăng 36 đã được hiển thị.', '', '2024-06-10 14:55:56', 'Thanh toán', 0),
	(128, 45, 'Thanh toán có mã số 51 đã hoàn tất. Bài đăng 34 đã được hiển thị.', '', '2024-06-10 14:55:59', 'Thanh toán', 0),
	(129, 39, 'Thanh toán có mã số 60 đã hoàn tất. Bài đăng 43 đã được hiển thị.', '', '2024-06-10 14:56:47', 'Thanh toán', 0),
	(130, 39, 'Thanh toán có mã số 45 bị lỗi: Ngân hàng bảo trì', '', '2024-06-10 14:57:10', 'Thanh toán', 1),
	(131, 39, 'Thanh toán có mã số 45 đã hoàn tất. Bài đăng 28 đã được hiển thị.', '', '2024-06-10 14:57:13', 'Thanh toán', 1),
	(132, 42, 'Thanh toán có mã số 47 đã hoàn tất. Bài đăng 30 đã được hiển thị.', '', '2024-06-10 14:57:18', 'Thanh toán', 0),
	(133, 43, 'Thanh toán có mã số 48 đã hoàn tất. Bài đăng 31 đã được hiển thị.', '', '2024-06-10 14:57:21', 'Thanh toán', 0),
	(134, 47, 'Thanh toán có mã số 61 đã hoàn tất. Bài đăng 44 đã được hiển thị.', '', '2024-06-10 14:57:23', 'Thanh toán', 0),
	(135, 49, 'Thanh toán có mã số 57 đã hoàn tất. Bài đăng 40 đã được hiển thị.', '', '2024-06-10 14:57:25', 'Thanh toán', 0),
	(136, 48, 'Thanh toán có mã số 56 đã hoàn tất. Bài đăng 39 đã được hiển thị.', '', '2024-06-10 14:57:27', 'Thanh toán', 0),
	(137, 44, 'Thanh toán có mã số 50 đã hoàn tất. Bài đăng 33 đã được hiển thị.', '', '2024-06-10 14:57:33', 'Thanh toán', 0),
	(138, 43, 'Thanh toán có mã số 59 đã hoàn tất. Bài đăng 42 đã được hiển thị.', '', '2024-06-10 14:58:02', 'Thanh toán', 0),
	(139, 47, 'Thanh toán có mã số 54 đã hoàn tất. Bài đăng 37 đã được hiển thị.', '', '2024-06-10 14:58:04', 'Thanh toán', 0),
	(140, 46, 'Thanh toán có mã số 52 đã hoàn tất. Bài đăng 35 đã được hiển thị.', '', '2024-06-10 14:58:06', 'Thanh toán', 0),
	(141, 44, 'Thanh toán có mã số 49 đã hoàn tất. Bài đăng 32 đã được hiển thị.', '', '2024-06-10 14:58:08', 'Thanh toán', 0),
	(142, 43, 'Bài viết có mã số 42 của bạn đã bị cáo báo!', 'Thông tin sai sự thật, lừa đảo hoặc gian lận', '2024-06-10 15:22:18', 'Bài viết', 0),
	(143, 47, 'Bài viết có mã số 44 của bạn đã bị cáo báo!', 'Spam', '2024-06-10 15:36:33', 'Bài viết', 0),
	(144, 42, 'Bài viết có mã số 46 đã được phê duyệt', '', '2024-06-10 15:49:16', 'Bài viết', 0),
	(145, 49, 'Bài viết có mã số 40 của bạn đã bị cáo báo!', 'Phá giá, mong admin xem xét', '2024-06-10 15:51:37', 'Bài viết', 0),
	(146, 39, 'Bài viết có mã số 48 đã được phê duyệt', '', '2024-06-11 02:23:57', 'Bài viết', 0),
	(147, 39, 'Thanh toán có mã số 64 bị lỗi: Thiếu 60k', '', '2024-06-11 02:24:59', 'Thanh toán', 0),
	(148, 39, 'Thanh toán có mã số 64 đã hoàn tất. Bài đăng 48 đã được hiển thị.', '', '2024-06-11 02:25:04', 'Thanh toán', 0),
	(149, 42, 'Bài viết có mã số 30 của bạn đã bị cáo báo!', 'Tôi muốn báo cáo thôi', '2024-06-11 02:40:37', 'Bài viết', 0),
	(150, 39, 'Bài viết có mã số 48 của bạn đã bị ai đó cáo báo!', 'Thông tin sai sự thật, lừa đảo hoặc gian lận', '2024-06-11 03:09:19', 'Bài viết', 0),
	(151, 39, 'Bài viết có mã số 48 đã bị xóa', 'Hình ảnh sai sự thật', '2024-06-11 03:10:16', 'Bài viết', 1),
	(154, 42, 'Thanh toán có mã số 63 đã hoàn tất. Bài đăng 46 đã được hiển thị.', '', '2024-06-11 03:35:52', 'Thanh toán', 0),
	(155, 42, 'Bài viết có mã số 49 đã được phê duyệt', '', '2024-06-11 03:41:15', 'Bài viết', 0),
	(156, 44, 'Bài viết có mã số 50 đã được phê duyệt', '', '2024-06-11 03:41:25', 'Bài viết', 0),
	(157, 42, 'Thanh toán có mã số 70 đã hoàn tất. Bài đăng 49 đã được hiển thị.', '', '2024-06-11 03:41:31', 'Thanh toán', 0),
	(161, 39, 'Bài viết có mã số 27 đã được phê duyệt', '', '2024-06-11 04:31:48', 'Bài viết', 0),
	(162, 39, 'Thanh toán có mã số 74 đã hoàn tất. Bài đăng 27 đã được hiển thị.', '', '2024-06-11 04:32:15', 'Thanh toán', 1),
	(163, 50, 'Bài viết có mã số 51 đã được phê duyệt', '', '2024-06-12 02:54:22', 'Bài viết', 0),
	(164, 50, 'Thanh toán có mã số 75 đã hoàn tất. Bài đăng 51 đã được hiển thị.', '', '2024-06-12 02:54:30', 'Thanh toán', 0),
	(165, 49, 'Bài viết có mã số 41 của bạn đã bị ai đó cáo báo!', 'Thông tin sai sự thật, lừa đảo hoặc gian lận', '2024-06-12 08:56:27', 'Bài viết', 0),
	(166, 42, 'Bài viết có mã số 47 đã được phê duyệt', '', '2024-06-12 09:02:53', 'Bài viết', 0),
	(167, 42, 'Thanh toán có mã số 76 đã hoàn tất. Bài đăng 47 đã được hiển thị.', '', '2024-06-12 09:04:43', 'Thanh toán', 1),
	(168, 42, 'Bài viết có mã số 53 đã bị từ chối', 'Hình ảnh không thực tế', '2024-06-12 09:12:06', 'Bài viết', 1),
	(169, 42, 'Bài viết có mã số 55 đã được phê duyệt', '', '2024-06-12 09:19:59', 'Bài viết', 0),
	(170, 42, 'Thanh toán có mã số 77 đã hoàn tất. Bài đăng 55 đã được hiển thị.', '', '2024-06-12 09:20:35', 'Thanh toán', 0),
	(171, 42, 'Bài viết có mã số 47 đã được phê duyệt', '', '2024-06-12 09:24:34', 'Bài viết', 0),
	(172, 42, 'Thanh toán có mã số 78 đã hoàn tất. Bài đăng 47 đã được hiển thị.', '', '2024-06-12 09:24:47', 'Thanh toán', 0);

-- Dumping structure for table WEBDANGBAI.PAYMENT
CREATE TABLE IF NOT EXISTS `PAYMENT` (
  `PAYID` int(11) NOT NULL AUTO_INCREMENT,
  `NEWSID` int(11) NOT NULL,
  `PRICE` float NOT NULL DEFAULT 0,
  `TIME` datetime NOT NULL DEFAULT current_timestamp(),
  `ADMINID` int(11) NOT NULL,
  `STATE` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`PAYID`),
  KEY `FK_payment_newslist` (`NEWSID`),
  KEY `FK_payment_admininfo` (`ADMINID`),
  CONSTRAINT `FK_payment_admininfo` FOREIGN KEY (`ADMINID`) REFERENCES `ADMININFO` (`ADMINID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_payment_newslist` FOREIGN KEY (`NEWSID`) REFERENCES `NEWSLIST` (`NEWSID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.PAYMENT: ~29 rows (approximately)
INSERT INTO `PAYMENT` (`PAYID`, `NEWSID`, `PRICE`, `TIME`, `ADMINID`, `STATE`) VALUES
	(43, 26, 330000, '2024-06-10 14:54:39', 1, 'Thành công'),
	(44, 27, 1620000, '2024-06-10 14:55:20', 1, 'Không thành công'),
	(45, 28, 5475000, '2024-05-28 14:57:13', 2, 'Thành công'),
	(46, 29, 1620000, '2024-06-10 14:55:30', 1, 'Thành công'),
	(47, 30, 3060000, '2024-06-10 14:57:18', 2, 'Thành công'),
	(48, 31, 600000, '2024-06-10 14:57:21', 2, 'Thành công'),
	(49, 32, 1140000, '2024-06-10 14:58:08', 3, 'Thành công'),
	(50, 33, 5475000, '2023-05-15 14:57:33', 2, 'Thành công'),
	(51, 34, 1620000, '2024-06-10 14:55:59', 1, 'Thành công'),
	(52, 35, 3060000, '2024-06-10 14:58:06', 3, 'Thành công'),
	(53, 36, 1140000, '2024-06-10 14:55:56', 1, 'Thành công'),
	(54, 37, 600000, '2024-06-10 14:58:04', 3, 'Thành công'),
	(55, 38, 1140000, '2024-06-10 14:55:52', 1, 'Thành công'),
	(56, 39, 600000, '2024-06-10 14:57:27', 2, 'Thành công'),
	(57, 40, 5475000, '2024-04-07 14:57:25', 2, 'Thành công'),
	(58, 41, 330000, '2024-06-10 14:55:49', 1, 'Thành công'),
	(59, 42, 1620000, '2024-05-08 14:58:02', 3, 'Thành công'),
	(60, 43, 3060000, '2024-06-10 14:56:47', 2, 'Thành công'),
	(61, 44, 3060000, '2024-06-10 14:57:23', 2, 'Thành công'),
	(62, 45, 600000, '2024-06-10 14:55:46', 1, 'Thành công'),
	(63, 46, 3060000, '2024-06-11 03:35:52', 2, 'Thành công'),
	(64, 48, 3060000, '2024-06-11 02:25:04', 2, 'Thành công'),
	(70, 49, 600000, '2024-06-11 03:41:31', 1, 'Thành công'),
	(71, 50, 3060000, '2024-06-11 03:41:24', 1, 'Chờ duyệt'),
	(74, 27, 600000, '2024-06-11 04:32:15', 2, 'Thành công'),
	(75, 51, 1140000, '2024-06-12 02:54:30', 1, 'Thành công'),
	(76, 47, 600000, '2024-06-12 09:04:43', 1, 'Thành công'),
	(77, 55, 330000, '2024-06-12 09:20:34', 1, 'Thành công'),
	(78, 47, 600000, '2024-06-12 09:24:47', 1, 'Thành công');

-- Dumping structure for table WEBDANGBAI.PRICELIST
CREATE TABLE IF NOT EXISTS `PRICELIST` (
  `POSTDURATION` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL,
  PRIMARY KEY (`POSTDURATION`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.PRICELIST: ~6 rows (approximately)
INSERT INTO `PRICELIST` (`POSTDURATION`, `PRICE`) VALUES
	(15, 330000),
	(30, 600000),
	(60, 1140000),
	(90, 1620000),
	(180, 3060000),
	(365, 5475000);

-- Dumping structure for table WEBDANGBAI.REPORT
CREATE TABLE IF NOT EXISTS `REPORT` (
  `REPORTID` int(11) NOT NULL AUTO_INCREMENT,
  `NEWSID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  `CONTENT` text NOT NULL,
  `TIME` datetime NOT NULL DEFAULT current_timestamp(),
  `SEEN` int(11) NOT NULL,
  PRIMARY KEY (`REPORTID`),
  KEY `FK__newslist` (`NEWSID`),
  KEY `FK__userinfo` (`USERID`),
  CONSTRAINT `FK__newslist` FOREIGN KEY (`NEWSID`) REFERENCES `NEWSLIST` (`NEWSID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__userinfo` FOREIGN KEY (`USERID`) REFERENCES `USERINFO` (`USERID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.REPORT: ~5 rows (approximately)
INSERT INTO `REPORT` (`REPORTID`, `NEWSID`, `USERID`, `CONTENT`, `TIME`, `SEEN`) VALUES
	(13, 42, 39, 'Thông tin sai sự thật, lừa đảo hoặc gian lận', '2024-06-10 15:22:17', 0),
	(14, 44, 47, 'Spam', '2024-06-10 15:36:32', 1),
	(15, 40, 43, 'Phá giá, mong admin xem xét', '2024-06-10 15:51:36', 1),
	(16, 30, 39, 'Tôi muốn báo cáo thôi', '2024-06-11 02:40:33', 0),
	(17, 48, 47, 'Thông tin sai sự thật, lừa đảo hoặc gian lận', '2024-06-11 03:09:18', 1),
	(18, 41, 39, 'Thông tin sai sự thật, lừa đảo hoặc gian lận', '2024-06-12 08:56:25', 1);

-- Dumping structure for table WEBDANGBAI.ROLE
CREATE TABLE IF NOT EXISTS `ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.ROLE: ~2 rows (approximately)
INSERT INTO `ROLE` (`ID`, `ROLE`) VALUES
	(1, 'admin'),
	(2, 'user');

-- Dumping structure for table WEBDANGBAI.USERINFO
CREATE TABLE IF NOT EXISTS `USERINFO` (
  `USERID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL DEFAULT '',
  `DOB` date DEFAULT NULL,
  `SEX` varchar(10) NOT NULL DEFAULT '',
  `PHONE` varchar(10) NOT NULL DEFAULT '',
  `EMAIL` varchar(50) NOT NULL DEFAULT '',
  `AVATAR` longtext DEFAULT NULL,
  `ADDRESS` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`USERID`),
  KEY `FK_userinfo_account` (`EMAIL`),
  CONSTRAINT `FK_userinfo_account` FOREIGN KEY (`EMAIL`) REFERENCES `ACCOUNT` (`EMAIL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table WEBDANGBAI.USERINFO: ~8 rows (approximately)
INSERT INTO `USERINFO` (`USERID`, `NAME`, `DOB`, `SEX`, `PHONE`, `EMAIL`, `AVATAR`, `ADDRESS`) VALUES
	(39, 'Nguyễn Quang Hiếu', '2001-02-22', 'Nam', '0968395851', 'nguyenhieuxt23@gmail.com', NULL, 'TP. HCM'),
	(41, 'Nguyễn Văn A', NULL, '', '0999999999', 'nva@gmail.com', NULL, ''),
	(42, 'Lê Thị B', NULL, '', '0989111111', 'ltb@gmail.com', NULL, ''),
	(43, 'Trần Văn C', NULL, '', '0989222222', 'tvc@gmail.com', NULL, ''),
	(44, 'Dương Văn D', NULL, '', '0989333333', 'dvd@gmail.com', NULL, ''),
	(45, 'Huỳnh Công H', NULL, '', '0989444444', 'hch@gmail.com', NULL, ''),
	(46, 'Nguyễn Hoàng G', NULL, '', '0989555555', 'nhg@gmail.com', NULL, ''),
	(47, 'Trần Trung K', NULL, '', '0989666666', 'ttk@gmail.com', NULL, ''),
	(48, 'Đỗ Mỹ L', NULL, '', '0989777777', 'dml@gmail.com', NULL, ''),
	(49, 'Đỗ Quang M', NULL, '', '0989888888', 'dqm@gmail.com', NULL, ''),
	(50, 'Nguyễn Ngọc N', '1970-01-22', '', '0989999999', 'nnn@gmail.com', NULL, ''),
	(51, 'Nguyễn Văn Nam', NULL, '', '0986485960', 'nvn@gmail.com', NULL, '');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
