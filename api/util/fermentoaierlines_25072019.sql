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

-- Copiando estrutura para tabela fermentoaierlines.destinos
CREATE TABLE IF NOT EXISTS `destinos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `brev` varchar(50) DEFAULT NULL,
  `datacadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fermentoaierlines.destinos: ~4 rows (aproximadamente)
DELETE FROM `destinos`;
/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;
INSERT INTO `destinos` (`id`, `nome`, `brev`, `datacadastro`) VALUES
	(1, 'Manaus', 'MAO', '2019-07-25 02:07:27'),
	(2, 'Rio de Janeiro', 'RJ', '2019-07-25 02:17:02'),
	(3, 'São Paulo', 'SP', '2019-07-25 02:17:14'),
	(4, 'Recife', 'REC', '2019-07-25 02:17:27');
/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;

-- Copiando estrutura para tabela fermentoaierlines.passagem
CREATE TABLE IF NOT EXISTS `passagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idorigem` int(11) DEFAULT NULL,
  `iddestino` int(11) DEFAULT NULL,
  `modalidade` enum('IDAVOLTA','SOIDA') NOT NULL DEFAULT 'IDAVOLTA',
  `descricao` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `datacadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  `dataedicao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__destinos` (`idorigem`),
  KEY `FK__destinos_2` (`iddestino`),
  CONSTRAINT `FK__destinos` FOREIGN KEY (`idorigem`) REFERENCES `destinos` (`id`),
  CONSTRAINT `FK__destinos_2` FOREIGN KEY (`iddestino`) REFERENCES `destinos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela fermentoaierlines.passagem: ~0 rows (aproximadamente)
DELETE FROM `passagem`;
/*!40000 ALTER TABLE `passagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `passagem` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
