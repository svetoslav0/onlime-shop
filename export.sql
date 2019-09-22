/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for shop
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shop`;

-- Dumping structure for table shop.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.categories: ~12 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`) VALUES
	(1, 'Laptops'),
	(2, 'Personal Computers (PC)'),
	(3, 'Tablets'),
	(4, 'Smartphones'),
	(5, 'Headphones'),
	(6, 'Smart Watches'),
	(7, 'Mouses and Keyboards'),
	(8, 'Hardware'),
	(9, 'Software'),
	(10, 'Photo and Video'),
	(11, 'Backpacks'),
	(12, 'Accessories');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table shop.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_products_categories` (`category_id`),
  CONSTRAINT `FK_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.products: ~36 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `price`, `category_id`, `description`, `picture`) VALUES
	(1, 'Dell E7450', 600, 1, 'Sturdy and light design; Comfortable keyboard; Loud speakers; Above-average battery life', 'product_1.jpg'),
	(2, 'Asus ROG GL-552', 700, 1, 'With an up to quad-core 6th-generation Intel® Core™ i7 processor and dedicated NVIDIA® GeForce® GTX™ graphics with Microsoft DirectX 12 support, ROG GL552 is made for gaming and primed for creativity.', 'product_2.jpg'),
	(3, 'IBM T60', 199, 1, 'There are different reasons to buy a Mercedes. Some of them are identical with arguments for a IBM/Lenovo Thinkpad. The concerned drivers and notebook users know what I mean. Tested is the IBM/Lenovo Thinkpad T60, quasi the e-class of the Lenovo product range.', 'product_3.jpg'),
	(4, 'Lenovo IdeaCentre 510s', 374.99, 2, 'Before buying a PC for your home, ask yourself: Is it easy to use for both the young and old alike? Has it the power, memory, and storage capacity to meet all your family\'s computing needs? Does it have a really low starting price? Then, take a look at the ideal family desktop—the IdeaCentre 510S.', 'product_4.jpg'),
	(5, 'HP 290 G2 MT', 349.9, 2, 'Ready for work -The HP 290 MT provides a powerful PC with the features you rely onto accomplish your everyday tasks.Progressive style - The scalable and functional design of the HP 290 MT makes it easy to set up and use.Help keep data safe - Help protect your investment and your data with firmware or discrete TPM and a security lock slot', 'product_5.jpg'),
	(6, 'Lenovo V530s SFF', 389.5, 2, 'The Lenovo V530s small form factor (SFF) desktop provides incredible value for your business. Featuring powerful processing, high-speed memory, and super-fast storage technology, you can say goodbye to frustrating delays when open opening or loading files.', 'product_6.jpg'),
	(7, 'Apple iPad 6, 9.7", 32GB', 349, 3, 'The 2018 entry-level iPad supports the Apple Pencil for art work and annotation, and adds a faster A10 processor. iOS continues to offer the best overall selection of free and paid apps on affordable tablets.  Lacks the bigger, better screen, quad speakers and Smart Connector found on pricier iPad Pros. The Pencil, case and keyboard add-ons will bring the price up to laptop level.', 'product_7.jpg'),
	(8, 'Archos Core 70, Quad Core 1.3 GHz', 134.99, 3, 'With its quad-core processor deployed to optimize processing and functionality, the ARCHOS Core 70 3G will allow you to navigate, play and run multiple applications smoothly. With the ARCHOS Core 70 3G, connect to WiFi, 3G, Bluetooth or GPS. Opt for its 6.95-inch format, thought for absolute comfort and optimum grip, the most suitable size for long-term use. Fully take ownership of your tablet with the android 7.0 Nougat! Easy and intuitive, this Android tablet will allow you to simplify and optimize your daily use with options such as the ability to open two applications side-by-side. Also enjoy full access to the Google Play store.', 'product_8.png'),
	(9, 'Samsung Galaxy Tab A (2019), Quad Core', 159.49, 3, 'Samsung Galaxy Tab A tablet was launched in June 2015. The tablet comes with a 8.00-inch display with a resolution of 1024x768 pixels.', 'product_9.jpg'),
	(10, 'Huawei P20', 374.99, 4, 'Huawei P20 and Huawei P20 Pro are Android smartphones manufactured by Huawei. Unveiled 27 March 2018, they succeed the Huawei P10 in the company\'s P series line. The P20 line is distinguished primarily by its cameras, which Huawei promoted as featuring artificial intelligence technology to perform automated enhancements to images, and the P20 Pro featuring both a wide-angle 40-megapixel camera, and an 8-megapixel camera with optical zoom.', 'product_10.jpg'),
	(11, 'Xiaomi Redmi Note 7', 199.9, 4, 'Redmi Note 7 refer to a series of smartphones released by Redmi, a sub-brand of Xiaomi. Most variants of the phone feature a 48MP camera sensor. The Redmi Note 7 variant comes with a Qualcomm Snapdragon 660 CPU while the Redmi Note 7 Pro contains an upgraded Qualcomm Snapdragon 675 processor', 'product_11.jpg'),
	(12, 'Samsung Galaxy A10', 150, 4, '60 FPS gaming at an affordable price. Unsurprisingly, Samsung has made some compromises for the cheapest model in its Galaxy A series. However, the Galaxy A10 is no slouch and performs well for a sub-US$200 smartphone. Read on to find out in what areas Samsung has done well and where the Galaxy A10 falls short of its pricier Galaxy A-series siblings.', 'product_12.jpg'),
	(13, 'JBL JR300', 24.9, 5, 'The spider red JBL JR300 are volume-limited, on-ear headphones designed to provide full-range audio reproduction at safe levels for children of all ages. Their 32mm dynamic drivers yield a 20 Hz to 20 kHz frequency response and will never exceed 85 dB SPL. The single-sided flat headphone cable is terminated with an 1/8" mini-jack for compatibility with most computers, tablets, and mobile devices.', 'product_13.jpg'),
	(14, 'Sony MDRZX330BT', 52.5, 5, 'If the MDR-ZX330BT was a little more durable and traded a few hours of battery life for a richer sound, it might\'ve been one of the best mid-range set of cans on the market.', 'product_14.jpg'),
	(15, 'Beats EP by Dr. Dre', 64.13, 5, 'Beats EP on-ear headphones deliver masterfully tuned sound the way it was meant to be heard. Powered by fine-tuned acoustics for incredible clarity, breadth, and balance, the ideal introduction to Beats for any music lover. Beats EP is tough, lightweight and comfortable. Its durable frame is reinfornced with stainless steel and adjustable vertical sliders allow for personalized comfort. Designed for everyday use.', 'product_15.jpg'),
	(16, 'Apple Watch 4', 259.99, 6, 'With a display that is now always on, Apple Watch Series 5 is there for you like never before. Faces and complications let you see the information that matters most to you without raising your wrist. Cases are available in a range of materials engineered by Apple, including 100% recycled aluminum1 and, for the first time, titanium. Match with any band you please, and create a combination that is perfectly personalized, just for you.', 'product_16.png'),
	(17, 'Smartwatch Fitbit Versa', 199, 6, 'Convincing people they need a smartwatch isn\'t easy. Apple finally found its stride by emphasizing the Apple Watch\'s health and fitness capabilities and giving buyers tons of finishes and bands to choose from. Fitbit is taking the same approach, but its first attempt, the Ionic, left a lot to be desired in the looks department.', 'product_17.jpg'),
	(18, 'Smartwatch Withings Move', 59.89, 6, 'Withings Move is an advanced activity tracker housed in a classic watch designed for simplicity: it has no screen but shows your activity directly on the dial with its third hand.', 'product_18.jpg'),
	(19, 'Logitech K400 Plus Dark', 28.5, 7, 'All-in-one: With the K400 plus wireless USB keyboard with touchpad, enjoy total control of your PC to TV entertainment without the hassle and clutter of multiple devices Plug and play: Thanks to the unifying receiver, use the qwerty wireless keyboard right from the box or personalise key and touchpad settings with Logitech options software Hassel-free: Enjoy up to 18 months of battery life depending on use Effortless: Comfortable, quiet keys and a large touchpad make navigation easy, while a 10 m (33 feet) wireless range ensures uninterrupted use 24 months manufacturer warranty: For a worry-free user experience that ensures long-lasting performance Please note that Logitech unifying receiver is located at the top of the box in a small hatch Key life: Up to 5 million keystrokes', 'product_19.jpg'),
	(20, 'Wireless Microsoft BlueTrack Desktop Comfort 5050', 54.9, 7, 'Dress up your desktop with this beautifully modern keyboard and mouse set. With a tasteful mix of glossy and textured black surfaces, this desktop set will have you appreciating its good looks every day. The ergonomist-approved curved keyboard encourages you to use a more natural posture that aligns your arms, wrists, and hands for greater comfort. With a reliable wireless connection, you can eliminate clutter and work from anywhere in the room—up to 30 feet away. ', 'product_20.jpg'),
	(21, 'Logitech MK220', 14.5, 7, 'If you have needs for computer peripherals, trust Logitech to have just the solution for you.  And trust Logitech to make that solution inexpensive.  This review features the Logitech Wireless Combo MK220 that includes a compact keyboard and a mouse, all wireless of course.  This combo is what you need if you want less wires in your setup or if you simply need an alternative to the cramped keyboard of your laptop and its less comfortable touchpad.', 'product_21.jpg'),
	(22, 'SSD Kingston A400, 480GB', 59.2, 8, 'Kingston’s A400 solid-state drive dramatically improves the responsiveness of your existing system with incredible boot, loading and transfer times compared to mechanical hard drives. Powered by a latest-gen controller for read and write speeds of up to 500MB/s and 450MB/s, this SSD is 10x faster than a traditional hard drive for higher performance, ultra-responsive multi-tasking and an overall faster system. Also more reliable and durable than a hard drive, A400 is available in multiple capacities from 120GB–960GB.', 'product_22.jpg'),
	(23, 'MSI GeForce RTX 2060 SUPER GAMING X', 449.49, 8, 'The much anticipated return of MSI’s iconic dual fan GAMING series. Combining a mix of black and gunmetal grey with a classy brushed metal backplate, this masterpiece provides you premium design with magnificent and smooth RGB light effects on the outside. The new MSI GAMING card is designed to amaze you! The 7th generation of the famous MSI TWIN FROZR Thermal Design brings the most advanced technology for ultimate cooling performance. It features the new TORX FAN 3.0 combined with groundbreaking aerodynamic feats. This means stable performance and a silent experience are guaranteed thanks to low temperatures.', 'product_23.png'),
	(24, 'Power Supply Thermaltake TR2 ', 99.99, 8, 'Incorporating various high-quality components, the new TR2 S Series – models are rated from 500W to 700W – saves energy through its high efficiency of up to 86% and accommodates any mainstream build with the most demanding requirements. An embedded intelligent cooling fan delivers excellent airflow at an exceptionally low noise level. Additionally, the Single +12V rail design enables non-stop usage with stable and reliable performance.', 'product_24.jpg'),
	(25, 'Microsoft Windows 10 Home', 26, 9, 'Find the right fit for your needs. Check out our list of product offerings to see which Windows 10 version checks all of your boxes. Windows 10 changes the game for security by protecting user identities, devices, and information with a comprehensive solution driven by intelligence that only Microsoft offers. Windows 10 comes with automatic updates enabled, which means you get all the latest features at no extra cost.', 'product_25.jpg'),
	(26, 'Norton security 3.0 Premium', 49.49, 9, 'Do your kids go online? If so, get a plan with Parental Control.\r\nDo you check email, bank or shop on your mobile phone? If so, get a Norton 360 plan that protects mobile devices.\r\nDo you plan to rent a new apartment or apply for a car loan? What if someone stole your identity, took out loans in your name, and it prevented you from qualifying for the loan you need? To help protect your credit and your identity, get a Norton 360 with LifeLock plan.', 'product_26.jpg'),
	(27, 'McAfee AntiVirus 2017.1', 14.9, 9, 'It is useful to know which version of McAfee security software for Windows, and associated products, are installed on your PC. Technical Support agents require specific version numbers to help you with troubleshooting. Essential antivirus protection for your PC so you can browse, bank, and shop safely online. Easy to use security defends against viruses, ransomware and other online threats. Avoid risky websites and prevent dangerous downloads with safe web browsing tool.', 'product_27.jpg'),
	(28, 'Nikon Coolpix B500', 299, 10, 'The COOLPIX B500 feels great in your hands, whether you\'re zooming in with its super telephoto NIKKOR glass lens or recording 1080p Full HD video using the flip-up LCD. And it takes all the work out of shooting beautiful photos and videos with its 16 megapixel low-light sensor, Lens-Shift Vibration Reduction (VR), easy menus and controls, fun creative effects and outstanding automatic operation. Plus, the whole time you\'re shooting, the COOLPIX B500 can be easily and seamlessly connected to a compatible smartphone through Bluetooth® low energy (BLE) technology for instant photo sharing and remote camera control. Simply brilliant.', 'product_28.jpg'),
	(29, 'Panasonic HC-X1000', 2499.89, 10, 'The Panasonic HC-X1000E is a semi-professional Ultra HD and 4K camcorder that is impossible to look upon it without feeling a shiver of excitement, so festooned is it with buttons, controls and features. It\'s a serious bit of kit.', 'product_29.jpg'),
	(30, 'Sony HDR-AS50', 249.99, 10, 'The Sony HDR-AS50 is an affordable action camera. It has an 11.1 megapixel back-illuminated CMOS sensor paired with a Zeiss Tessar lens, and features advanced SteadyShot image stabilisation. Adjustable and enhanced beep sounds as well as three tally lights on the top, front and back have been added to allow greater notice of camera conditions even when wearing a helmet and when mounted on handlebars or monopods. Divers and swimmers can benefit from a supplied underwater housing, which allows footage to be captured down to 60m under water. Sony’s own in-built movie creator, Highlight Movie Maker, incorporates face detection and automatically assembles a highlight package which can be viewed and shared immediately.', 'product_30.jpg'),
	(31, 'Backpack Dell Urban, 15.6"', 35.89, 11, 'Transport your laptop, tablet and files safely and securely with the Dell Urban Backpack-15. Sleek and lightweight, the backpack can fit Dell laptops with up to 15.6 inch screens. Comfortably fit your Dell tablet within the dedicated tablet compartment. Keep your files, documents and other necessities organized and secure in the large storage compartment. Constructed of durable fabric with reflective accents around the outer zipper, you can enjoy increased protection and visibility on your daily commute.', 'product_31.jpg'),
	(32, 'Backpack HP Active 15.6"', 24.99, 11, 'Gym, work, activities—when your day keeps you moving, durability becomes crucial. This backpack features a padded compartment that fits any laptop up to 15.6” diagonal and water-resistant coating to help keep your electronics safe. Comfortably stay on-the-go with breathable shoulder straps and pockets to store everything your day calls for.', 'product_32.png'),
	(33, 'Lenovo On-trend Topload by NAVA', 29, 11, 'The 15.6” On-Trend Topload by NAVA is more than just a trendy bag; it’s also a defining lifestyle statement. Designed for more than just your working life, you can hold it all inside your new bag, with two main compartments and several slots for personal stuff. It’s a practical bag that not only looks good, but has you standing out from the crowd.', 'product_33.jpg'),
	(34, 'Docking Station Lenovo ThinkPad Pro Dock 90W', 52, 12, 'Expect nothing short of an outstanding value. Completely re-designed for a new generation of ThinkPads, snap into the ThinkPad Pro Dock with an included ThinkPad AC Adapter and get connected to power, your Local Area Network/Internet and workplace accessories such as up two external displays, keyboard, mouse and printer so you can get more done faster. One of the dock’s USB ports also supports always-on mobile device charging, which means that you can charge your mobile phone or tablet, even when your notebook is away. Our unique physical alignment guarantees perfect notebook-dock alignment every time. Comes with ThinkPad AC adapter to charge your notebook.', 'product_34.jpg'),
	(35, 'USB GamePad Esperanza for PC, PS2, PS3', 31.15, 12, 'Usable vibration gamepad for consoles PS2, PS3 & PC computers. Excellent working with advanced games.', 'product_35.jpg'),
	(36, 'Trust USB-C to VGA', 28.99, 12, 'Create a VGA connection on your MacBook 2015 or other device with USB-C port and DisplayPort Alternate Mode. Works on MacBook 2015 and every other device with USB Type-C (USB-C) port and DisplayPort Alternate Mode. Compact size, easy to carry along when traveling.', 'product_36.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table shop.shopping_orders
CREATE TABLE IF NOT EXISTS `shopping_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shop.shopping_orders: ~1 rows (approximately)
/*!40000 ALTER TABLE `shopping_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_orders` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
