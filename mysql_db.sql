-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table etldemo.expenses
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `e_date` date DEFAULT NULL,
  `rate` decimal(20,6) DEFAULT NULL,
  `usd` decimal(20,6) DEFAULT NULL,
  `cad` decimal(20,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table etldemo.expenses: ~26 rows (approximately)
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` (`e_date`, `rate`, `usd`, `cad`) VALUES
	('2020-01-11', 1.305100, 25.000000, 32.627500),
	('2020-01-30', 1.321700, 7.000000, 9.251900),
	('2020-02-11', 1.329200, 25.000000, 33.230000),
	('2020-02-28', 1.342900, 7.000000, 9.400300),
	('2020-03-11', 1.374500, 25.000000, 34.362500),
	('2020-03-30', 1.415600, 7.000000, 9.909200),
	('2020-04-11', 1.398500, 25.000000, 34.962500),
	('2020-04-30', 1.391000, 4.000000, 5.564000),
	('2020-05-11', 1.401200, 20.000000, 28.024000),
	('2020-05-30', 1.378700, 4.000000, 5.514800),
	('2020-06-11', 1.355300, 20.000000, 27.106000),
	('2020-06-17', 1.355500, 3.200000, 4.337600),
	('2020-06-30', 1.362800, 4.000000, 5.451200),
	('2020-07-11', 1.359400, 24.000000, 32.625600),
	('2020-07-30', 1.343200, 4.000000, 5.372800),
	('2020-08-11', 1.329100, 24.000000, 31.898400),
	('2020-08-30', 1.309700, 4.000000, 5.238800),
	('2020-09-11', 1.318600, 24.000000, 31.646400),
	('2020-09-30', 1.333900, 4.000000, 5.335600),
	('2020-10-09', 1.313600, 0.530000, 0.696208),
	('2020-10-11', 1.313600, 32.000000, 42.035200),
	('2020-10-30', 1.331800, 4.000000, 5.327200),
	('2020-11-11', 1.301700, 32.000000, 41.654400),
	('2020-11-30', 1.296500, 4.000000, 5.186000),
	('2020-12-11', 1.276900, 32.000000, 40.860800),
	('2020-12-30', 1.276900, 4.000000, 5.107600);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
