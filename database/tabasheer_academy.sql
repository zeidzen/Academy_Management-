-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 09, 2020 at 07:37 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`Id`, `Name`, `Type`) VALUES
(1, 'Sensors & Modules', 1),
(2, 'Wireless Modules', 1),
(3, 'Biomedical Sensors', 1),
(4, 'Micro-Controllers', 1),
(5, 'CNC & 3D Printer Parts', 1),
(6, 'Course', 2);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`Id`, `Name`) VALUES
(1, 'Amman'),
(2, 'zarqa'),
(3, 'Irbid'),
(4, 'mafraq');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`Id`, `Id_course`, `Name`, `Start_Date`, `End_Date`, `Lecturer`, `capacity`, `Date`) VALUES
(1, 1, 'A1', '2020-02-08', '2020-04-04', 'Osama Yousef', 8, '2020-02-08 21:53:08'),
(2, 2, 'A2', '2020-02-08', '2020-02-29', 'zeid zein alabdeen', 8, '2020-02-08 21:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_category` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text,
  `Image` text,
  `Price` float NOT NULL,
  `Number_of_hours` int(4) NOT NULL,
  `Views` int(11) NOT NULL DEFAULT '25',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_courses_category` (`Id_category`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Id`, `Id_category`, `Name`, `Description`, `Image`, `Price`, `Number_of_hours`, `Views`, `Date`) VALUES
