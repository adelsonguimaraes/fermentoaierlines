-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.37-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para fermentoaierlines
CREATE DATABASE IF NOT EXISTS `fermentoaierlines` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fermentoaierlines`;

-- Copiando estrutura para tabela fermentoaierlines.destino
CREATE TABLE IF NOT EXISTS `destino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `brev` varchar(50) DEFAULT NULL,
  `datacadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fermentoaierlines.destino: ~4 rows (aproximadamente)
DELETE FROM `destino`;
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
INSERT INTO `destino` (`id`, `nome`, `brev`, `datacadastro`) VALUES
	(1, 'Manaus', 'MAO', '2019-07-25 02:07:27'),
	(2, 'Rio de Janeiro', 'RJ', '2019-07-25 02:17:02'),
	(3, 'São Paulo', 'SP', '2019-07-25 02:17:14'),
	(4, 'Recife', 'REC', '2019-07-25 02:17:27');
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;

-- Copiando estrutura para tabela fermentoaierlines.viagem
CREATE TABLE IF NOT EXISTS `viagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idorigem` int(11) DEFAULT NULL,
  `iddestino` int(11) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `valor` decimal(10,2) unsigned DEFAULT NULL,
  `data` date DEFAULT NULL,
  `datacadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  `dataedicao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__destinos` (`idorigem`),
  KEY `FK__destinos_2` (`iddestino`),
  CONSTRAINT `FK__destinos` FOREIGN KEY (`idorigem`) REFERENCES `destino` (`id`),
  CONSTRAINT `FK__destinos_2` FOREIGN KEY (`iddestino`) REFERENCES `destino` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fermentoaierlines.viagem: ~0 rows (aproximadamente)
DELETE FROM `viagem`;
/*!40000 ALTER TABLE `viagem` DISABLE KEYS */;
INSERT INTO `viagem` (`id`, `idorigem`, `iddestino`, `descricao`, `valor`, `data`, `datacadastro`, `dataedicao`) VALUES
	(1, 1, 2, 'MANAUS/ RIO DE JANEIRO', 2500.00, '2019-08-06', '2019-07-25 09:41:17', NULL),
	(2, 1, 2, 'MANAUS/ RIO DE JANEIRO', 3400.00, '2019-08-15', '2019-07-25 10:31:35', NULL),
	(3, 1, 2, 'MANAUS/ RIO DE JANEIRO', 1400.00, '2019-08-20', '2019-07-25 10:31:35', NULL),
	(4, 1, 2, 'MANAUS/ RIO DE JANEIRO', 800.00, '2019-08-27', '2019-07-25 10:31:35', NULL),
	(5, 2, 1, 'RIO DE JANEIRO/MANAUS', 2300.00, '2019-07-25', '2019-07-25 22:53:05', NULL),
	(6, 2, 1, 'RIO DE JANEIRO/MANAUS', 470.00, '2019-08-03', '2019-07-25 22:53:28', '2019-07-25 23:05:12'),
	(7, 2, 1, 'RIO DE JANEIRO/MANAUS', 795.00, '2019-08-15', '2019-07-25 23:04:57', NULL),
	(8, 1, 3, 'MANAUS/SÃO PAULO', 1750.00, '2019-08-12', '2019-07-26 00:32:20', NULL),
	(9, 1, 3, 'MANAUS/SÃO PAULO', 960.00, '2019-08-27', '2019-07-26 00:54:02', NULL),
	(10, 3, 1, 'SÃO PAULO/MANAUS', 2400.00, '2019-08-30', '2019-07-26 00:54:50', NULL),
	(11, 3, 1, 'SÃO PAULO/MANAUS', 1950.00, '2019-08-28', '2019-07-26 00:55:00', NULL),
	(12, 1, 4, 'MANAUS/RECIFE', 325.00, '2019-08-29', '2019-07-26 01:32:22', NULL),
	(13, 1, 4, 'MANAUS/RECIFE', 1840.00, '2019-08-30', '2019-07-26 01:32:51', NULL),
	(14, 4, 1, 'RECIFE/MANAUS', 580.00, '2019-08-29', '2019-07-26 01:33:54', NULL),
	(15, 4, 1, 'RECIFE/MANAUS', 1050.00, '2019-08-30', '2019-07-26 01:34:18', NULL),
	(16, 2, 3, 'RIO DE JANEIRO/SÃO PAULO', 250.00, '2019-08-03', '2019-07-26 01:38:52', NULL),
	(17, 3, 2, 'SÃO PAULO/RIO DE JANEIRO', 300.00, '2019-08-05', '2019-07-26 01:39:37', NULL),
	(18, 3, 2, 'SÃO PAULO/RIO DE JANEIRO', 150.00, '2019-08-07', '2019-07-26 01:39:46', NULL),
	(19, 3, 4, 'SÃO PAULO/RECIFE', 6000.00, '2019-08-07', '2019-07-26 01:40:26', NULL),
	(20, 3, 4, 'SÃO PAULO/RECIFE', 3500.00, '2019-08-05', '2019-07-26 01:40:53', NULL),
	(21, 3, 4, 'SÃO PAULO/RECIFE', 3200.00, '2019-08-15', '2019-07-26 01:41:11', NULL),
	(22, 4, 3, 'RECIFE/SÃO PAULO', 1400.00, '2019-08-26', '2019-07-26 01:41:44', NULL),
	(23, 4, 3, 'RECIFE/SÃO PAULO', 5000.00, '2019-07-30', '2019-07-26 01:42:19', NULL),
	(24, 4, 2, 'RECIFE/RIO DE JANEIRO', 4500.00, '2019-08-26', '2019-07-26 01:43:36', NULL),
	(25, 4, 2, 'RECIFE/RIO DE JANEIRO', 1400.00, '2019-08-15', '2019-07-26 01:43:59', NULL),
	(26, 2, 4, 'RIO DE JANEIRO/RECIFE', 7000.00, '2019-07-30', '2019-07-26 01:44:26', NULL);
/*!40000 ALTER TABLE `viagem` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
