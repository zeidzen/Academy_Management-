-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 29, 2020 at 09:15 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tabasheer_academy`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Type` int(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`Id`, `Name`, `Type`) VALUES
(1, 'Sensors & Modules', 1),
(2, 'Wireless Modules', 1),
(3, 'Biomedical Sensors', 1),
(4, 'Micro-Controllers', 1),
(5, 'CNC & 3D Printer Parts', 1),
(6, 'Course', 2),
(7, 'Programmers & Kits', 1),
(8, 'Arduino', 1),
(9, 'Quadcopter & plane', 1),
(10, 'Raspberry Pi', 1),
(11, 'Robotics Kits', 1),
(12, 'Motors & Drivers', 1),
(13, 'computer science', 2),
(14, 'software engineering ', 2),
(15, 'Engineering', 2),
(16, 'Languages', 2),
(17, 'IOT', 2),
(18, 'IOT', 1),
(22, 'EEG', 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`Id`, `Name`) VALUES
(1, 'Amman'),
(2, 'zarqa'),
(3, 'Irbid'),
(4, 'mafraq'),
(5, 'zzz'),
(6, 'الحسكة');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_course` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Lecturer` varchar(255) NOT NULL,
  `capacity` int(2) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_classes_course` (`Id_course`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`Id`, `Id_course`, `Name`, `Start_Date`, `End_Date`, `Lecturer`, `capacity`, `Date`) VALUES
(1, 1, 'A1', '2020-02-08', '2020-04-04', 'Osama Yousef', 8, '2020-02-08 21:53:08'),
(2, 2, 'A2', '2020-02-08', '2020-02-29', 'zeid zein alabdeen', 8, '2020-02-08 21:53:08'),
(4, 12, 'توم و جيري ', '2020-02-13', '2020-02-20', 'علي', 20, '2020-02-18 11:58:56'),
(5, 16, 'Level1', '2020-02-12', '2020-02-22', 'علي', 5, '2020-02-23 18:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Category` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Brief` varchar(500) NOT NULL,
  `Description` text,
  `Image` text,
  `Price` float NOT NULL,
  `Number_of_hours` int(4) NOT NULL,
  `Views` int(11) NOT NULL DEFAULT '25',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_courses_category` (`Id_Category`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Id`, `Id_Category`, `Name`, `Brief`, `Description`, `Image`, `Price`, `Number_of_hours`, `Views`, `Date`) VALUES
(1, 6, 'Wireless Communication & Sensors Network ', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Pic Microcontroller.\r\nWireless solutions and their applications.\r\nGSM (Global System for Mobile Communications.\r\nPrograming GSM using AT Command.\r\nSending and Receiving (SMS) via Microcontroller and Laptop.\r\nMake a call via Microcontroller and laptop.\r\nSMS Control applications.\r\nBluetooth interfacing with Microcontroller.\r\nControl your home devices using your smart phone.\r\nBuild your Smart Home system using (Zigbee, Bluetooth, GSM).\r\nWireless Sensor Network: technology, protocols, and applications.\r\nZigBee communication system.\r\nSend and Receive data via ZigBee communication.\r\nInterfacing between PC and Microcontroller via ZigBee with point-to-point tropology.\r\nMicrocontroller point-to-point network via ZigBee.\r\nPoint-to-Multipoint network.\r\nGSM based home security system to get intrusion alerts like door, windows open alerts onto your cell phone.\r\nReal-time Bluetooth communication system for control of a mobile Robot.\r\nAntitheft System using motion Sensor and Zigbee.\r\nMulti-sensor (Smoke, Fire, Temperature, Motion, LDR,) Based Smart Home – Zigbee.\r\nAn On-line Monitoring System of Temperature and Motion sensors on GSM, SMS, Zigbee and Bluetooth. \r\nRemote-controlled Smart Home with Zigbee Sensor Network.\r\nZigbee for Building Control Wireless Sensor Networks.\r\nZigbee based Wireless Sensor Networks and Its Applications in Industry.\r\nZigbee based Gas Leak Detection and Data Monitoring System\r\nGPS and Tracking System.\r\nWi-Fi communication system for control of home appliances using android', 'http://mikroelectron.com/UploadedFile/wireless-communication.jpg', 200, 40, 25, '2020-02-08 21:37:54'),
(2, 13, 'Advanced Arduino Course', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', ' التعرف على الاردوينو وأنواعها وقدراتها الصناعية\r\n التعرف على لغات برمجة الاردوينو \r\n التعامل مع المداخل والمخارج الرقمية والتماثلية\r\n التعامل مع جمل التحكم كاملة \r\n كيفية قراءة المجسات المختلفة والتعامل معها من خلال الاردوينو\r\n عمل دوائر تحكم بناءعلى قراءة درجات الحرارة وشدة الاضاءة والفولتية وغيرها \r\n بناء ساعة قياس للفولتية والمقاومة وعرض القراءة على LCD\r\n استخدام انظمة السيريال USART & SPI\r\n ربط اكثر من اردوينو معا وعمل شبكة اتصال \r\nربط الاردوينو بالكمبيوتر و بناء نظام تحكم ومراقبة من خلاله\r\nربط الاردوينو مع SD-card وطرق تخزين البيانات عليها \r\nربط الاردوينو مع اكسل شيت لتسجيل وتخزين قراءات مجسات مختلفة\r\nكيف التعامل مع EEPROM وتخزين البيانات\r\n بناء نظام حماية عن طريق key-pad و LCD\r\nبناء دوئر للتحكم باجهزة 220 V عن طريق الاردوينو\r\n بناء عدادات تصاعدية وتنازلية باستخدام الاردوينو و7-Segments\r\n التعرف على نظام الــ Interrupt وتطبيقاته الاحترافية والعملية\r\n التحكم بسرعة الــ DC Motor من خلال PWM\r\n استخدام Servo motor والتحكم بالاتجاهات\r\n كيفية استخدام الاردوينو في التطبيقات الصناعية\r\n بناء مشاريع تحكم بالاعتماد على قراءات مجسات مختلفة\r\nمدة الدورة : 30 ساعة عملية', 'http://mikroelectron.com/UploadedFile/12715434_822252037896889_325499139670144592_n.jpg', 150, 30, 28, '2020-02-08 21:37:54'),
(3, 6, 'Little Engineer', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'المحاور العلمية التي يستند اليها البرنامج :\r\n\r\nيتعرف الطالب على القطع الالكترونية و استخداماتها.\r\nيتعلم الطالب أساسيات الدارات الكهربائية و الالكترونية.\r\nيطبق الطالب ما تعلمه في تصميم أنظمة الكترونية و بنائها.\r\nيتعلم الطالب فحص الدارات الالكترونية بأجهزة القياس.\r\nيتعلم الطالب حل المشكلات التقنية التي تواجهه في التطبيق العملي للالكترونيات.\r\nينتهي البرنامج بمشروع تخرج عملي لكل طالب على أحد الأنظمة الالكترونية.\r\n\r\n\r\nبرنامج هندسي متكامل :\r\n\r\nيعزز استراتيجية التفكير الهندسي و حل المشكلات.\r\nجميع محاور الدورة ضمن تطبيقات عملية و اشراف كادر مهندسين محترفين.\r\nعمل مشروع الكتروني متكامل لكل طالب يتضمن أحد الأنظمة الاكترونية العملية', 'http://mikroelectron.com/UploadedFile/12741868_822252067896886_2093391076941503606_n.jpg', 100, 40, 25, '2020-02-08 21:40:08'),
(4, 6, 'Raspberry Pi course', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Introduction to Raspberry\r\nInstallation, configuration, accessories and other aspects (3 hours)\r\nIntroduction to Python\r\nIntroduction to programming in Python on the Raspberry Pi (3 hours)\r\nA complete example in Python\r\nRaspberry Pi GPIO module for external connections \r\nHardware basics and using the GPIO (3 hours)\r\nOpencV install and compile (3 hours)\r\nOpenCV Image Processing Basics\r\nObject Detection (Build object follower robot)\r\nFace Detection using OpenCV (6 hours)\r\nHome Automation (Control and monitor sensors from web) (3 hours)\r\nHome Automation (Control and monitor sensors Using bluetooth) (3 hours)\r\nIntroduction, installation Windows 10 Iot Core\r\nIntroduction to C# \r\nIntroduction to programming in C# on the Raspberry Pi (3 hours)\r\nRecord video and capture image \r\nSmart Security System (send an email when motion detect) (3 hours) ', 'http://mikroelectron.com/UploadedFile/10437466_822254871229939_9097033907592208534_n.jpg', 300, 80, 25, '2020-02-08 21:40:08'),
(5, 6, 'Android course', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Android Studio and build User Interface (Set up and walkthrough)\r\nFundamentals of Java Programming used to build Android apps\r\nInputs, Buttons and Reactive (Tap) Interfaces\r\nAndroid Building blocks\r\nVariables, Arrays, Loops, ArrayLists, Listview\r\nNavigate between screens\r\nPassing information between screens\r\nLearn how professional android apps developers think and work\r\nLearn how to design android apps\r\nBuild several amazing apps - Hands on\r\nPublish your apps on Google Play\r\nEarn Money from your Android apps - How to integrate ads in your apps\r\nsync to a server (send and receive data from server)\r\nsend push notification using (GCM)', 'http://mikroelectron.com/UploadedFile/12729090_822251997896893_4890317293145588367_n.jpg', 240, 40, 25, '2020-02-08 21:41:31'),
(6, 6, 'Arduino Course - دورة اردوينو', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'هل واجهت مشكلة في استخدام الاردوينو !!!\r\nهل تريد تطوير مهاراتك في استخدام الاردوينو !!!\r\nحاب تحترف اردوينو وتبدأ في بناء مشاريع ودوائر تحكم خاصة بك !!!\r\nشركة مايكروالكترون بتقدم لك دورة عملية خاصة بالمحترفين حيث تأهلك هذه الدورة لان تصبح محترف اردوينو من البداية حتى النهائية ...\r\n\r\nمحتوى الدورة : \r\n1. التعرف على الاردوينو وأنواعها وقدراتها الصناعية\r\n2. التعرف على لغات برمجة الاردوينو \r\n3. التعامل مع المداخل والمخارج الرقمية والتماثلية\r\n4. التعامل مع جمل التحكم كاملة \r\n5. كيفية قراءة المجسات المختلفة والتعامل معها من خلال الاردوينو\r\n6. عمل دوائر تحكم بناءعلى قراءة درجات الحرارة وشدة الاضاءة والفولتية وغيرها \r\n7. بناء ساعة قياس للفولتية والمقاومة وعرض القراءة على LCD\r\n8. استخدام انظمة السيريال USART & SPI\r\n9. ربط اكثر من اردوينو معا وعمل شبكة اتصال \r\n10. ربط الاردوينو بالكمبيوتر و بناء نظام تحكم ومراقبة من خلاله\r\n11. ربط الاردوينو مع SD-card وطرق تخزين البيانات عليها \r\n12. ربط الاردوينو مع اكسل شيت لتسجيل وتخزين قراءات مجسات مختلفة\r\n13. كيف التعامل مع EEPROM وتخزين البيانات\r\n14. بناء نظام حماية عن طريق key-pad و LCD\r\n15. بناء دوئر للتحكم باجهزة 220 V عن طريق الاردوينو\r\n16. بناء عدادات تصاعدية وتنازلية باستخدام الاردوينو و7-Segments\r\n17. التعرف على نظام الــ Interrupt وتطبيقاته الاحترافية والعملية\r\n18. التحكم بسرعة الــ DC Motor من خلال PWM\r\n19. استخدام Servo motor والتحكم بالاتجاهات\r\n20. كيفية استخدام الاردوينو في التطبيقات الصناعية\r\n21 بناء مشاريع تحكم بالاعتماد على قراءات مجسات مختلفة', 'http://mikroelectron.com/UploadedFile/66518799_2122211281234285_5172539684210868224_n.png', 40, 25, 25, '2020-02-08 21:41:31'),
(8, 13, 'OS', 'An operating system (OS) is the program that, after being initially loaded into the computer by a boot program, manages all of the other application programs in a computer. The application programs make use of the operating system by making requests for services through a defined application program interface (API).', 'An operating system (OS) is the program that, after being initially loaded into the computer by a boot program, manages all of the other application programs in a computer. The application programs make use of the operating system by making requests for services through a defined application program interface (API).', '../static/img/course_image/abstract-technology-particle-background_52683-25766.jpg', 200, 30, 25, '2020-02-18 00:51:12'),
(9, 13, 'Machine Learning', 'Machine learning is an application of artificial intelligence (AI) that provides systems the ability to automatically learn and improve from experience without being explicitly programmed. Machine learning focuses on the development of computer programs that can access data and use it learn for themselves.', 'Machine learning is an application of artificial intelligence (AI) that provides systems the ability to automatically learn and improve from experience without being explicitly programmed. Machine learning focuses on the development of computer programs that can access data and use it learn for themselves.', '../static/img/course_image/research_paper_introduction.jpg', 300, 90, 25, '2020-02-18 00:56:27'),
(10, 14, 'Testing', 'Software testing is an investigation conducted to provide stakeholders with information about the quality of the software product or service under test.', 'Software testing is an investigation conducted to provide stakeholders with information about the quality of the software product or service under test.', '../static/img/course_image/t_a_s_t_i_n_g.png', 100, 20, 25, '2020-02-18 01:11:28'),
(11, 17, 'Arduino  With Python', 'Learn Arduino Online At Your Own Pace. Start Today and Become an Expert in Days. Join Over 40 Million People Learning Online with Udemy. 30-Day Money-Back Guarantee! Pandas Tutorials. 30-Day Money Guarantee. Lifetime Access. REST APIs With Flask.', 'Learn Arduino Online At Your Own Pace. Start Today and Become an Expert in Days. Join Over 40 Million People Learning Online with Udemy. 30-Day Money-Back Guarantee! Pandas Tutorials. 30-Day Money Guarantee. Lifetime Access. REST APIs With Flask.', '../static/img/course_image/Arduino-With-Python-How-to-Get-Started_Watermarked.67d3c045231b.jpg', 300, 60, 25, '2020-02-18 06:34:54'),
(12, 13, 'Deep Learning', 'Deep learning is a subset of machine learning in artificial intelligence (AI) that has networks capable of learning unsupervised from data that is unstructured or unlabeled. Also known as deep neural learning or deep neural network.', 'Deep learning is a subset of machine learning in artificial intelligence (AI) that has networks capable of learning unsupervised from data that is unstructured or unlabeled. Also known as deep neural learning or deep neural network.', '../static/img/course_image/iStock-1181216327-750x422.jpg', 500, 50, 25, '2020-02-18 08:01:31'),
(13, 13, 'Data Analysis', 'Data analysis is a process of inspecting, cleansing, transforming and modeling data with the goal of discovering useful information, informing conclusion and supporting decision-making.', 'Data analysis is a process of inspecting, cleansing, transforming and modeling data with the goal of discovering useful information, informing conclusion and supporting decision-making.', '../static/img/course_image/Business_Data_and_Graph_Analysis.png', 500, 100, 25, '2020-02-22 03:05:20'),
(14, 13, 'Data Mining Techniques', 'Data mining is highly effective, so long as it draws upon one or more of these techniques:', 'Data mining is highly effective, so long as it draws upon one or more of these techniques:', '../static/img/course_image/1 _FmxiAaS1Or1Wpo6-Gf1hw.jpeg', 300, 100, 25, '2020-02-22 03:07:41'),
(15, 17, 'Arduino  3 ', 'Open-source electronic prototyping platform enabling users to create interactive electronic objects.', 'Open-source electronic prototyping platform enabling users to create interactive electronic objects.', '../static/img/course_image/ap550x55016x121transparentt.u1.png', 50, 10, 26, '2020-02-23 09:46:57'),
(16, 13, 'Machine Learning 2 ', 'Machine learning is an application of artificial intelligence (AI) that provides systems the ability to automatically learn and improve from experience without being explicitly programmed. Machine learning focuses on the development of computer programs that can access data and use it learn for themselves.', 'Machine learning is an application of artificial intelligence (AI) that provides systems the ability to automatically learn and improve from experience without being explicitly programmed. Machine learning focuses on the development of computer programs that can access data and use it learn for themselves.', '../static/img/course_image/bigstock-D-Rendering-Of-Human-Brain-O-180772720-1024x683.jpg', 600, 100, 90, '2020-02-23 09:51:46'),
(21, 17, 'OS', ' os1 , os2 , os3', '  os1 , os2 , os3', '../static/img/course_image/abstract-technology-particle-background_52683-25766.jpg', 800, 80, 26, '2020-02-29 08:52:10'),
(22, 13, 'OS', ' OS1 , OS2 , OS3', '  OS1 , OS2 , OS3', '../static/img/course_image/83079780_268049220848946_5471014944637976576_n.jpg', 800, 13, 26, '2020-02-29 08:56:32'),
(23, 13, 'OS', ' OS1 , OS2 , OS3', '  OS1 , OS2 , OS3', '../static/img/course_image/83079780_268049220848946_5471014944637976576_n.jpg', 800, 13, 26, '2020-02-29 08:57:41');

-- --------------------------------------------------------

--
-- Table structure for table `features_courses`
--

DROP TABLE IF EXISTS `features_courses`;
CREATE TABLE IF NOT EXISTS `features_courses` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_course` int(11) NOT NULL,
  `Feature` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_course` (`Id_course`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `features_courses`
--

INSERT INTO `features_courses` (`Id`, `Id_course`, `Feature`) VALUES
(1, 1, 'test'),
(2, 4, 'test'),
(3, 1, 'test'),
(4, 4, 'test'),
(5, 1, 'test'),
(6, 4, 'test'),
(7, 2, 'test'),
(8, 2, 'test'),
(9, 4, 'test'),
(10, 4, 'test'),
(11, 3, 'test'),
(12, 3, 'tset'),
(13, 5, 'test'),
(14, 5, 'test'),
(15, 6, 'test'),
(16, 6, 'test'),
(17, 23, '  OS1 '),
(18, 23, ' OS2 '),
(19, 23, ' OS3');

-- --------------------------------------------------------

--
-- Table structure for table `features_products`
--

DROP TABLE IF EXISTS `features_products`;
CREATE TABLE IF NOT EXISTS `features_products` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Item` int(11) NOT NULL,
  `Feature` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Features_Items` (`Id_Item`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `features_products`
--

INSERT INTO `features_products` (`Id`, `Id_Item`, `Feature`) VALUES
(1, 1, '5V DC or AC circuit'),
(2, 1, 'Requires heater voltage'),
(3, 1, 'Operation Temperature: -10 to 70 degrees C'),
(4, 1, 'Heater consumption: less than 750mW'),
(5, 38, 'ATmega328 microcontroller\r\n'),
(6, 38, 'Input voltage - 7-12V'),
(7, 38, '14 Digital I/O Pins (6 PWM outputs)'),
(8, 38, '6 Analog Inputs'),
(9, 38, '32k Flash Memory'),
(10, 38, '16Mhz Clock Speed'),
(60, 64, 'aaa'),
(59, 64, ' ttt'),
(58, 63, 'tset2'),
(57, 63, ' test1 '),
(56, 62, 'test3 '),
(55, 62, ' test2 '),
(54, 62, '  test1 '),
(53, 61, 'www'),
(52, 61, 'www'),
(51, 61, ' www'),
(47, 59, 'add1 '),
(48, 59, 'add2 '),
(49, 59, ' add3 '),
(50, 59, 'add4');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Category` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Brief` varchar(500) NOT NULL,
  `Description` text,
  `Price` float NOT NULL,
  `Image` text,
  `Views` int(11) NOT NULL DEFAULT '25',
  `Availability` int(1) NOT NULL DEFAULT '1',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Items_category` (`Id_Category`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Id`, `Id_Category`, `Name`, `Brief`, `Description`, `Price`, `Image`, `Views`, `Availability`, `Date`) VALUES
(1, 1, 'Alcohol Gas Sensor MQ-3', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'This alcohol sensor is suitable for detecting alcohol concentration on your breathjust like your common breathalyzer. It has a high sensitivity and fast response time. Sensor provides an analog resistive output based on alcohol concentration. The drive circuit is very simpleall it needs is one resistor. A simple interface could be a 0-3.3V ADC.\r\nPlease review the datasheet for conversions to ppm then Wikipedia.org for BAC.', 5, 'https://mikroelectron.com/ProImg/X4/30f2633c-b0d2-4373-aa56-07fdd67b021e.jpg', 40, 0, '2020-02-08 20:45:12'),
(2, 1, 'CARBON MONOXIDE SENSOR - MQ-7\r\n', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'This is a simple-to-use Carbon Monoxide (CO) sensorsuitable for sensing CO concentrations in the air. The MQ-7 can detect CO-gas concentrations anywhere from 20 to 2000ppm.\r\n\r\nThis sensor has a high sensitivity and fast response time. The sensor\\\'s output is an analog resistance. The drive circuit is very simple; all you need to do is power the heater coil with 5Vadd a load resistanceand connect the output to an ADC.\r\n\r\nThis sensor comes in a package similar to our MQ-3 alcohol sensorand can be used with the breakout board below\r\n\r\nHere at Mikroelectron.comWe give high sensitivity and fast responsive carbon monoxide sensor mq-7Buy @JD5.00 online.carbon monoxide sensor - mq-7', 5, 'https://mikroelectron.com/ProImg/X4/79600046-d417-4e1c-b28d-83a92915228a.png', 15, 1, '2020-02-08 20:45:12'),
(3, 1, 'LPG GAS SENSOR - MQ-6', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'This is a simple-to-use liquefied petroleum gas (LPG) sensorsuitable for sensing  LPG (composed of mostly propane and butane) concentrations in the air. The MQ-6 can detect gas concentrations anywhere from 200 to 10000ppm.\r\n\r\nThis sensor has a high sensitivity and fast response time. The sensor\'s output is an analog resistance. The drive circuit is very simple; all you need to do is power the heater coil with 5Vadd a load resistanceand connect the output to an ADC.\r\n\r\nThis sensor comes in a package similar to our MQ-3 alcohol sensorand can be used with the breakout board below.', 5, 'https://mikroelectron.com/ProImg/X4/9473d8c9-f690-4549-89f4-703e01225aaf.jpg', 50, 1, '2020-02-08 20:48:08'),
(4, 1, 'METHANE CNG GAS SENSOR - MQ-4', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'This is a simple-to-use compressed natural gas (CNG) sensorsuitable for sensing  natural gas (composed of mostly Methane [CH4]) concentrations in the air. The MQ-4 can detect natural gas concentrations anywhere from 200 to 10000ppm.\r\n\r\nThis sensor has a high sensitivity and fast response time. The sensor\\\'s output is an analog resistance. The drive circuit is very simple; all you need to do is power the heater coil with 5Vadd a load resistanceand connect the output to an ADC.\r\n\r\nThis sensor comes in a package similar to our MQ-3 alcohol sensorand can be used with the breakout board below.\r\n\r\nMikroelectron.com offer a wide range of high sensitivity and fast responsive methane cng gas sensor-mq-4 online @ JD7.00 with free shipping.methane cng gas sensor - mq-4', 3, 'https://mikroelectron.com/ProImg/X4/3f793071-adb8-441b-8f18-a6248fef8c5e.jpg', 70, 1, '2020-02-08 20:48:08'),
(5, 2, 'XBEE PRO 60MW WIRE ANTENNA', '\r\n\r\nInstrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'This is the very popular 2.4GHz XBee XBP24-AWI-001 module from Digi. The Pro series have the same pinout and command set of the basic series with an increase output power of 60mW! These modules take the 802.15.4 stack (the basis for Zigbee) and wrap it into a simple to use serial command set. These modules allow a very reliable and simple communication between microcontrollerscomputerssystemsreally anything with a serial port! Point to point and multi-point networks are supported.\r\n\r\nNot sure which XBee module or accessory is right for you? Check out our XBee Buying Guide!', 40, 'https://mikroelectron.com/ProImg/X4/0213c474-305c-4a4a-8e11-c52eec8f5079.jpg', 25, 1, '2020-02-08 20:56:55'),
(6, 2, 'XBEE BREAKOUT ADAPTER', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'https://mikroelectron.com/ProImg/X4/5d6bdfce-f486-4747-9941-4c4c76b89f0d.jpg', 2, 'https://mikroelectron.com/ProImg/X4/5d6bdfce-f486-4747-9941-4c4c76b89f0d.jpg', 90, 1, '2020-02-08 20:56:55'),
(7, 2, 'HC-06 WIRELESS BLUETOOTH MODULE TTL', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Bluetooth (Bluetooth) technologyis a short-range radio technologythe use of \"Bluetooth\" technology that can effectively\r\nSimplify PDAsnotebook computers and mobile phone handsets and other mobile communication terminal communication between devicesbut also to work\r\nThese simplify the device and the Internet (Internet) communication between the communication devices so that these modern and the Internet\r\nData transfer between more quickly and efficientlyto widen the road for wireless communications.\r\nBecause it is the first to deal with the Bluetooth modulefirst come today or small test chopperso Arduino successfully communicate with pc\r\nBar. Let\'s wiringconnect a Bluetooth board +5 V VCCGND connection board Bluetooth-GNDTX motherboard Bluetooth connection\r\nRXRX Connectivity Bluetooth TX. When the Bluetooth module is successfully connected with the PC powerthe Bluetooth module power indicator will flash\r\nShuothe connection indicator will light green.\r\n \r\nHere\'s a look at the programand I let my Arduino receives input \"r\" after the interface is pin13 LED flashes\r\nLookthen output (keyes) words.', 7.5, 'https://mikroelectron.com/ProImg/X4/7b8edeb4-4c32-4a5a-80f4-7dd09bd1fe92.jpg', 20, 1, '2020-02-08 21:04:33'),
(8, 2, 'RF WIRELESS TX & RX ', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'RF modules are widely used for wireless data transfers and remote control applications. These days, cost of RF modules are very low and are compact in size. Most of these RF modules are operating around 433MHz. Amplitude Shift Keying (ASK) or Frequency Shift Keying (FSK) are mainly used for wireless data transfers.', 2, 'https://mikroelectron.com/ProImg/X4/0ce0ac02-a662-46f6-9f09-45f1488d3442.JPG', 25, 1, '2020-02-08 21:04:33'),
(9, 2, 'HT12E + HT12D REMOTE CONTROL RF433 IC\r\n', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', '\r\n\r\nThe HT12E encoders are a series of CMOS LSIs for remote control system applications. They are capable of encoding information which consists of N address bits and 12 N data bits. Each address/ data input can be set to one of the two logic states. The programmed addresses/data are transmitted together with the header bits via an RF or an infrared transmission medium upon receipt of a trigger signal. The capability to select a TE trigger on the HT12E or a DATA trigger on the HT12A further enhances the application flexibility of the 212 series of encoders. The HT12A additionally provides a 38kHz carrier for infrared systems.', 5, 'https://mikroelectron.com/ProImg/X4/a68313d4-007c-4774-87f2-96b713ef7ba6.JPG', 13, 1, '2020-02-08 21:05:58'),
(10, 2, 'RFID CARD READER/WRITER 13.56MHZ', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'MF RC522 is applied to the highly integrated read and write 13.56MHz contactless communication card chipNXP launched by the company for the \"table\" application of a low-voltagelow-costsmall size of the non-contact card chip to read and writesmart meters and portable handheld devices developed better choice. The MF RC522 use of advanced modulation and demodulation concept completely integrated in all types of 13.56MHz passive contactless communication methods and protocols. 14443A compatible transponder signals. The digital part of to handle the ISO14443A frames and error detection. In additionsupport rapid CRYPTO1 encryption algorithmterminology validation MIFARE products. MFRC522 support MIFARE series of high-speed non-contact communicationtwo-way data transmission rate up to 424kbit/s. As new members of the 13.56MHz reader card series of highly integrated chip familyMF RC522 MF RC500 MF RC530 There are a lot of similaritiesbut also have many of the characteristics and differences. Communication between it and the host SPI mode helps to reduce the connection narrow PCB board volumereduce costs.', 9, 'https://mikroelectron.com/ProImg/X4/a68313d4-007c-4774-87f2-96b713ef7ba6.JPG', 29, 1, '2020-02-08 21:05:58'),
(11, 3, 'FINGER HEART RATE SENSOR', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'The Easy Pulse sensor is based on the principle of photoplethysmography (PPG) which is a non-invasive method of measuring the variation in blood volume in tissues using a light source and a detector. Since the change in blood volume is synchronous to the heart beatthis technique can be used to calculate the heart rate. Transmittance and reflectance are two basic types of photoplethysmography. For the transmittance PPGa light source is emitted in to the tissue and a light detector is placed in the opposite side of the tissue to measure the resultant light. Because of the limited penetration depth of the light through organ tissuethe transmittance PPG is applicable to a restricted body partsuch as the finger or the ear lobe. Howeverin the reflectance PPGthe light source and the light detector are both placed on the same side of a body part. The light is emitted into the tissue and the reflected light is measured by the detector. As the light doesn’t have to penetrate the bodythe reflectance PPG can be applied to any parts of human body. In either casethe detected light reflected from or transmitted through the body part will fluctuate according to the pulsatile blood flow caused by the beating of the heart.', 15, 'https://mikroelectron.com/ProImg/X4/6b41de89-332b-4e20-9a67-6911768d0f58.jpg', 25, 1, '2020-02-08 21:07:42'),
(12, 3, 'EAR PULSE SENSOR HRM-2511', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'ear lobe pulse sensor\r\n\r\nheart rate monitor sensor can be connected to sports equipment and pc to measure\r\n\r\nHRM-2511', 30, 'https://mikroelectron.com/ProImg/X4/52d5332d-a6e0-4223-8364-14a1ec6d9a64.jpg', 17, 1, '2020-02-08 21:07:42'),
(13, 3, 'HEART RATE PULSE SENSOR (COPY)', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Heart rate data can be really useful whether you\'re designing an exercise routinestudying your activity or anxiety levels or just want your shirt to blink with your heart beat. The problem is that heart rate can be difficult to measure. Luckilythe Pulse Sensor Amped can solve that problem!\r\n\r\nThe Pulse Sensor Amped is a plug-and-play heart-rate sensor for Arduino. It can be used by studentsartistsathletesmakersand game & mobile developers who want to easily incorporate live heart-rate data into their projects.It essentially combines a simple optical heart rate sensor with amplification and noise cancellation circuitry making it fast and easy to get reliable pulse readings. Alsoit sips power with just 4mA current draw at 5V so it\'s great for mobile applications.\r\n\r\nSimply clip the Pulse Sensor to your earlobe or finger tip and plug it into your 3 or 5 Volt Arduino and you\'re ready to read heart rate! The 24\" cable on the Pulse Sensor is terminated with standard male headers so there\'s no soldering required. Of course Arduino example code is available as well as a Processing sketch for visualizing heart rate data.', 10, 'https://mikroelectron.com/ProImg/X4/ed7c710d-f17c-437d-aa26-1e184deabdea.jpg', 25, 1, '2020-02-08 21:09:02'),
(14, 3, 'HEART RATE PACK', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Read wireless heart-rate data into your electronics projects in under 10 minutes with this educational experimentation kit for Polar wireless heart rate bands. This pack is designed for studentshobbyistsengineers and artists who want to add biometric interactivity to electronics. This is the easiest way possible to do it! No gelno probesno calibration and no clips. Simply strap the band on and detect heartbeats from 4 feet away. \r\n\r\nThe Polar T34 Non-Coded Heart Rate Transmitter monitors and then wirelessly transmits your heart rate data from the chest strap to a Polar WearLink+ compatible receiver.  This allows the wearer to monitor their heart rate. This transmitter can also be paired with your local gym\'s exercise equipment if it is Polar WearLink compatible. ', 70, 'https://mikroelectron.com/ProImg/X4/1ba22443-2658-4410-b853-1ac3718ed5c7.jpg', 55, 1, '2020-02-08 21:09:02'),
(15, 3, 'MUSCLE SENSOR KIT (EMG)', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Advancer Technologies EMG Muscle Sensor V3.0 With Cable And Electrodes\r\n\r\n\r\nThe Advancer Technologies EMG Muscle Sensor V3.0 With Cable And Electrodes will measure the filtered and rectified electrical activity of a muscle; outputting 0-Vs Volts depending the amount of activity in the selected muscle, where Vs signifies the voltage of the power source. Power supply voltage: min. +-3.5V.\r\n\r\nThis Muscle Sensor v3 from Advancer Technologies measures, filters, rectifies, and amplifies the electrical activity of a muscle and produces an analogue output signal that can easily be read by a microcontroller, enabling novel, muscle-controlled interfaces for your projects.', 65, 'https://mikroelectron.com/ProImg/X4/646a02b0-ea23-4640-b5cd-f414a9e762a0.jpg', 25, 1, '2020-02-08 21:12:48'),
(16, 3, 'HEART RATE MONITOR - AD8232', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'The AD8232 SparkFun Single Lead Heart Rate Monitor is a cost-effective board used to measure the electrical activity of the heart. This electrical activity can be charted as an ECG or Electrocardiogram and output as an analog reading. ECGs can be extremely noisythe AD8232 Single Lead Heart Rate Monitor acts as an op amp to help obtain a clear signal from the PR and QT Intervals easily.\r\n\r\nThe AD8232 is an integrated signal conditioning block for ECG and other biopotential measurement applications. It is designed to extractamplifyand filter small biopotential signals in the presence of noisy conditionssuch as those created by motion or remote electrode placement.\r\n\r\nThe AD8232 Heart Rate Monitor breaks out nine connections from the IC that you can solder pinswiresor other connectors to. SDNLO+LO-OUTPUT3.3VGND provide essential pins for operating this monitor with an Arduino or other development board. Also provided on this board are RA (Right Arm)LA (Left Arm)and RL (Right Leg) pins to attach and use your own custom sensors. Additionallythere is an LED indicator light that will pulsate to the rhythm of a heart beat. Biomedical Sensor Pads and Sensor Cable are required to use the heart monitor and can be found in the Recommended Products section below.', 20, 'https://mikroelectron.com/ProImg/X4/4537298a-1ced-4286-affc-674605d4b9d6.jpg', 25, 1, '2020-02-08 21:12:48'),
(17, 4, 'CRYSTAL 10MHZ', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Standard frequency crystals - use these crystals to provide a clock input to your microprocessor. Rated at 20pF capacitance and +/- 50ppm stability. Low profile HC49/US Package.', 0.75, 'https://mikroelectron.com/ProImg/X4/de882334-cbcf-4074-b874-7649ba054bb7.jpg', 25, 1, '2020-02-08 21:14:46'),
(18, 4, 'VOLTAGE REGULATOR 7805 - 5V', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', ' Basic 7805 voltage regulators in the TO-220 package. A must have for basic 5V electronics.', 0.5, 'https://mikroelectron.com/ProImg/X4/a2586221-c33e-4144-8e6f-d00ea2189561.jpg', 25, 1, '2020-02-08 21:14:46'),
(19, 4, 'KEYPAD 4X4\r\n', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Description:\r\n\r\nContact resistance of 500 (Ω)\r\nInsulation resistance 100M (Ω)\r\nKey Operating Force 150-200N\r\nRebound time 1 (ms)\r\nLife of 100 million (times)\r\nOperating Temperature 60 (°C)\r\n1. the electronic characteristics\r\nCircuit Rating: 35V (DC)100mA1W\r\nContact resistance: 10Ω ~ 500Ω\r\n(Varies according to the lead lengths and different from those of the material used)\r\nInsulation resistance: 100MΩ 100V\r\nDielectric Strength: 250VRms (50 ~ 60Hz 1min)\r\nElectric shock jitter: <5ms\r\nLife span: tactile type: ≥ one million times\r\n2. the mechanical properties\r\nOperating pressure: Touch feeling: 170 ~ 397g (6 ~ 14oz)\r\nSwitch travel: touch-type: 0.6 ~ 1.5mm\r\n3. the environment parameters\r\nOperating temperature: -40 to +80\r\nStorage temperature: -40 to +80\r\nTemperature: from 4090% to 95%240 hours\r\nVibration: 20Gmax. (10 ~~ 200Hzthe Mil-SLD-202 M204.Condition B)\r\n', 4, 'https://mikroelectron.com/ProImg/X4/538eb83d-471c-4e52-8f37-6bc39390a76f.jpg', 25, 1, '2020-02-08 21:15:42'),
(20, 4, 'MICROCHIP DSPIC30F3010-30I/SP\r\n', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 15, 'https://mikroelectron.com/ProImg/X4/ddeeea8a-abbe-4cb1-99fd-ea248bc5a828.jpg', 25, 1, '2020-02-08 21:15:42'),
(21, 4, 'PIC18F4520 ORIGINAL\r\n', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'This is a PIC18f4520 microcontroller with a pre-programmed ds30 serial bootloder. You can use a USB-TTLconverter or TTL-RS232 converter to program the microcontroller using the serial interface.\r\n\r\n Parameter Name	 Value\r\nProgram Memory Type	Flash\r\nProgram Memory (KB)	32 (418 Bytes used by Bootloader)\r\nCPU Speed (MIPS)	10\r\nRAM Bytes	1536\r\nData EEPROM (bytes)	256\r\nDigital Communication Peripherals	1-A/E/USART1-MSSP(SPI/I2C)\r\nCapture/Compare/PWM Peripherals	1 CCP1 ECCP\r\nTimers	1 x 8-bit3 x 16-bit\r\nADC	13 ch10-bit\r\nComparators	2\r\nTemperature Range (C)	-40 to 125\r\nOperating Voltage Range (V)	2 to 5.5\r\nPin Count	40', 7.5, 'https://mikroelectron.com/ProImg/X4/85b8ed20-afc2-44d6-9752-cf72bb06eadf.jpg', 25, 1, '2020-02-08 21:25:44'),
(22, 4, 'ZIF SOCKET 40-PIN', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'This is a high-qualityeasy to use 40 pin ZIF socket that is 0.6\" wide with gold-plated contacts. Compatible with 0.3\" up to 0.6\" wide ICs up to 40-pins. Makes for easy connecting or programming to many DIP ICs. High conductivity terminals create solid connections. Armature makes it easy to open and close socket.', 4.5, 'https://mikroelectron.com/ProImg/X4/bc9fa861-4156-42cb-acf6-ff957abdad4d.jpg', 25, 1, '2020-02-08 21:25:44'),
(23, 5, 'EASYDRIVER STEPPER MOTOR DRIVER', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'The EasyDriver is a simple to use stepper motor drivercompatible with anything that can output a digital 0 to 5V pulse (or 0 to 3.3V pulse if you solder SJ2 closed on the EasyDriver). EasyDriver requires a 7V to 20V supply to power the motor and can power any voltage of stepper motor. The EasyDriver has an on board voltage regulator for the digital interface that can be set to 5V or 3.3V. Connect a 4-wire stepper motor and a microcontroller and you’ve got precision motor control! EasyDriver drives bi-polar motorsand motors wired as bi-polar. I.e. 46or 8 wire stepper motors. On this version (v4.4) we fixed the silk error on the min/max adjustment.\r\n\r\nThis is the newest version of EasyDriver V4 co-designed with Brian Schmalz. It provides much more flexibility and control over your stepper motorwhen compared to older versions. The microstep select (MS1 and MS2) pins of the A3967 are broken out allowing adjustments to the microstepping resolution. The sleep and enable pins are also broken out for further control.', 7, 'https://mikroelectron.com/ProImg/X4/2668f826-42c2-4357-ba66-fb95e460766c.jpg', 25, 1, '2020-02-08 21:28:12'),
(24, 5, '3D PRINTER PLA 3.0MM 1KG/SPOOL\r\n', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', '3D Printer PLA 3.0mm 1kg/spool', 40, 'https://mikroelectron.com/ProImg/X4/1cd34eb1-b673-4362-8cdd-e8d9688790e7.jpg', 25, 1, '2020-02-08 21:28:12'),
(25, 5, 'ARDUINO CNC SHIELD V3', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'This shield (HCARDU0086) is designed to allow you to control a CNC router or milling machine from an Arduino board. It contains 4 driver sockets which allows compatible Pololu A4988 driver modules to be inserted (see HCMODU0068 on our website) providing the ability to drive 3 stepper motor axis (XY& Z) plus an optional 4th auxiliary motor. Additional connectors provide easy connection of end stop sensors and control buttons. ', 12, 'https://mikroelectron.com/ProImg/X4/261f47d7-c9b7-4ef9-b84b-c43b2a168473.jpg', 25, 1, '2020-02-08 21:29:25'),
(26, 5, 'STEPSTICK A4988 STEPPER DRIVER', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'A4988 is a complete microstepping motor driver with built-in translator for easy operation. This product is can work in full-stephalf-step1/41/8 and 1/16 step modes. It operates bipolar stepper motors. Output drive capacity of up to 35 V and 2A. The A4988 includes a fixed off-time current regulatorin slow or mixed decay modes. The A4988 converter is the key to the easy implementation. As long as the \"step\" input gets one pulseit will drive the motor one microstep (One palse per microstep). There are no phase sequence tableshigh frequency control linesor complex interfaces to program.\r\n\r\nIn the micro-step operationthe A4988 chopping control automatically selects the current decay mode (Slow or Mixed). In mixed decay modethe device is initially set to a fixed downtime in some fast decaythen the rest of the slow decay downtime. Mixed decay current control scheme results in reduced audible motor noiseincreased step accuracyand reduced power consumption. Internal synchronous rectification control circuitry is provided to improve the pulse-width modulation (PWM) operation power consumption. Internal circuit protection includes: thermal shutdown with hysteresisundervoltage lockout (UVLO)and crossover-current protection. Special power sequencing.', 4.5, 'https://mikroelectron.com/ProImg/X4/a6b6a73b-03f6-4c11-861c-f15da282c028.jpg', 25, 1, '2020-02-08 21:29:25'),
(28, 5, '3D PRINTER HEATER SINGLE HEAD 12V\r\n', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Voltage and Power: 12V 40W\r\nSingle-head Cartridge Heater used to the heating medium which can\'t work in the connection on both endsis widely used in mould heatinghot core boxshoot core machine etc\r\nType: Cartridge Heater\r\nVoltage: 12V\r\nPower:  40W\r\nHeater Material: Stainless Steel\r\nHeater Size: Approx. 20x6mm/ 0.79x0.24\"\r\nLead Wire Length: Approx. 100cm/ 39.37\"', 3, 'https://mikroelectron.com/ProImg/X4/da70989a-63d5-4f0e-b527-52aae016780d.jpg', 25, 1, '2020-02-08 21:30:39'),
(29, 11, 'DC MOTOR GEARBOX WHEEL AND TYRE', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'DC motor with right angled drive reduction gerbox and rubber tyred wheel. This unit is ideal for robot or toy vehicle construction. Ideal for Arduino and other development systems.\r\nLight weight plastic construction gearboxmetal motor rated at 3-6VDC and soft rubber tyre.\r\n\r\nwheel can fit to the left or right of the gearbox and motor can be run in both forward and reverse directions.', 5, 'https://mikroelectron.com/ProImg/X4/22513147-6b1e-4c81-892c-fc39f52c126d.png', 25, 1, '2020-02-13 15:26:42'),
(30, 11, 'ARDUINO UNO KIT', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Product\r\n\r\nQuantity\r\n\r\nArduino UNO R3 1\r\n\r\nMotion Sensor PIR 1\r\n\r\nBREADBOARD WIRES 65PCS 1\r\n\r\nRelay Module 1 channel 1\r\n\r\nMINI SERVO MOTOR SG90 9G 1\r\n\r\nUltrasonic Sensor HC-SR04 1\r\n\r\nBreadboard  830 tie-point 1\r\n\r\nTransistor 2n2222  (NPN) 2\r\n\r\nTransistor 2n3906   (PNP) 2\r\n\r\nDiode (1n4001) 5\r\n\r\nBuzzer 5V 1\r\n\r\nLED 5mm Red 5\r\n\r\nLED 5mm Blue 5\r\n\r\nLED 5mm Green 5\r\n\r\nLED 5mm Yellow 5\r\n\r\nRGB led 1\r\n\r\nPotentiometer 50k ohm 1\r\n\r\nPotentiometer 10k ohm 1\r\n\r\nLCD 16x2 1\r\n\r\nBREAK AWAY MALE HEADERS 1\r\n\r\nLM35 TEMPERATURE SENSOR 1\r\n\r\nLight Sensor LDR(3mm) Sensor 1\r\n\r\nResistor 330 ohm 10\r\n\r\nResistor 1k ohm 5\r\n\r\nResistor 10k ohm 5\r\n\r\nPush Button 4 pin 5\r\n\r\n10K OHM POTENTIOMETER / TRIMPOTS 1\r\n\r\nWires  Female - Male 10', 38, 'https://mikroelectron.com/ProImg/X4/971fc05a-a35d-433a-8cc4-383651be6c74.jpg', 25, 1, '2020-02-13 15:26:42'),
(31, 11, 'SPIDER ROBOT SIX LEGS WITH 18 SERVOS', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Arduino Hexapod Robot has a more natural lookingmore articulate leg and body design. The three DOF (degree of freedom) leg design means this robot can walk in any direction! The robot has been designed to use 18 TowerPro MG996 Servo(Max torque 13kg) servos for the legs. The kit includes everything you need to build the robot. In addition you will need Electronics and Batteries. This is quite possibly the nicest lookingbest performingcommercially available hexapod out there.', 330, 'https://mikroelectron.com/ProImg/X4/cf82c813-26dc-4e85-8c31-cc2c537ddad3.jpg', 25, 1, '2020-02-13 15:28:05'),
(32, 11, '4WD ROBOT SMART CAR 6V DC\r\n', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'DC 6V 4-wheel Robot Smart Car Chassis Kits car with Speed Encoder for Arduino\r\nMechanical structure is simple, very easy to install .\r\nThe car comes with tachometer encoder \r\nUses four deceleration direct current machine curve to be nimble, the directivity is good. Four actuations, horsepower fullness. The chassis big and steady very easy to expand', 25, 'https://mikroelectron.com/ProImg/X4/1fa25767-509d-4466-a7aa-64bf5dbc649a.jpg', 25, 1, '2020-02-13 15:28:05'),
(33, 11, '5DOF ROBOT HAND/FIVE FINGERS/METAL MANIPULATOR ARM/MINI BIONIC RIGHT HAND', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Metal manipulator/arm/holder\r\n\r\n\r\n\r\n1). It used  5 servos to drive, each finger can move flexible.\r\n\r\n2) .It\'s structure with occasional updates, may have small differences with picture, kind prevail.', 190, 'https://mikroelectron.com/ProImg/X4/c2349041-d77d-46af-b48f-55cb08d410fc.jpg', 25, 1, '2020-02-13 15:30:10'),
(34, 11, 'LEGO ROBOT MINDSTORM EV3 CORE SET 45544 (541 LEGO PART)', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Lego Mindstorm Ev3 Core Set 45544 \r\n\r\nLEGO® MINDSTORMS® Education EV3 Core Set is a hands-on, cross-curricular STEM solution that engages students by providing the resources to design, build and program their creations while helping them develop essential skills such as creativity, critical thinking, collaboration, and communication. A Core Set supports two students and comes with a getting-started guide, video tutorials, and standards-aligned lesson plans. An eLearning program is included for educators.\r\n\r\n\r\nThis core set is optimized for classroom use and contains all you need to teach using the exciting LEGO® MINDSTORMS® set. It enables students to build, program and test their solutions based on real life robotics technology.', 590, 'https://mikroelectron.com/ProImg/X4/a0b5073e-5faf-4a84-b359-6927c0755a08.jpg', 25, 1, '2020-02-13 15:30:10'),
(35, 11, 'TANK CAR WITH DUAL DC MOTOR', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'DoRobot Smart Tank Car Chassis Tracked Caterpillar Crawler Robot Platform with Dual DC 12V 350rpm Motor for DIY Arduino T101-P\r\n\r\nProduct Type: T101-P\r\nColor : Blue\r\nProduct Size: 19.3 * 16.3 * 6cm (L * W * H)\r\nProduct weight: 0.47kg\r\nPanel material: 2mm aluminum\r\nSurface treatment: sandblasting oxidation\r\nTrack: Engineering Plastics\r\nMotor: 6-12V\r\nWheels: Plastic', 40, 'https://mikroelectron.com/ProImg/X4/e1f8ca5e-643c-4bd1-9980-5a3019b916d7.jpg', 25, 1, '2020-02-13 15:31:48'),
(36, 11, 'SMART CAR SELF-BALANCING KITS (281RPM/MIN)', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', '25GA-370 gear motor*1\r\n65MM wheel*1   \r\n4MM Couplings *1\r\n25 bracket *1\r\nMotor : 281rpm/min 3-9V\r\nSome matching screws', 20, 'https://mikroelectron.com/ProImg/X4/cc3a1e5a-e067-47ee-ad37-df16f12acad0.jpg', 25, 1, '2020-02-13 15:31:48'),
(37, 8, 'ARDUINO MEGA 2560 R3', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Arduino is an open-source physical computing platform based on a simple i/o board and a development environment that implements the Processing/Wiring language. Arduino can be used to develop stand-alone interactive objects or can be connected to software on your computer (e.g. FlashProcessingMaxMSP). The open-source IDE can be downloaded for free (currently for Mac OS XWindowsand Linux).\r\n\r\nThe Arduino Mega is a microcontroller board based on the ATmega2560. It has 54 digital input/output pins (of which 14 can be used as PWM outputs)16 analog inputs4 UARTs (hardware serial ports)a 16 MHz crystal oscillatora USB connectiona power jackan ICSP headerand a reset button. It contains everything needed to support the microcontroller; simply connect it to a computer with a USB cable or power it with a AC-to-DC adapter or battery to get started. The Mega is compatible with most shields designed for the Arduino Duemilanove or Diecimila.\r\n\r\nThe Mega 2560 R3 also adds SDA and SCL pins next to the AREF. In additionthere are two new pins placed near the RESET pin. One is the IOREF that allow the shields to adapt to the voltage provided from the board. The other is a not connected and is reserved for future purposes. The Mega 2560 R3 works with all existing shields but can adapt to new shields which use these additional pins.\r\n\r\nNot sure which Arduino or Arduino-compatible board is right for you? Check out our Arduino Buying Guide!', 12, 'https://mikroelectron.com/ProImg/X4/ed20e8a7-5753-4a4c-aa3c-517cddec0cda.jpg', 25, 1, '2020-02-13 15:41:11'),
(38, 8, 'ARDUINO UNO - R3', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', ' This is the new Arduino Uno R3. In addition to all the features of the previous boardthe Uno now uses an ATmega16U2 instead of the 8U2 found on the Uno (or the FTDI found on previous generations). This allows for faster transfer rates and more memory. No drivers needed for Linux or Mac (inf file for Windows is needed and included in the Arduino IDE)and the ability to have the Uno show up as a keyboardmousejoysticketc.\r\n\r\nThe Uno R3 also adds SDA and SCL pins next to the AREF. In additionthere are two new pins placed near the RESET pin. One is the IOREF that allow the shields to adapt to the voltage provided from the board. The other is a not connected and is reserved for future purposes. The Uno R3 works with all existing shields but can adapt to new shields which use these additional pins.\r\n\r\nArduino is an open-source physical computing platform based on a simple i/o board and a development environment that implements the Processing/Wiring language. Arduino can be used to develop stand-alone interactive objects or can be connected to software on your computer (e.g. FlashProcessingMaxMSP). The open-source IDE can be downloaded for free (currently for Mac OS XWindowsand Linux).', 8, 'https://mikroelectron.com/ProImg/X4/453bee44-e38a-469b-82bf-04af59c3c102.jpg', 25, 1, '2020-02-13 15:41:11'),
(39, 8, 'ARDUINO LEONARDO\r\n', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Arduino is an open-source physical computing platform based on a simple i/o board and a development environment that implements theProcessing/Wiring language. Arduino can be used to develop stand-alone interactive objects or can be connected to software on your computer (e.g. FlashProcessingMaxMSP). The open-source IDE can bedownloaded for free (currently for Mac OS XWindowsand Linux).\r\n\r\nThe Leonardo is Arduino\\\'s first development board to use one microcontroller with built-in USB. Using the ATmega32U4 as its sole microcontroller allows it to be cheaper and simpler. Alsobecause the 32U4 is handling the USB directlycode libraries are available which allow the board to emulate a computer keyboardmouseand more using the USB-HID protocol!\r\n\r\nIt has 20 digital input/output pins (of which 7 can be used as PWM outputs and 12 as analog inputs)a 16 MHz crystal oscillatora micro USB connectiona power jackan ICSP headerand a reset button. It contains everything needed to support the microcontroller; simply connect it to a computer with a USB cable or power it with a AC-to-DC adapter or battery to get started.\r\n\r\nNot sure which Arduino or Arduino-compatible board is right for you? Check out our Arduino Buying Guide!', 19, 'https://mikroelectron.com/ProImg/X4/644d6ff3-d8ea-461e-b59c-2da36ec9a78d.jpg', 25, 1, '2020-02-13 15:42:27'),
(40, 8, 'ARDUINO ETHERNET SHIELD W5100\r\n', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'The Arduino Ethernet Shield allows an Arduino board to connect to the internet. It is based on the Wiznet W5100 ethernet chip providing a network (IP) stack capable of both TCP and UDP. The Arduino Ethernet Shield supports up to four simultaneous socket connections. Use the Ethernet library to write sketches which connect to the internet using the shield.\r\n\r\nThe ethernet shield connects to an Arduino board using long wire-wrap headers which extend through the shield. This keeps the pin layout intact and allows another shield to be stacked on top..\r\n\r\nThe latest revision of the shield adds a micro-SD card slotwhich can be used to store files for serving over the network. It is compatible with the Arduino UNO and Mega (using the Ethernet library coming in Arduino 0019). An SD card library is not yet included in the standard Arduino distribution.\r\n\r\nArduino communicates with both the W5100 and SD card using the SPI bus (through the ICSP header). This is on digital pins 1112and 13 on the Duemilanove and pins 5051and 52 on the Mega. On both boardspin 10 is used to select the W5100 and pin 4 for the SD card. These pins cannot be used for general i/o. On the Megathe hardware SS pin53is not used to select either the W5100 or the SD cardbut it must be kept as an output or the SPI interface won\'t work.\r\n\r\nNote that because the W5100 and SD card share the SPI busonly one can be active at a time. If you are using both peripherals in your programthis should be taken care of by the corresponding libraries. If you\'re not using one of the peripherals in your programhoweveryou\'ll need to explicitly deselect it. To do this with the SD cardset pin 4 as an output and write a high to it. For the W5100set digital pin 10 as a high output.\r\n\r\nThe shield provides a standard RJ45 ethernet jack.', 25, 'https://mikroelectron.com/ProImg/X4/7e5b4baf-00e9-41af-b141-9738de737491.jpg', 25, 1, '2020-02-13 15:42:27'),
(41, 8, 'ARDUINO NANO ORIGINAL\r\n', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Arduino Nano is a surface mount breadboard embedded version with integrated USB. It is a smallestcompleteand breadboard friendly. It has everything that Diecimila/Duemilanove has (electrically) with more analog input pins and onboard +5V AREF jumper. Physicallyit is missing power jack. The Nano is automatically sense and switch to the higher potential source of powerthere is no need for the power select jumper.\r\n\r\nNano’s got the breadboard-ability of the Boarduino and the Mini+USB with smaller footprint than eitherso users have more breadboard space. It’s got a pin layout that works well with the Mini or the Basic Stamp (TXRXATNGND on one toppower and ground on the other). This new version 3.0 comes with ATMEGA328 which offer more programming and data memory space. It is two layers. That make it easier to hack and more affordable.\r\n\r\nYou end up paying less with Nano than Mini and USB combined!', 10, 'https://mikroelectron.com/ProImg/X4/972576cb-e634-4a37-9514-0eea62fffa92.jpg', 25, 1, '2020-02-13 15:43:05'),
(42, 8, 'ARDUINO DUE MICROCONTROLLER BOARD', 'Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.', 'Arduino Due Microcontroller Board is based on the 32-bit processor Atmel SAM3X8E ARM Cortex-M3 MCUand improves all the standard Arduino functionalities and adds many new features.\r\n\r\nThe Arduino Due offers 54 digital input/output pins (of which 12 can be used as PWM outputswith selectable resolution)12 analog inputs with 12 bits of resolution4 UARTstwo DAC outputsan 84MHz crystal oscillatortwo USB connections2 TWIa power jackan ICSP headeran SPI headera JTAG headerand a reset button and erase button. The maximum voltage that the I/O pins can provide or tolerate is 3.3V. The board has two micro USB connectors--one for debugging purposes and a second one capable of acting as a USB hostallowing external USB peripherals such as mousekeyboardssmartphonesetc. to be connected to the Arduino Due.\r\n\r\nThe board contains everything needed to support the microcontroller; simply connect it to a computer with a USB cable or power it with a AC-to-DC adapter or battery to get started. The Due is compatible with all Arduino shields that work at 3.3V and are compliant with the 1.0 Arduino pinout.\r\n\r\n', 25, 'https://mikroelectron.com/ProImg/X4/9810e57e-fc7f-4cec-af47-b20c276c4b93.jpg', 25, 1, '2020-02-13 15:51:11'),
(43, 8, 'SD CARD READER MODULE', 'SD Card module can make your SD application more easier and simple.\r\nIt is easily interfaced as a peripheral to your arduino sensor shield module.\r\nThrough programmingyou can read and write to the SD card using your arduino.', 'Description:\r\n\r\nSD Card module can make your SD application more easier and simple.\r\nIt is easily interfaced as a peripheral to your arduino sensor shield module.\r\nThrough programmingyou can read and write to the SD card using your arduino.\r\nCan be used for SD Card more eaislysuch as for MP3 PlayerMCU/ARM system control.\r\nAll SD SPI pins outputMOSISCKMISO and CS.\r\nSupport 5V/3.3V input.\r\nSize:5.1cm x 3.1cm - 2.01inch x 1.22inch.', 5, 'https://mikroelectron.com/ProImg/X4/fbe95053-58f5-4a76-af00-0defdd97bd8e.jpg', 25, 1, '2020-02-17 01:31:56');
INSERT INTO `items` (`Id`, `Id_Category`, `Name`, `Brief`, `Description`, `Price`, `Image`, `Views`, `Availability`, `Date`) VALUES
(62, 8, 'test', ' test1 , test2 ,test3 ', '  test1 , test2 ,test3 ', 80, '../static/img/product_image/t_a_s_t_i_n_g.png', 26, 0, '2020-02-29 08:14:36'),
(63, 1, 'test3 ', ' test5', '  test1 ,tset2', 80, '../static/img/product_image/Build-a-Web-Scraper-With-Requests-and-Beautiful-Soup_Watermarked.37918fb3906c.jpg', 26, 0, '2020-02-29 08:17:55'),
(64, 1, 'tyttt', ' ttt', ' tttaaa', 80, '../static/img/product_image/المهندس_الصغير3.jpg', 26, 0, '2020-02-29 08:21:13');

-- --------------------------------------------------------

--
-- Table structure for table `media_courses`
--

DROP TABLE IF EXISTS `media_courses`;
CREATE TABLE IF NOT EXISTS `media_courses` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_course` int(11) NOT NULL,
  `Path` text NOT NULL,
  `Type` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `Id_course` (`Id_course`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_courses`
--

INSERT INTO `media_courses` (`Id`, `Id_course`, `Path`, `Type`) VALUES
(1, 1, 'https://www.researchgate.net/profile/Dong_Liang29/publication/258381983/figure/fig10/AS:324650941861909@1454414224690/The-wireless-PZT-sensor-network-mode-based-on-MA-for-the-joint-failure-monitoring.png', 1),
(2, 1, 'https://kbimages1-a.akamaihd.net/185b6f73-12b4-4a0b-9e94-5e6840ba4613/1200/1200/False/wireless-communication-and-sensor-network.jpg', 1),
(3, 3, 'https://www.jsumo.com/arduino-mega-advanced-kit-original-mega-1727-66-B.jpg', 1),
(4, 3, 'https://www.robotshop.com/media/catalog/product/cache/image/400x400/9df78eab33525d08d6e5fb8d27136e95/s/u/sunfounder-uno-usb-microcontroller-r3.jpg', 1),
(5, 23, '../static/img/product_image/q141s3xfs.png', 1),
(6, 23, '../static/img/product_image/MzI3ODU3Ng.jpeg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `media_products`
--

DROP TABLE IF EXISTS `media_products`;
CREATE TABLE IF NOT EXISTS `media_products` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Item` int(11) NOT NULL,
  `Type` int(1) NOT NULL DEFAULT '1',
  `Path` text NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Media_Items` (`Id_Item`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_products`
--

INSERT INTO `media_products` (`Id`, `Id_Item`, `Type`, `Path`) VALUES
(1, 1, 1, 'https://mikroelectron.com/ProImg/X4/e5520e6e-8352-4d62-9713-807ad3ad79b7.jpg'),
(6, 61, 1, '../static/img/product_image/المهندس_الصغير.jpg'),
(3, 2, 1, 'https://mikroelectron.com/ProImg/X4/6cd7428c-577e-4b90-bb2a-8b16474e95cd.jpg'),
(4, 2, 1, 'https://mikroelectron.com/ProImg/X4/cbb64216-5f3b-4fc9-b79b-8495302b23af.jpg'),
(5, 3, 1, 'https://mikroelectron.com/ProImg/X4/fd5100d0-045b-4a76-8917-f4539a467985.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Item` int(11) NOT NULL,
  `New_Price` float NOT NULL,
  `End_Date` date NOT NULL,
  `Type` int(1) NOT NULL DEFAULT '1',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Offers_Items` (`Id_Item`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`Id`, `Id_Item`, `New_Price`, `End_Date`, `Type`, `Date`) VALUES
(1, 5, 30, '2020-02-20', 1, '2020-02-08 21:54:01'),
(2, 11, 13, '2020-02-29', 1, '2020-02-08 21:54:01'),
(3, 1, 150, '2020-02-19', 2, '2020-02-12 18:55:41'),
(4, 2, 100, '2020-02-19', 2, '2020-02-12 18:55:41'),
(5, 37, 10, '2020-04-04', 1, '2020-02-22 01:09:13'),
(6, 38, 6, '2020-04-04', 1, '2020-02-22 01:09:13'),
(7, 31, 300, '2020-04-04', 1, '2020-02-22 01:11:51'),
(8, 14, 60, '2020-04-04', 1, '2020-02-22 01:11:51');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User` int(11) NOT NULL,
  `Id_Student` int(11) NOT NULL,
  `Payment` float NOT NULL,
  `Payoff` varchar(255) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Payments_User` (`Id_User`),
  KEY `FK_Payments_student` (`Id_Student`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`Id`, `Id_User`, `Id_Student`, `Payment`, `Payoff`, `Date`) VALUES
(1, 1, 2, 50, 'Ali Ahmad', '2020-04-08 21:08:41'),
(2, 2, 1, 75, 'yaser', '2020-02-08 22:08:41'),
(3, 1, 1, 500, 'zeid', '2020-02-18 03:28:46'),
(4, 1, 2, 300, 'zein', '2020-02-18 03:28:46'),
(5, 1, 1, 13, 'علي', '2020-02-24 10:31:08'),
(6, 1, 1, 50, 'احمد', '2020-02-24 11:17:17'),
(7, 1, 1, 50, 'احمد', '2020-02-24 11:17:38'),
(8, 1, 1, 25, 'احمد', '2020-02-24 11:19:45'),
(9, 1, 1, 25, 'احمد', '2020-02-24 11:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Brief` varchar(500) NOT NULL,
  `Content` text NOT NULL,
  `Media` text,
  `Type` int(1) NOT NULL DEFAULT '1',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_User_Post` (`Id_User`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`Id`, `Id_User`, `Title`, `Brief`, `Content`, `Media`, `Type`, `Date`) VALUES
(1, 1, 'Introduction to microcontrollers', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. Microcontrollers are present in devices where the user has to exert a degree of control. They are designed and implemented to execute a specific function such as displaying integers or characters on an LCD display module of a home appliance. Application of microcontrollers is myriad. In simpler terms, any gadget or equipment which has to deal with the functions such as measuring, controlling, displaying and calculating the values consist of a microcontroller chip inside it. They are present in almost all the present day home appliances, toys, traffic lights, office instruments and various day-to-day appliances.', 'https://cdn.openlabpro.com/wp-content/uploads/2017/01/MICROCONTROLLER-ARCH-1.jpg', 1, '2020-02-08 22:16:09'),
(2, 1, 'Engineer program', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', '#little_engineer\r\nWe are proud of our achievement and the uniqueness of our little Engineer program at the North Regional level\r\n#المهندس ـ #الصغير\r\nنحن فخورون بإنجازنا وتفردنا ببرنامج المهندس الصغيرعلى مستوى اقليم الشمال', 'https://scontent.famm3-2.fna.fbcdn.net/v/t1.0-9/86266325_1056002811442953_5343022909172482048_n.jpg?_nc_cat=103&_nc_eui2=AeGPI2aexh1jqPSfd_tI99r7YeOpa7y12yhmynpW6Mi4k_BOu5KUy9J0G5QRle8WkrrE_xfI_IdSI4fbtSZcQn4B20upGrfZ6ChyFUiz0IEtLQ&_nc_ohc=lMILhkr2ADQAX8-WRtM&_nc_ht=scontent.famm3-2.fna&oh=e1940901920cce14b01fe99bce73a6d2&oe=5EC30EEE', 1, '2020-02-13 16:34:29'),
(3, 1, 'Tabasheer Training Academy', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', '#IOT', 'https://scontent.famm3-1.fna.fbcdn.net/v/t1.0-9/83112302_1027178527658715_6987528889962594304_n.jpg?_nc_cat=105&_nc_eui2=AeHf-JWn6Xz3tDNKceOv9Iq2D3PyfWC-uT-z5cCvZzAs8l4ystddIHjlTQguZvJQyAiG8z2DxKK6bmgnwSTSoxNMN235XBwvdVHE2FdbureRVw&_nc_ohc=y20CN088FQMAX9-70R1&_nc_ht=scontent.famm3-1.fna&oh=a74dec9b34456f241b22ff106429a508&oe=5EC5D1B5', 2, '2020-02-13 18:42:35'),
(4, 1, 'سنحاول السيطرة على عالم المتحكمات الدقيقة \r\n\r\n', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', '\r\n\r\nالمتحكم الدقيق أو المتحكم المصغر (بالإنجليزية: Microcontroller) هو حاسوب مصغر أو ما يسمى نظام على شريحة (SOC) موجود على دارة متكاملة تحتوى على نواة معالج, ذاكرة, و ملحقات مداخل/مخارج قابلة للبرمجة. المتحكمات المصغرة تستخدم للتطبيقات المدمجة على العكس من المعالجات المصغرة المستخدمة في الحاسب الشخصي أو التطبيقات العامة الأخرى المؤلفة من عدة شرائح منفصلة. من استخداماته التحكم في عمليات صناعية أو متغير.\r\n\r\nيستخدم في العادة للقيام بمهمة محددة مثل التحكم في إشارة ضوئية وغيرها.. عكس المعالج الدقيق الذي يتميز بقدرته على القيام بمهام متعددة. هو عبارة عن حاسوب على شريحة، وحتى نكون دقيقين انه حاسوب ذو مهمة واحدة سابقة التحديد. يحتوي على وحدة معالجة مركزية,الذواكر وواجهات اتصال. تعمل المتحكمات الصغرية في الغالب وفق معمارية هارفرد Harvard Architecture فيما يلي أبرز مكونات المتحكم الصغري:', 'https://scontent.famm3-2.fna.fbcdn.net/v/t1.0-9/81399958_1020998868276681_4215274530010038272_n.jpg?_nc_cat=101&_nc_eui2=AeHBYguWtxsAsdk8l9w3_ActVERePM_ilUhu0Td97ZxwNwmdaneAUrm0Ga78Jj29PFnRkRr6MuOc4hy23qcb5cJZhbR6Y36YI0iXp0jCdTPmMg&_nc_ohc=qvOLx1qoYeoAX-zRU4A&_nc_ht=scontent.famm3-2.fna&oh=1b7a983791fc764e4d364d1622e199c3&oe=5EC52547', 1, '2020-02-13 18:44:52'),
(5, 1, 'نرحب بشريكنا الاستراتيجي الجديد', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', '\r\n#TTA\r\n#Abu_dhabi\r\n\r\n', 'https://scontent.famm3-1.fna.fbcdn.net/v/t1.0-9/80430803_1006741839702384_5102788384531677184_n.jpg?_nc_cat=104&_nc_eui2=AeHjJIkCR_uUqyaNi_X9fGku30zgrDPzpw9bIlXPkF4wVxxPlXN2NeIzqRlncz-x4C8lQqoudQPIIJ3OkLXMpE5_63Tv3NVwozwA3DxH8_cqRw&_nc_ohc=hygUCQNYoJoAX_5snFa&_nc_ht=scontent.famm3-1.fna&oh=11d5c9903ff9e349cd9551629dc6d166&oe=5EB925A8', 2, '2020-02-13 18:46:50'),
(6, 1, 'Fog computing or fog networking', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', 'Fog computing or fog networking, also known as fogging, is an architecture that uses edge devices to carry out a substantial amount of computation, storage, communication locally and routed over the internet backbone.\r\n\r\nWhy it’s very important for internet of things?', 'https://scontent.famm3-1.fna.fbcdn.net/v/t1.0-9/79430809_989439194765982_2256789702394773504_n.jpg?_nc_cat=109&_nc_eui2=AeH8suPGl92n1BlW6NuQWEkSM2Klkpm7QdULe1vvyIeGo4JJJCkD04QtDaFDPMTED0IZpejH0dx3mYm2YxlHNWmBcstwDSUb9o7Y2prG9l-E4w&_nc_ohc=u3VRUZu2I7AAX-xyt0Z&_nc_ht=scontent.famm3-1.fna&oh=3010a777cab3d8a4a05a06de01630faf&oe=5EBDF546', 1, '2020-02-13 18:49:35'),
(7, 1, 'Some our project\r\n', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', '#TTA', 'https://scontent.famm3-2.fna.fbcdn.net/v/t1.0-9/77291367_984521055257796_8846525962716708864_n.jpg?_nc_cat=106&_nc_eui2=AeEXB5EaioywzApBicnVo7OuhquklGb817WSn--Ofu7gwq45dIIM3ty9-d64MCyWZABmBLqfyV1bcnLSmSr0gSk4cjn7RbXNDasHfGDwKSbfTw&_nc_ohc=iXaRmZ1EB1cAX_PGizo&_nc_ht=scontent.famm3-2.fna&oh=616662b56c946f3d21e9f152f5fa143b&oe=5EFEF0A3', 1, '2020-02-13 19:47:45'),
(8, 1, 'Some our project\r\n', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', '#TTA', 'https://scontent.famm3-1.fna.fbcdn.net/v/t1.0-9/78406278_984521065257795_8861335761572593664_n.jpg?_nc_cat=109&_nc_eui2=AeFM6yIRvW6IHOQZV8hm8Lhvt6iBclSYzOpVulacB8BQ0IvbFMpmQSu5NJIJ7o93_ol9VG_dNz4NqIzK93mbDlKXLSjxVLCjvJKrvZVm9xGURQ&_nc_ohc=h7qQ7dx-aGUAX9cDVmb&_nc_ht=scontent.famm3-1.fna&oh=97a12e643c7cca833c612813dde3c7ce&oe=5ECC8769', 1, '2020-02-13 19:47:45'),
(9, 1, 'Some our project\r\n', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', '#TTA\r\n', 'https://scontent.famm3-2.fna.fbcdn.net/v/t1.0-9/78364452_984521105257791_7754648965726863360_n.jpg?_nc_cat=102&_nc_eui2=AeEhGVat81ewxoYtykFY-SSuzdmofX68FJ5B3Hk_6lSA55N57cvgCK6Bd9bXdY5altvpXCJnrHYMTMdS107M6XX6VnjzK8ua-j8mdSFs5LelPA&_nc_ohc=9rccGvoaFG4AX8bqmy2&_nc_ht=scontent.famm3-2.fna&oh=a7ddce30275c660a1014250db383626e&oe=5ECB72CC', 1, '2020-02-13 19:48:40'),
(10, 1, 'Some our project\r\n', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', '#TTA\r\n', 'https://scontent.famm3-2.fna.fbcdn.net/v/t1.0-9/78912577_984521165257785_4625340118893330432_n.jpg?_nc_cat=101&_nc_eui2=AeFSK5rfAqscGHsVEvZBXLfEMHr0RBNNb77hWhwgoAOcqOWn5pWGS7Wy0osj2OyQFYmx6fRmRTTZH2xa5pNCUzbnh-SNLXdPnBb-oYA7WXBENA&_nc_ohc=NCak9K0YN1AAX-3TBs_&_nc_ht=scontent.famm3-2.fna&oh=bcb552b3fb1ee098b7b30dd8b1faf47a&oe=5EFEEDBA', 1, '2020-02-13 19:48:40'),
(11, 1, 'Some our project\r\n', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', '#TTA', 'https://scontent.famm3-2.fna.fbcdn.net/v/t1.0-9/78281959_984521298591105_7884621737030057984_n.jpg?_nc_cat=100&_nc_eui2=AeF6WCtAswEtpczEB3xNPDDqIhYr8x6Vv2_EvktTlfdJiJ7MlVkh9i2p52u7gJjUDY93zhTfntPJeBlKPsA2Qio5uAnSRdwvO5pS6O7F75D9AQ&_nc_ohc=7riWczJpzdAAX_q7jlw&_nc_ht=scontent.famm3-2.fna&oh=8712f05ecf0c55214654f3161c4b0a26&oe=5F025900', 1, '2020-02-13 19:49:48'),
(12, 1, 'Some our project\r\n', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. ', '#TTA', 'https://scontent.famm3-2.fna.fbcdn.net/v/t1.0-9/78116668_984521471924421_7290497618189221888_n.jpg?_nc_cat=101&_nc_eui2=AeEkWJkncFgSnBQj35ZFCzffwDPpA30FETf_CXFEkKDq3Ab2Ax89_ThhVrmknp7ugOasu27nHcJmgnDZJW3MkOyu9Q3AEz8KRSNCLoDbaCJiYQ&_nc_ohc=EGRoFcMwpCoAX9lWHB_&_nc_ht=scontent.famm3-2.fna&oh=16fcc7077e0450881f88c200126be96c&oe=5EC9795A', 1, '2020-02-13 19:49:48'),
(13, 1, 'Web Scraping', 'Web Scraping', 'Web Scraping', '../static/img/post_image/Build-a-Web-Scraper-With-Requests-and-Beautiful-Soup_Watermarked.37918fb3906c.jpg', 2, '2020-02-24 07:55:22'),
(14, 1, 'BCI', 'BCI', 'BCI', '../static/img/defult_image/Teachable-courses.png', 2, '2020-02-24 08:02:37'),
(15, 1, 'BCI2', 'BCI2', 'BCI2', '../static/img/post_image/t_a_s_t_i_n_g.png', 2, '2020-02-24 08:04:48'),
(16, 1, 'BCI3', 'BCI3', 'BCI3', '../static/img/post_image/IronMan2_Mark4_Gauntlets_4.jpg', 2, '2020-02-24 08:18:04'),
(17, 1, 'Web Scraping2', 'Web Scraping2', 'Web Scraping2', '../static/img/post_image/83079780_268049220848946_5471014944637976576_n.jpg', 2, '2020-02-27 03:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

DROP TABLE IF EXISTS `specialization`;
CREATE TABLE IF NOT EXISTS `specialization` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `specialization`
--

INSERT INTO `specialization` (`Id`, `Name`) VALUES
(1, 'communication Engineering'),
(2, 'Computer Engineering'),
(3, 'computer science'),
(4, 'Software engineering'),
(5, 'الحسكة');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Gender` int(1) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Birthday` date NOT NULL,
  `Id_Address` int(11) NOT NULL,
  `Id_University` int(3) NOT NULL,
  `Id_Specialization` int(3) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UNIQUE_Phone` (`Phone`),
  UNIQUE KEY `UNIQUE_Email` (`Email`),
  KEY `FK_Address` (`Id_Address`),
  KEY `FK_University` (`Id_University`),
  KEY `FK_specialization` (`Id_Specialization`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Id`, `FirstName`, `LastName`, `Gender`, `Phone`, `Email`, `Birthday`, `Id_Address`, `Id_University`, `Id_Specialization`, `Date`) VALUES
(1, 'zeid', 'zein alabdeen', 1, '0791749367', 'zeid.zen@gmail.com', '1996-01-10', 3, 5, 3, '2020-02-08 22:01:18'),
(2, 'Osama', 'yousef', 1, '0790083761', 'fotboy1788@hotmail.com', '1993-04-04', 2, 5, 4, '2020-02-08 22:01:18'),
(5, 'Haitham', 'Husam', 1, '0789605872', 'hhh1998@hotmail.com', '1996-01-10', 3, 5, 3, '2020-02-10 01:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `stu_class`
--

DROP TABLE IF EXISTS `stu_class`;
CREATE TABLE IF NOT EXISTS `stu_class` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Student` int(11) NOT NULL,
  `Id_Class` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UN_STD_CLS` (`Id_Student`,`Id_Class`),
  KEY `FK_stu_class_class` (`Id_Class`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stu_class`
--

INSERT INTO `stu_class` (`Id`, `Id_Student`, `Id_Class`, `Date`) VALUES
(1, 1, 1, '2020-02-08 22:01:51'),
(2, 2, 1, '2020-02-08 22:01:51'),
(3, 1, 2, '2020-02-08 22:02:04'),
(4, 2, 2, '2020-02-08 22:02:04'),
(7, 1, 4, '2020-02-18 13:08:49'),
(9, 7, 5, '2020-02-24 04:02:15');

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
CREATE TABLE IF NOT EXISTS `university` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`Id`, `Name`) VALUES
(1, 'Yarmouk University'),
(2, 'Al-Balqa University'),
(3, 'University of Jordan'),
(4, 'University of technology'),
(5, 'zarqa technology'),
(6, 'الحسكة');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `LastName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Password` text CHARACTER SET utf8 NOT NULL,
  `Gender` int(1) NOT NULL,
  `Id_Address` int(11) NOT NULL,
  `Image` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `Birthday` date NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UNIQUE_Phone` (`Phone`),
  UNIQUE KEY `UNIQUE_Email` (`Email`),
  KEY `FK_User_Address` (`Id_Address`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `FirstName`, `LastName`, `Email`, `Phone`, `Password`, `Gender`, `Id_Address`, `Image`, `Birthday`, `Date`) VALUES
(1, 'zeid', 'zein alabdeen', 'zeid.zen@gmail.com', '0791749367', '6c15e561c79f69541cb12eda5717bcb17475492945ae87b26bede25a0d4c7964188cb02ab0291b7364e15215c2a027abb19c5a75fe45589cb337dbdcab67b77182824662e26be2e3fd365ff52ef6c189536250eff82b4a90bbf1c03c07012bfd', 1, 3, '../static/img/user_image/82246523_2459293421054355_1831006581907521536_o.jpg', '1996-01-10', '2020-02-08 22:07:24'),
(2, 'osama', 'yousef', 'fotboy1788@hotmail.com', '0790083761', '123456789', 1, 2, NULL, '1993-04-04', '2020-02-08 22:07:24'),
(3, 'zeid', 'zein alabdeen', 'zeid.zen23@gmail.com', '0798524657', '6c15e561c79f69541cb12eda5717bcb17475492945ae87b26bede25a0d4c7964188cb02ab0291b7364e15215c2a027abb19c5a75fe45589cb337dbdcab67b77182824662e26be2e3fd365ff52ef6c189536250eff82b4a90bbf1c03c07012bfd', 1, 1, '86278699_844682099326554_5104062684148531200_n.jpg', '2020-02-18', '2020-02-16 01:13:21'),
(4, 'Ma\'en', ' W. Dhuhirat', 'M.dherat@hotmail.com', '0790000000', 'df33cdde240592817b8472089593bbce13addf5d43b564d6161271ee642aec1e06f23205275e2d61a9921110f1e5f67fe419bef10a5a40d08465e7954d51eeb307824b2be2397c531d6eaec1c96302c4d254675fff05c12fbd9031ba7962f495', 1, 1, NULL, '2020-02-10', '2020-02-27 06:06:01');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