(1, 6, 'Wireless Communication & Sensors Network ', 'Pic Microcontroller.\r\nWireless solutions and their applications.\r\nGSM (Global System for Mobile Communications.\r\nPrograming GSM using AT Command.\r\nSending and Receiving (SMS) via Microcontroller and Laptop.\r\nMake a call via Microcontroller and laptop.\r\nSMS Control applications.\r\nBluetooth interfacing with Microcontroller.\r\nControl your home devices using your smart phone.\r\nBuild your Smart Home system using (Zigbee, Bluetooth, GSM).\r\nWireless Sensor Network: technology, protocols, and applications.\r\nZigBee communication system.\r\nSend and Receive data via ZigBee communication.\r\nInterfacing between PC and Microcontroller via ZigBee with point-to-point tropology.\r\nMicrocontroller point-to-point network via ZigBee.\r\nPoint-to-Multipoint network.\r\nGSM based home security system to get intrusion alerts like door, windows open alerts onto your cell phone.\r\nReal-time Bluetooth communication system for control of a mobile Robot.\r\nAntitheft System using motion Sensor and Zigbee.\r\nMulti-sensor (Smoke, Fire, Temperature, Motion, LDR,) Based Smart Home – Zigbee.\r\nAn On-line Monitoring System of Temperature and Motion sensors on GSM, SMS, Zigbee and Bluetooth. \r\nRemote-controlled Smart Home with Zigbee Sensor Network.\r\nZigbee for Building Control Wireless Sensor Networks.\r\nZigbee based Wireless Sensor Networks and Its Applications in Industry.\r\nZigbee based Gas Leak Detection and Data Monitoring System\r\nGPS and Tracking System.\r\nWi-Fi communication system for control of home appliances using android', 'http://mikroelectron.com/UploadedFile/wireless-communication.jpg', 200, 40, 25, '2020-02-08 21:37:54'),
(2, 6, 'Advanced Arduino Course', ' التعرف على الاردوينو وأنواعها وقدراتها الصناعية\r\n التعرف على لغات برمجة الاردوينو \r\n التعامل مع المداخل والمخارج الرقمية والتماثلية\r\n التعامل مع جمل التحكم كاملة \r\n كيفية قراءة المجسات المختلفة والتعامل معها من خلال الاردوينو\r\n عمل دوائر تحكم بناءعلى قراءة درجات الحرارة وشدة الاضاءة والفولتية وغيرها \r\n بناء ساعة قياس للفولتية والمقاومة وعرض القراءة على LCD\r\n استخدام انظمة السيريال USART & SPI\r\n ربط اكثر من اردوينو معا وعمل شبكة اتصال \r\nربط الاردوينو بالكمبيوتر و بناء نظام تحكم ومراقبة من خلاله\r\nربط الاردوينو مع SD-card وطرق تخزين البيانات عليها \r\nربط الاردوينو مع اكسل شيت لتسجيل وتخزين قراءات مجسات مختلفة\r\nكيف التعامل مع EEPROM وتخزين البيانات\r\n بناء نظام حماية عن طريق key-pad و LCD\r\nبناء دوئر للتحكم باجهزة 220 V عن طريق الاردوينو\r\n بناء عدادات تصاعدية وتنازلية باستخدام الاردوينو و7-Segments\r\n التعرف على نظام الــ Interrupt وتطبيقاته الاحترافية والعملية\r\n التحكم بسرعة الــ DC Motor من خلال PWM\r\n استخدام Servo motor والتحكم بالاتجاهات\r\n كيفية استخدام الاردوينو في التطبيقات الصناعية\r\n بناء مشاريع تحكم بالاعتماد على قراءات مجسات مختلفة\r\nمدة الدورة : 30 ساعة عملية', 'http://mikroelectron.com/UploadedFile/12715434_822252037896889_325499139670144592_n.jpg', 150, 30, 28, '2020-02-08 21:37:54'),
(3, 6, 'Little Engineer', 'المحاور العلمية التي يستند اليها البرنامج :\r\n\r\nيتعرف الطالب على القطع الالكترونية و استخداماتها.\r\nيتعلم الطالب أساسيات الدارات الكهربائية و الالكترونية.\r\nيطبق الطالب ما تعلمه في تصميم أنظمة الكترونية و بنائها.\r\nيتعلم الطالب فحص الدارات الالكترونية بأجهزة القياس.\r\nيتعلم الطالب حل المشكلات التقنية التي تواجهه في التطبيق العملي للالكترونيات.\r\nينتهي البرنامج بمشروع تخرج عملي لكل طالب على أحد الأنظمة الالكترونية.\r\n\r\n\r\nبرنامج هندسي متكامل :\r\n\r\nيعزز استراتيجية التفكير الهندسي و حل المشكلات.\r\nجميع محاور الدورة ضمن تطبيقات عملية و اشراف كادر مهندسين محترفين.\r\nعمل مشروع الكتروني متكامل لكل طالب يتضمن أحد الأنظمة الاكترونية العملية', 'http://mikroelectron.com/UploadedFile/12741868_822252067896886_2093391076941503606_n.jpg', 100, 40, 25, '2020-02-08 21:40:08'),
(4, 6, 'Raspberry Pi course', 'Introduction to Raspberry\r\nInstallation, configuration, accessories and other aspects (3 hours)\r\nIntroduction to Python\r\nIntroduction to programming in Python on the Raspberry Pi (3 hours)\r\nA complete example in Python\r\nRaspberry Pi GPIO module for external connections \r\nHardware basics and using the GPIO (3 hours)\r\nOpencV install and compile (3 hours)\r\nOpenCV Image Processing Basics\r\nObject Detection (Build object follower robot)\r\nFace Detection using OpenCV (6 hours)\r\nHome Automation (Control and monitor sensors from web) (3 hours)\r\nHome Automation (Control and monitor sensors Using bluetooth) (3 hours)\r\nIntroduction, installation Windows 10 Iot Core\r\nIntroduction to C# \r\nIntroduction to programming in C# on the Raspberry Pi (3 hours)\r\nRecord video and capture image \r\nSmart Security System (send an email when motion detect) (3 hours) ', 'http://mikroelectron.com/UploadedFile/10437466_822254871229939_9097033907592208534_n.jpg', 300, 80, 25, '2020-02-08 21:40:08'),
(5, 6, 'Android course', 'Android Studio and build User Interface (Set up and walkthrough)\r\nFundamentals of Java Programming used to build Android apps\r\nInputs, Buttons and Reactive (Tap) Interfaces\r\nAndroid Building blocks\r\nVariables, Arrays, Loops, ArrayLists, Listview\r\nNavigate between screens\r\nPassing information between screens\r\nLearn how professional android apps developers think and work\r\nLearn how to design android apps\r\nBuild several amazing apps - Hands on\r\nPublish your apps on Google Play\r\nEarn Money from your Android apps - How to integrate ads in your apps\r\nsync to a server (send and receive data from server)\r\nsend push notification using (GCM)', 'http://mikroelectron.com/UploadedFile/12729090_822251997896893_4890317293145588367_n.jpg', 240, 40, 25, '2020-02-08 21:41:31'),
(6, 6, 'Arduino Course - دورة اردوينو', 'هل واجهت مشكلة في استخدام الاردوينو !!!\r\nهل تريد تطوير مهاراتك في استخدام الاردوينو !!!\r\nحاب تحترف اردوينو وتبدأ في بناء مشاريع ودوائر تحكم خاصة بك !!!\r\nشركة مايكروالكترون بتقدم لك دورة عملية خاصة بالمحترفين حيث تأهلك هذه الدورة لان تصبح محترف اردوينو من البداية حتى النهائية ...\r\n\r\nمحتوى الدورة : \r\n1. التعرف على الاردوينو وأنواعها وقدراتها الصناعية\r\n2. التعرف على لغات برمجة الاردوينو \r\n3. التعامل مع المداخل والمخارج الرقمية والتماثلية\r\n4. التعامل مع جمل التحكم كاملة \r\n5. كيفية قراءة المجسات المختلفة والتعامل معها من خلال الاردوينو\r\n6. عمل دوائر تحكم بناءعلى قراءة درجات الحرارة وشدة الاضاءة والفولتية وغيرها \r\n7. بناء ساعة قياس للفولتية والمقاومة وعرض القراءة على LCD\r\n8. استخدام انظمة السيريال USART & SPI\r\n9. ربط اكثر من اردوينو معا وعمل شبكة اتصال \r\n10. ربط الاردوينو بالكمبيوتر و بناء نظام تحكم ومراقبة من خلاله\r\n11. ربط الاردوينو مع SD-card وطرق تخزين البيانات عليها \r\n12. ربط الاردوينو مع اكسل شيت لتسجيل وتخزين قراءات مجسات مختلفة\r\n13. كيف التعامل مع EEPROM وتخزين البيانات\r\n14. بناء نظام حماية عن طريق key-pad و LCD\r\n15. بناء دوئر للتحكم باجهزة 220 V عن طريق الاردوينو\r\n16. بناء عدادات تصاعدية وتنازلية باستخدام الاردوينو و7-Segments\r\n17. التعرف على نظام الــ Interrupt وتطبيقاته الاحترافية والعملية\r\n18. التحكم بسرعة الــ DC Motor من خلال PWM\r\n19. استخدام Servo motor والتحكم بالاتجاهات\r\n20. كيفية استخدام الاردوينو في التطبيقات الصناعية\r\n21 بناء مشاريع تحكم بالاعتماد على قراءات مجسات مختلفة', 'http://mikroelectron.com/UploadedFile/66518799_2122211281234285_5172539684210868224_n.png', 40, 25, 25, '2020-02-08 21:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Category` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text,
  `Price` float NOT NULL,
  `Image` text,
  `Views` int(11) NOT NULL DEFAULT '25',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Items_category` (`Id_Category`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Id`, `Id_Category`, `Name`, `Description`, `Price`, `Image`, `Views`, `Date`) VALUES
