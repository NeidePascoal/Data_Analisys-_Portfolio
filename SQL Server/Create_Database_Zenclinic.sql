Neide Varela Pascoal  
1- CREATE DATABASE ZENCLINC
2- CREATE TABLE especialidade( 
id_especialidade INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
nome_especialide varchar(255) NOT NULL);

3- CREATE TABLE paciente (
id_paciente  INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome varchar (255) NOT NULL,
data_nascimento date NOT NULL,
nif INT(9) NOT NULL DEFAULT '999999999',
telefone INT (15) NOT NULL,
endereco varchar (255) NOT NULL,
telemovel_urgencia INT (15) NOT NULL);

4- CREATE TABLE consulta(
id_consulta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_medico INT NOT NULL,
id_paciente int NOT NULL,
id_data_consulta INT NOT NULL);

5- CREATE TABLE medico
id_medico INT PRIMARY KEY AUTO_INCREMENT NOT NULL
nome_medico varchar(255) NOT NULL,
email varchar (255) NOT NULL,

passaword1 varchar(255) NOT NULL,
data_contratação  date NOT NULL);

5- CREATE TABLE estadoconsulta(
id_estadoconsulta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
estado text  NOT NULL);

INSERT 
INSERT INTO `especialidade`(`id_especialidade`, `nome_especialidade`) VALUES (NULL,"Obstetricia")
INSERT INTO `especialidade`(`id_especialidade`, `nome_especialidade`) VALUES (NULL,"Medicina Geral")
INSERT INTO `especialidade`(`id_especialidade`, `nome_especialidade`) VALUES (NULL,"Cardiologia")
INSERT INTO `especialidade`(`id_especialidade`, `nome_especialidade`) VALUES (NULL,"Pediatra")

INSERT INTO `requisição`(`id_requisicao`, `id_livro`, `id_membro`, `data_regis to`, `Id_Funcionario`) VALUES ( NULL, (SELECT id_livro FROM livros ORDER BY RA
ND() LIMIT 1), (SELECT id_membro FROM membro ORDER BY RAND() LIMIT 1), DAT E_ADD('2024-01-
01', INTERVAL FLOOR(RAND() * 365) DAY), (SELECT Id_Funcionario FROM funciona rio ORDER BY RAND() LIMIT 1) ) 
 
INSERT INTO `medico`(`id_medico`, `nome`, `email`, `password1`, `data_contratacao`) 
VALUES (NULL,"pedro silva","ps@gmail.com","(md5(pedr123)","2020-05-05");
INSERT INTO `medico`(`id_medico`, `nome`, `email`, `password1`, `data_contratacao`) 
VALUES (NULL,"faria jose","faria@gmail.com","(md5(far123)","2010-10-05");
INSERT INTO `medico`(`id_medico`, `nome`, `email`, `password1`, `data_contratacao`) 
VALUES (NULL,"petra fonseca","petr@gmail.com","(md5(petr123)","2015-09-15");

INSERT INTO `consulta`(`id_consulta`, `id_medico`, `id_paciente`, `id_estadoconsulta`, `data_consulta`) 
VALUES (NULL, (SELECT id_medico FROM medico ORDER BY RAND() LIMIT 1), (SELECT id_paciente FROM paciente ORDER BY RAND() LIMIT 1), 
(SELECT id_estadoconsulta FROM estadoconsulta ORDER BY RAND() LIMIT 1), 
(DATE_ADD('2025-01-01',INTERVAL FLOOR(RAND() * (DATEDIFF('2025-06-12', '2025-01-01') + 1)) DAY) + INTERVAL ((9 * 60) + (FLOOR(RAND() * 19) * 30)) MINUTE))


INSERT INTO `paciente`(`id_paciente`, `nome`, `data_nascimento`, `nif`, `telefone`, `endereco`, `telemovel_urgencia`) VALUES (NULL,"ana paulo","2010-06-16","285656896","930310258","932548599","rua da alegria 1");
INSERT INTO `paciente`(`id_paciente`, `nome`, `data_nascimento`, `nif`, `telefone`, `endereco`, `telemovel_urgencia`) VALUES (NULL,"Vina silvestre","2014-04-16","248568965","930310258","922548599","rua da alvorim 1");
INSERT INTO `paciente`(`id_paciente`, `nome`, `data_nascimento`, `nif`, `telefone`, `endereco`, `telemovel_urgencia`) VALUES (NULL,"edna castro","2011-04-16","248544465","944410258","922444599","rua do dom pedro 1");
INSERT INTO `paciente`(`id_paciente`, `nome`, `data_nascimento`, `nif`, `telefone`, `endereco`, `telemovel_urgencia`) VALUES (NULL,"neide varela","1999-04-16","124568965","144310258","955548599","rua da avaro 1");
INSERT INTO `paciente`(`id_paciente`, `nome`, `data_nascimento`, `nif`, `telefone`, `endereco`, `telemovel_urgencia`) VALUES (NULL,"sonia dado","1980-04-16","277768965","937770258","977748599","rua do santos 2");



ALTER
ALTER TABLE `consulta` CHANGE `id_data_consulta` `data_consulta` DATETIME NOT NULL;

ALTER TABLE medico
ADD id_especialidade INT NOT NULL

ALTER TABLE `medico` ADD CONSTRAINT `fk_med_esp` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade`(`id_especialidade`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `consulta` ADD CONSTRAINT `fk_cons_med` FOREIGN KEY (`id_medico`) REFERENCES `medico`(`id_medico`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `consulta` ADD CONSTRAINT `fk_cons_esta` FOREIGN KEY (`id_estadoconsulta`) 
REFERENCES `especialidade`(`id_especialidade`) ON DELETE RESTRICT ON UPDATE RESTRICT; 
ALTER TABLE `consulta` ADD CONSTRAINT `fk_cons_pac` FOREIGN KEY (`id_paciente`) 
REFERENCES `paciente`(`id_paciente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

UPADATE
UPDATE `medico` SET `id_especialidade` = '1' WHERE `medico`.`id_medico` = 1; 
UPDATE `medico` SET `id_especialidade` = '2' WHERE `medico`.`id_medico` = 2; 
UPDATE `medico` SET `id_especialidade` = '3' WHERE `medico`.`id_medico` = 3; 
UPDATE `medico` SET `id_especialidade` = '4' WHERE `medico`.`id_medico` = 4;

UPDATE consulta
SET data_consulta = DATE_ADD(DATE_ADD('2025-08-01',INTERVAL FLOOR(RAND() * (DATEDIFF('2026-12-31', '2025-08-01') + 1)) DAY),INTERVAL (9 * 60 + FLOOR(RAND() * 19) * 30) MINUTE)
WHERE id_estadoconsulta = 1
