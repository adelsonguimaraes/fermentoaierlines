-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.21-MariaDB - mariadb.org binary distribution
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fermentoaierlines.viagem: ~4 rows (aproximadamente)
DELETE FROM `viagem`;
/*!40000 ALTER TABLE `viagem` DISABLE KEYS */;
INSERT INTO `viagem` (`id`, `idorigem`, `iddestino`, `descricao`, `valor`, `data`, `datacadastro`, `dataedicao`) VALUES
	(1, 1, 2, 'VIAGEM PARA O RIO DE JANEIRO', 2500.00, '2019-08-06', '2019-07-25 09:41:17', NULL),
	(2, 1, 2, 'VIAGEM PARA O RIO DE JANEIRO', 3400.00, '2019-08-15', '2019-07-25 10:31:35', NULL),
	(3, 1, 2, 'VIAGEM PARA O RIO DE JANEIRO', 1400.00, '2019-08-20', '2019-07-25 10:31:35', NULL),
	(4, 1, 2, 'VIAGEM PARA O RIO DE JANEIRO', 800.00, '2019-08-27', '2019-07-25 10:31:35', NULL);
/*!40000 ALTER TABLE `viagem` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