(1, 1, 'Alcohol Gas Sensor MQ-3', 'This alcohol sensor is suitable for detecting alcohol concentration on your breathjust like your common breathalyzer. It has a high sensitivity and fast response time. Sensor provides an analog resistive output based on alcohol concentration. The drive circuit is very simpleall it needs is one resistor. A simple interface could be a 0-3.3V ADC.\r\nPlease review the datasheet for conversions to ppm then Wikipedia.org for BAC.', 5, 'https://mikroelectron.com/ProImg/X4/30f2633c-b0d2-4373-aa56-07fdd67b021e.jpg', 25, '2020-02-08 20:45:12'),
(2, 1, 'CARBON MONOXIDE SENSOR - MQ-7\r\n', 'This is a simple-to-use Carbon Monoxide (CO) sensorsuitable for sensing CO concentrations in the air. The MQ-7 can detect CO-gas concentrations anywhere from 20 to 2000ppm.\r\n\r\nThis sensor has a high sensitivity and fast response time. The sensor\\\'s output is an analog resistance. The drive circuit is very simple; all you need to do is power the heater coil with 5Vadd a load resistanceand connect the output to an ADC.\r\n\r\nThis sensor comes in a package similar to our MQ-3 alcohol sensorand can be used with the breakout board below\r\n\r\nHere at Mikroelectron.comWe give high sensitivity and fast responsive carbon monoxide sensor mq-7Buy @JD5.00 online.carbon monoxide sensor - mq-7', 5, 'https://mikroelectron.com/ProImg/X4/79600046-d417-4e1c-b28d-83a92915228a.png', 25, '2020-02-08 20:45:12'),
(3, 1, 'LPG GAS SENSOR - MQ-6', 'This is a simple-to-use liquefied petroleum gas (LPG) sensorsuitable for sensing  LPG (composed of mostly propane and butane) concentrations in the air. The MQ-6 can detect gas concentrations anywhere from 200 to 10000ppm.\r\n\r\nThis sensor has a high sensitivity and fast response time. The sensor\'s output is an analog resistance. The drive circuit is very simple; all you need to do is power the heater coil with 5Vadd a load resistanceand connect the output to an ADC.\r\n\r\nThis sensor comes in a package similar to our MQ-3 alcohol sensorand can be used with the breakout board below.', 5, 'https://mikroelectron.com/ProImg/X4/9473d8c9-f690-4549-89f4-703e01225aaf.jpg', 25, '2020-02-08 20:48:08'),
(4, 1, 'METHANE CNG GAS SENSOR - MQ-4', 'This is a simple-to-use compressed natural gas (CNG) sensorsuitable for sensing  natural gas (composed of mostly Methane [CH4]) concentrations in the air. The MQ-4 can detect natural gas concentrations anywhere from 200 to 10000ppm.\r\n\r\nThis sensor has a high sensitivity and fast response time. The sensor\\\'s output is an analog resistance. The drive circuit is very simple; all you need to do is power the heater coil with 5Vadd a load resistanceand connect the output to an ADC.\r\n\r\nThis sensor comes in a package similar to our MQ-3 alcohol sensorand can be used with the breakout board below.\r\n\r\nMikroelectron.com offer a wide range of high sensitivity and fast responsive methane cng gas sensor-mq-4 online @ JD7.00 with free shipping.methane cng gas sensor - mq-4', 3, 'https://mikroelectron.com/ProImg/X4/3f793071-adb8-441b-8f18-a6248fef8c5e.jpg', 25, '2020-02-08 20:48:08'),
(5, 2, 'XBEE PRO 60MW WIRE ANTENNA - SERIES 1', 'This is the very popular 2.4GHz XBee XBP24-AWI-001 module from Digi. The Pro series have the same pinout and command set of the basic series with an increase output power of 60mW! These modules take the 802.15.4 stack (the basis for Zigbee) and wrap it into a simple to use serial command set. These modules allow a very reliable and simple communication between microcontrollerscomputerssystemsreally anything with a serial port! Point to point and multi-point networks are supported.\r\n\r\nNot sure which XBee module or accessory is right for you? Check out our XBee Buying Guide!', 40, 'https://mikroelectron.com/ProImg/X4/0213c474-305c-4a4a-8e11-c52eec8f5079.jpg', 25, '2020-02-08 20:56:55'),
(6, 2, 'XBEE BREAKOUT ADAPTER', '', 2, 'https://mikroelectron.com/ProImg/X4/5d6bdfce-f486-4747-9941-4c4c76b89f0d.jpg', 25, '2020-02-08 20:56:55'),
(7, 2, 'HC-06 WIRELESS BLUETOOTH MODULE TTL\r\n', 'Bluetooth (Bluetooth) technologyis a short-range radio technologythe use of \"Bluetooth\" technology that can effectively\r\nSimplify PDAsnotebook computers and mobile phone handsets and other mobile communication terminal communication between devicesbut also to work\r\nThese simplify the device and the Internet (Internet) communication between the communication devices so that these modern and the Internet\r\nData transfer between more quickly and efficientlyto widen the road for wireless communications.\r\nBecause it is the first to deal with the Bluetooth modulefirst come today or small test chopperso Arduino successfully communicate with pc\r\nBar. Let\'s wiringconnect a Bluetooth board +5 V VCCGND connection board Bluetooth-GNDTX motherboard Bluetooth connection\r\nRXRX Connectivity Bluetooth TX. When the Bluetooth module is successfully connected with the PC powerthe Bluetooth module power indicator will flash\r\nShuothe connection indicator will light green.\r\n \r\nHere\'s a look at the programand I let my Arduino receives input \"r\" after the interface is pin13 LED flashes\r\nLookthen output (keyes) words.', 7.5, 'https://mikroelectron.com/ProImg/X4/7b8edeb4-4c32-4a5a-80f4-7dd09bd1fe92.jpg', 25, '2020-02-08 21:04:33'),
(8, 2, 'RF WIRELESS TX & RX MODULE 433MHZ', 'RF modules are widely used for wireless data transfers and remote control applications. These days, cost of RF modules are very low and are compact in size. Most of these RF modules are operating around 433MHz. Amplitude Shift Keying (ASK) or Frequency Shift Keying (FSK) are mainly used for wireless data transfers.', 2, 'https://mikroelectron.com/ProImg/X4/0ce0ac02-a662-46f6-9f09-45f1488d3442.JPG', 25, '2020-02-08 21:04:33'),
(9, 2, 'HT12E + HT12D REMOTE CONTROL RF433 IC\r\n', 'The HT12E encoders are a series of CMOS LSIs for remote control system applications. They are capable of encoding information which consists of N address bits and 12 N data bits. Each address/ data input can be set to one of the two logic states. The programmed addresses/data are transmitted together with the header bits via an RF or an infrared transmission medium upon receipt of a trigger signal. The capability to select a TE trigger on the HT12E or a DATA trigger on the HT12A further enhances the application flexibility of the 212 series of encoders. The HT12A additionally provides a 38kHz carrier for infrared systems.', 5, 'https://mikroelectron.com/ProImg/X4/a68313d4-007c-4774-87f2-96b713ef7ba6.JPG', 25, '2020-02-08 21:05:58'),
(10, 2, 'RFID CARD READER/WRITER 13.56MHZ', 'MF RC522 is applied to the highly integrated read and write 13.56MHz contactless communication card chipNXP launched by the company for the \"table\" application of a low-voltagelow-costsmall size of the non-contact card chip to read and writesmart meters and portable handheld devices developed better choice. The MF RC522 use of advanced modulation and demodulation concept completely integrated in all types of 13.56MHz passive contactless communication methods and protocols. 14443A compatible transponder signals. The digital part of to handle the ISO14443A frames and error detection. In additionsupport rapid CRYPTO1 encryption algorithmterminology validation MIFARE products. MFRC522 support MIFARE series of high-speed non-contact communicationtwo-way data transmission rate up to 424kbit/s. As new members of the 13.56MHz reader card series of highly integrated chip familyMF RC522 MF RC500 MF RC530 There are a lot of similaritiesbut also have many of the characteristics and differences. Communication between it and the host SPI mode helps to reduce the connection narrow PCB board volumereduce costs.', 9, NULL, 25, '2020-02-08 21:05:58'),
(11, 3, 'FINGER HEART RATE SENSOR', 'The Easy Pulse sensor is based on the principle of photoplethysmography (PPG) which is a non-invasive method of measuring the variation in blood volume in tissues using a light source and a detector. Since the change in blood volume is synchronous to the heart beatthis technique can be used to calculate the heart rate. Transmittance and reflectance are two basic types of photoplethysmography. For the transmittance PPGa light source is emitted in to the tissue and a light detector is placed in the opposite side of the tissue to measure the resultant light. Because of the limited penetration depth of the light through organ tissuethe transmittance PPG is applicable to a restricted body partsuch as the finger or the ear lobe. Howeverin the reflectance PPGthe light source and the light detector are both placed on the same side of a body part. The light is emitted into the tissue and the reflected light is measured by the detector. As the light doesn’t have to penetrate the bodythe reflectance PPG can be applied to any parts of human body. In either casethe detected light reflected from or transmitted through the body part will fluctuate according to the pulsatile blood flow caused by the beating of the heart.', 15, 'https://mikroelectron.com/ProImg/X4/6b41de89-332b-4e20-9a67-6911768d0f58.jpg', 25, '2020-02-08 21:07:42'),
(12, 3, 'EAR PULSE SENSOR HRM-2511', 'ear lobe pulse sensor\r\n\r\nheart rate monitor sensor can be connected to sports equipment and pc to measure\r\n\r\nHRM-2511', 30, 'https://mikroelectron.com/ProImg/X4/52d5332d-a6e0-4223-8364-14a1ec6d9a64.jpg', 25, '2020-02-08 21:07:42'),
(13, 3, 'HEART RATE PULSE SENSOR (COPY)', 'Heart rate data can be really useful whether you\'re designing an exercise routinestudying your activity or anxiety levels or just want your shirt to blink with your heart beat. The problem is that heart rate can be difficult to measure. Luckilythe Pulse Sensor Amped can solve that problem!\r\n\r\nThe Pulse Sensor Amped is a plug-and-play heart-rate sensor for Arduino. It can be used by studentsartistsathletesmakersand game & mobile developers who want to easily incorporate live heart-rate data into their projects.It essentially combines a simple optical heart rate sensor with amplification and noise cancellation circuitry making it fast and easy to get reliable pulse readings. Alsoit sips power with just 4mA current draw at 5V so it\'s great for mobile applications.\r\n\r\nSimply clip the Pulse Sensor to your earlobe or finger tip and plug it into your 3 or 5 Volt Arduino and you\'re ready to read heart rate! The 24\" cable on the Pulse Sensor is terminated with standard male headers so there\'s no soldering required. Of course Arduino example code is available as well as a Processing sketch for visualizing heart rate data.', 10, 'https://mikroelectron.com/ProImg/X4/ed7c710d-f17c-437d-aa26-1e184deabdea.jpg', 25, '2020-02-08 21:09:02'),
(14, 3, 'HEART RATE PACK WITH POLAR WIRELESS', 'Read wireless heart-rate data into your electronics projects in under 10 minutes with this educational experimentation kit for Polar wireless heart rate bands. This pack is designed for studentshobbyistsengineers and artists who want to add biometric interactivity to electronics. This is the easiest way possible to do it! No gelno probesno calibration and no clips. Simply strap the band on and detect heartbeats from 4 feet away. \r\n\r\nThe Polar T34 Non-Coded Heart Rate Transmitter monitors and then wirelessly transmits your heart rate data from the chest strap to a Polar WearLink+ compatible receiver.  This allows the wearer to monitor their heart rate. This transmitter can also be paired with your local gym\'s exercise equipment if it is Polar WearLink compatible. ', 70, 'https://mikroelectron.com/ProImg/X4/1ba22443-2658-4410-b853-1ac3718ed5c7.jpg', 25, '2020-02-08 21:09:02'),
(15, 3, 'MUSCLE SENSOR KIT (EMG)', 'Advancer Technologies EMG Muscle Sensor V3.0 With Cable And Electrodes\r\n\r\n\r\nThe Advancer Technologies EMG Muscle Sensor V3.0 With Cable And Electrodes will measure the filtered and rectified electrical activity of a muscle; outputting 0-Vs Volts depending the amount of activity in the selected muscle, where Vs signifies the voltage of the power source. Power supply voltage: min. +-3.5V.\r\n\r\nThis Muscle Sensor v3 from Advancer Technologies measures, filters, rectifies, and amplifies the electrical activity of a muscle and produces an analogue output signal that can easily be read by a microcontroller, enabling novel, muscle-controlled interfaces for your projects.', 65, 'https://mikroelectron.com/ProImg/X4/646a02b0-ea23-4640-b5cd-f414a9e762a0.jpg', 25, '2020-02-08 21:12:48'),
(16, 3, 'HEART RATE MONITOR - AD8232', 'The AD8232 SparkFun Single Lead Heart Rate Monitor is a cost-effective board used to measure the electrical activity of the heart. This electrical activity can be charted as an ECG or Electrocardiogram and output as an analog reading. ECGs can be extremely noisythe AD8232 Single Lead Heart Rate Monitor acts as an op amp to help obtain a clear signal from the PR and QT Intervals easily.\r\n\r\nThe AD8232 is an integrated signal conditioning block for ECG and other biopotential measurement applications. It is designed to extractamplifyand filter small biopotential signals in the presence of noisy conditionssuch as those created by motion or remote electrode placement.\r\n\r\nThe AD8232 Heart Rate Monitor breaks out nine connections from the IC that you can solder pinswiresor other connectors to. SDNLO+LO-OUTPUT3.3VGND provide essential pins for operating this monitor with an Arduino or other development board. Also provided on this board are RA (Right Arm)LA (Left Arm)and RL (Right Leg) pins to attach and use your own custom sensors. Additionallythere is an LED indicator light that will pulsate to the rhythm of a heart beat. Biomedical Sensor Pads and Sensor Cable are required to use the heart monitor and can be found in the Recommended Products section below.', 20, 'https://mikroelectron.com/ProImg/X4/4537298a-1ced-4286-affc-674605d4b9d6.jpg', 25, '2020-02-08 21:12:48'),
(17, 4, 'CRYSTAL 10MHZ', 'Standard frequency crystals - use these crystals to provide a clock input to your microprocessor. Rated at 20pF capacitance and +/- 50ppm stability. Low profile HC49/US Package.', 0.75, 'https://mikroelectron.com/ProImg/X4/de882334-cbcf-4074-b874-7649ba054bb7.jpg', 25, '2020-02-08 21:14:46'),
(18, 4, 'VOLTAGE REGULATOR 7805 - 5V', ' Basic 7805 voltage regulators in the TO-220 package. A must have for basic 5V electronics.', 0.5, 'https://mikroelectron.com/ProImg/X4/a2586221-c33e-4144-8e6f-d00ea2189561.jpg', 25, '2020-02-08 21:14:46'),
(19, 4, 'KEYPAD 4X4\r\n', 'Description:\r\n\r\nContact resistance of 500 (Ω)\r\nInsulation resistance 100M (Ω)\r\nKey Operating Force 150-200N\r\nRebound time 1 (ms)\r\nLife of 100 million (times)\r\nOperating Temperature 60 (°C)\r\n1. the electronic characteristics\r\nCircuit Rating: 35V (DC)100mA1W\r\nContact resistance: 10Ω ~ 500Ω\r\n(Varies according to the lead lengths and different from those of the material used)\r\nInsulation resistance: 100MΩ 100V\r\nDielectric Strength: 250VRms (50 ~ 60Hz 1min)\r\nElectric shock jitter: <5ms\r\nLife span: tactile type: ≥ one million times\r\n2. the mechanical properties\r\nOperating pressure: Touch feeling: 170 ~ 397g (6 ~ 14oz)\r\nSwitch travel: touch-type: 0.6 ~ 1.5mm\r\n3. the environment parameters\r\nOperating temperature: -40 to +80\r\nStorage temperature: -40 to +80\r\nTemperature: from 4090% to 95%240 hours\r\nVibration: 20Gmax. (10 ~~ 200Hzthe Mil-SLD-202 M204.Condition B)\r\n', 4, 'https://mikroelectron.com/ProImg/X4/538eb83d-471c-4e52-8f37-6bc39390a76f.jpg', 25, '2020-02-08 21:15:42'),
(20, 4, 'MICROCHIP DSPIC30F3010-30I/SP\r\n', NULL, 15, 'https://mikroelectron.com/ProImg/X4/ddeeea8a-abbe-4cb1-99fd-ea248bc5a828.jpg', 25, '2020-02-08 21:15:42'),
(21, 4, 'PIC18F4520 ORIGINAL\r\n', 'This is a PIC18f4520 microcontroller with a pre-programmed ds30 serial bootloder. You can use a USB-TTLconverter or TTL-RS232 converter to program the microcontroller using the serial interface.\r\n\r\n Parameter Name	 Value\r\nProgram Memory Type	Flash\r\nProgram Memory (KB)	32 (418 Bytes used by Bootloader)\r\nCPU Speed (MIPS)	10\r\nRAM Bytes	1536\r\nData EEPROM (bytes)	256\r\nDigital Communication Peripherals	1-A/E/USART1-MSSP(SPI/I2C)\r\nCapture/Compare/PWM Peripherals	1 CCP1 ECCP\r\nTimers	1 x 8-bit3 x 16-bit\r\nADC	13 ch10-bit\r\nComparators	2\r\nTemperature Range (C)	-40 to 125\r\nOperating Voltage Range (V)	2 to 5.5\r\nPin Count	40', 7.5, 'https://mikroelectron.com/ProImg/X4/85b8ed20-afc2-44d6-9752-cf72bb06eadf.jpg', 25, '2020-02-08 21:25:44'),
(22, 4, 'ZIF SOCKET 40-PIN', 'This is a high-qualityeasy to use 40 pin ZIF socket that is 0.6\" wide with gold-plated contacts. Compatible with 0.3\" up to 0.6\" wide ICs up to 40-pins. Makes for easy connecting or programming to many DIP ICs. High conductivity terminals create solid connections. Armature makes it easy to open and close socket.', 4.5, 'https://mikroelectron.com/ProImg/X4/bc9fa861-4156-42cb-acf6-ff957abdad4d.jpg', 25, '2020-02-08 21:25:44'),
(23, 5, 'EASYDRIVER STEPPER MOTOR DRIVER', 'The EasyDriver is a simple to use stepper motor drivercompatible with anything that can output a digital 0 to 5V pulse (or 0 to 3.3V pulse if you solder SJ2 closed on the EasyDriver). EasyDriver requires a 7V to 20V supply to power the motor and can power any voltage of stepper motor. The EasyDriver has an on board voltage regulator for the digital interface that can be set to 5V or 3.3V. Connect a 4-wire stepper motor and a microcontroller and you’ve got precision motor control! EasyDriver drives bi-polar motorsand motors wired as bi-polar. I.e. 46or 8 wire stepper motors. On this version (v4.4) we fixed the silk error on the min/max adjustment.\r\n\r\nThis is the newest version of EasyDriver V4 co-designed with Brian Schmalz. It provides much more flexibility and control over your stepper motorwhen compared to older versions. The microstep select (MS1 and MS2) pins of the A3967 are broken out allowing adjustments to the microstepping resolution. The sleep and enable pins are also broken out for further control.', 7, 'https://mikroelectron.com/ProImg/X4/2668f826-42c2-4357-ba66-fb95e460766c.jpg', 25, '2020-02-08 21:28:12'),
(24, 5, '3D PRINTER PLA 3.0MM 1KG/SPOOL\r\n', '3D Printer PLA 3.0mm 1kg/spool', 40, 'https://mikroelectron.com/ProImg/X4/1cd34eb1-b673-4362-8cdd-e8d9688790e7.jpg', 25, '2020-02-08 21:28:12'),
(25, 5, 'ARDUINO CNC SHIELD V3', 'This shield (HCARDU0086) is designed to allow you to control a CNC router or milling machine from an Arduino board. It contains 4 driver sockets which allows compatible Pololu A4988 driver modules to be inserted (see HCMODU0068 on our website) providing the ability to drive 3 stepper motor axis (XY& Z) plus an optional 4th auxiliary motor. Additional connectors provide easy connection of end stop sensors and control buttons. ', 12, 'https://mikroelectron.com/ProImg/X4/261f47d7-c9b7-4ef9-b84b-c43b2a168473.jpg', 25, '2020-02-08 21:29:25'),
(26, 5, 'STEPSTICK A4988 STEPPER DRIVER', 'A4988 is a complete microstepping motor driver with built-in translator for easy operation. This product is can work in full-stephalf-step1/41/8 and 1/16 step modes. It operates bipolar stepper motors. Output drive capacity of up to 35 V and 2A. The A4988 includes a fixed off-time current regulatorin slow or mixed decay modes. The A4988 converter is the key to the easy implementation. As long as the \"step\" input gets one pulseit will drive the motor one microstep (One palse per microstep). There are no phase sequence tableshigh frequency control linesor complex interfaces to program.\r\n\r\nIn the micro-step operationthe A4988 chopping control automatically selects the current decay mode (Slow or Mixed). In mixed decay modethe device is initially set to a fixed downtime in some fast decaythen the rest of the slow decay downtime. Mixed decay current control scheme results in reduced audible motor noiseincreased step accuracyand reduced power consumption. Internal synchronous rectification control circuitry is provided to improve the pulse-width modulation (PWM) operation power consumption. Internal circuit protection includes: thermal shutdown with hysteresisundervoltage lockout (UVLO)and crossover-current protection. Special power sequencing.', 4.5, 'https://mikroelectron.com/ProImg/X4/a6b6a73b-03f6-4c11-861c-f15da282c028.jpg', 25, '2020-02-08 21:29:25'),
(27, 5, '3D PRINTER CONTROL BOARD MELZI V.2', ' Circuit Version: melzi2.0\r\nWorking voltage: 12V\r\nMain chip: ATMEL ATMEGA1284P chip\r\nCould control hotbed MK1MK2aMK2bMK3\r\nOnboard FT232RL interface switch chip\r\nUSB interface: connect with computer for data  communication and programe download\r\nIntegrated 4 A4988 stepper motor driver\r\nIntegrated G code Mini SD cardcould realize off-line  printing\r\nIntegrated 3 MOSFET driver hotendhotbed and fan\r\nDimensions:  21 x 5 cm\r\nWeight: 70g', 50, 'https://mikroelectron.com/ProImg/X4/e362da4f-29c1-499e-90e3-f0f2e7b1f956.jpg', 25, '2020-02-08 21:30:39'),
(28, 5, '3D PRINTER HEATER SINGLE HEAD 12V\r\n', 'Voltage and Power: 12V 40W\r\nSingle-head Cartridge Heater used to the heating medium which can\'t work in the connection on both endsis widely used in mould heatinghot core boxshoot core machine etc\r\nType: Cartridge Heater\r\nVoltage: 12V\r\nPower:  40W\r\nHeater Material: Stainless Steel\r\nHeater Size: Approx. 20x6mm/ 0.79x0.24\"\r\nLead Wire Length: Approx. 100cm/ 39.37\"', 3, 'https://mikroelectron.com/ProImg/X4/da70989a-63d5-4f0e-b527-52aae016780d.jpg', 25, '2020-02-08 21:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Items` int(11) NOT NULL,
  `New_Price` float NOT NULL,
  `End_Date` date NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Offers_Items` (`Id_Items`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`Id`, `Id_Items`, `New_Price`, `End_Date`, `Date`) VALUES
(1, 5, 30, '2020-02-20', '2020-02-08 21:54:01'),
(2, 11, 13, '2020-02-29', '2020-02-08 21:54:01');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`Id`, `Id_User`, `Id_Student`, `Payment`, `Payoff`, `Date`) VALUES
(1, 1, 2, 50, 'Ali Ahmad', '2020-02-08 22:08:41'),
(2, 2, 1, 75, 'yaser', '2020-02-08 22:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Content` text NOT NULL,
  `Media` text,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_User_Post` (`Id_User`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`Id`, `Id_User`, `Title`, `Content`, `Media`, `Date`) VALUES
(1, 1, 'Introduction to microcontrollers', 'In a broader sense, the components which constitute a microcontroller are the memory, peripherals and most crucially a processor. Microcontrollers are present in devices where the user has to exert a degree of control. They are designed and implemented to execute a specific function such as displaying integers or characters on an LCD display module of a home appliance. Application of microcontrollers is myriad. In simpler terms, any gadget or equipment which has to deal with the functions such as measuring, controlling, displaying and calculating the values consist of a microcontroller chip inside it. They are present in almost all the present day home appliances, toys, traffic lights, office instruments and various day-to-day appliances.', 'https://cdn.openlabpro.com/wp-content/uploads/2017/01/MICROCONTROLLER-ARCH-1.jpg', '2020-02-08 22:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

DROP TABLE IF EXISTS `specialization`;
CREATE TABLE IF NOT EXISTS `specialization` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `specialization`
--

INSERT INTO `specialization` (`Id`, `Name`) VALUES
(1, 'communication Engineering'),
(2, 'Computer Engineering'),
(3, 'computer science'),
(4, 'Software engineering');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Id`, `FirstName`, `LastName`, `Gender`, `Phone`, `Email`, `Birthday`, `Id_Address`, `Id_University`, `Id_Specialization`, `Date`) VALUES
(1, 'zeid', 'zein alabdeen', 1, '0791749367', 'zeid.zen@gmail.com', '1996-01-10', 3, 5, 3, '2020-02-08 22:01:18'),
(2, 'Osama', 'yousef', 1, '0790083761', 'fotboy1788@hotmail.com', '1993-04-04', 2, 5, 4, '2020-02-08 22:01:18'),
(3, 'ali22', 'ali22', 1, '0781472596', 'ali.ali44@gmail.com', '1996-01-10', 3, 2, 1, '2020-02-09 02:07:18');

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
  KEY `FK_stu_class_student` (`Id_Student`),
  KEY `FK_stu_class_class` (`Id_Class`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stu_class`
--

INSERT INTO `stu_class` (`Id`, `Id_Student`, `Id_Class`, `Date`) VALUES
(1, 1, 1, '2020-02-08 22:01:51'),
(2, 2, 1, '2020-02-08 22:01:51'),
(3, 1, 2, '2020-02-08 22:02:04'),
(4, 2, 2, '2020-02-08 22:02:04'),
(6, 3, 3, '2020-02-09 02:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
CREATE TABLE IF NOT EXISTS `university` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`Id`, `Name`) VALUES
(1, 'Yarmouk University'),
(2, 'Al-Balqa University'),
(3, 'University of Jordan'),
(4, 'University of technology'),
(5, 'zarqa technology');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `FirstName`, `LastName`, `Email`, `Phone`, `Password`, `Gender`, `Id_Address`, `Image`, `Birthday`, `Date`) VALUES
(1, 'zeid', 'zein alabdeen', 'zeid.zen@gmail.com', '0791749367', '123456789', 1, 3, NULL, '1996-01-10', '2020-02-08 22:07:24'),
(2, 'osama', 'yousef', 'fotboy1788@hotmail.com', '0790083761', '123456789', 1, 2, NULL, '1993-04-04', '2020-02-08 22:07:24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
