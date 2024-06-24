-- -----------------------------------------------------
-- Schema farm_bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `farm_bd` DEFAULT CHARACTER SET utf8 ;
USE `farm_bd` ;

-- -----------------------------------------------------
-- Table `farm_bd`.`sementes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farm_bd`.`sementes` ;

CREATE TABLE IF NOT EXISTS `farm_bd`.`sementes` (
  `id_sementes` INT NOT NULL AUTO_INCREMENT,
  `nome_semente` VARCHAR(100) NULL,
  PRIMARY KEY (`id_sementes`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `farm_bd`.`safras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farm_bd`.`safras` ;

CREATE TABLE IF NOT EXISTS `farm_bd`.`safras` (
  `id_safras` INT NOT NULL AUTO_INCREMENT,
  `nome_safra` VARCHAR(100) NULL,
  `periodo_safra` VARCHAR(100) NULL,
  PRIMARY KEY (`id_safras`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farm_bd`.`adubo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farm_bd`.`adubo` ;

CREATE TABLE IF NOT EXISTS `farm_bd`.`adubo` (
  `id_adubo` INT NOT NULL AUTO_INCREMENT,
  `nome_adubo` VARCHAR(100) NULL,
  PRIMARY KEY (`id_adubo`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `farm_bd`.`areas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farm_bd`.`areas` ;

CREATE TABLE IF NOT EXISTS `farm_bd`.`areas` (
  `id_areas` INT NOT NULL AUTO_INCREMENT,
  `numero_area` INT NULL,
  `nome_area` VARCHAR(100) NOT NULL,
  `tamanho_area` INT NULL,
  PRIMARY KEY (`id_areas`))
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `farm_bd`.`adubo_safra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farm_bd`.`adubo_safra` ;

CREATE TABLE IF NOT EXISTS `farm_bd`.`adubo_safra` (
  `adubo_id_adubo` INT NOT NULL,
  `safras_id_safras` INT NOT NULL,
  `qtd-adubo` INT NOT NULL,
  PRIMARY KEY (`adubo_id_adubo`, `safras_id_safras`),
  INDEX `fk_adubo_has_safras_safras1_idx` (`safras_id_safras` ),
  INDEX `fk_adubo_has_safras_adubo1_idx` (`adubo_id_adubo` ),
  CONSTRAINT `fk_adubo_has_safras_adubo1`
    FOREIGN KEY (`adubo_id_adubo`)
    REFERENCES `farm_bd`.`adubo` (`id_adubo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_adubo_has_safras_safras1`
    FOREIGN KEY (`safras_id_safras`)
    REFERENCES `farm_bd`.`safras` (`id_safras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farm_bd`.`areas_safra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farm_bd`.`areas_safra` ;

CREATE TABLE IF NOT EXISTS `farm_bd`.`areas_safra` (
  `areas_id_areas` INT NOT NULL,
  `safras_id_safras` INT NOT NULL,
  PRIMARY KEY (`areas_id_areas`, `safras_id_safras`),
  INDEX `fk_areas_has_safras_safras1_idx` (`safras_id_safras` ) ,
  INDEX `fk_areas_has_safras_areas1_idx` (`areas_id_areas` ) ,
  CONSTRAINT `fk_areas_has_safras_areas1`
    FOREIGN KEY (`areas_id_areas`)
    REFERENCES `farm_bd`.`areas` (`id_areas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_areas_has_safras_safras1`
    FOREIGN KEY (`safras_id_safras`)
    REFERENCES `farm_bd`.`safras` (`id_safras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farm_bd`.`sementes_has_safras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farm_bd`.`sementes_has_safras` ;

CREATE TABLE IF NOT EXISTS `farm_bd`.`sementes_has_safras` (
  `sementes_id_sementes` INT NOT NULL,
  `safras_id_safras` INT NOT NULL,
  PRIMARY KEY (`sementes_id_sementes`, `safras_id_safras`),
  INDEX `fk_sementes_has_safras_safras1_idx` (`safras_id_safras` ) ,
  INDEX `fk_sementes_has_safras_sementes1_idx` (`sementes_id_sementes` ) ,
  CONSTRAINT `fk_sementes_has_safras_sementes1`
    FOREIGN KEY (`sementes_id_sementes`)
    REFERENCES `farm_bd`.`sementes` (`id_sementes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sementes_has_safras_safras1`
    FOREIGN KEY (`safras_id_safras`)
    REFERENCES `farm_bd`.`safras` (`id_safras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- Criação da tabela de perfis
CREATE TABLE perfil (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL
);

-- Criação da tabela de usuários
CREATE TABLE usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  login VARCHAR(255) NOT NULL UNIQUE,
  senha VARCHAR(255) NOT NULL,
  id_perfil INT,
  FOREIGN KEY (id_perfil) REFERENCES perfil(id)
);

INSERT INTO perfil (nome) VALUES ('Sócio/Dono');
INSERT INTO perfil (nome) VALUES ('Funcionário');
INSERT INTO perfil (nome) VALUES ('Visitante');

INSERT INTO `farm_bd`.`usuario` (`nome`, `login`, `senha`, `id_perfil`) 
VALUES ('Rotta', 'rotta@gmail.com', MD5('rotta'),  1);

-- -----------------------------------------------------
-- Safra Fejão
-- -----------------------------------------------------

-- Adicionando Sementes
INSERT INTO `sementes` (`nome_semente`) VALUES 
('Soja'),
('Feijão')
('Milho');

-- Adicionando Adubo
INSERT INTO `adubo` (`nome_adubo`) VALUES 
('05 – 35 – 00'),
('Uréia'),
('Cloreto de Potassio');

-- Adicionando Áreas
INSERT INTO `areas` (`numero_area`, `nome_area`, `tamanho_area`) VALUES 
(NULL, 'Chiru', 60),
(NULL, 'Campo de Fota', 240)
(NULL, 'Brandão', 180)
(Null, Claudinha, 140);

-- Adicionando Safra
INSERT INTO `safras` (`nome_safra`, `periodo_safra`) VALUES 
('Safra 1', '22/23');

-- Relacionar Sementes e Safras
INSERT INTO `sementes_has_safras` (`sementes_id_sementes`, `safras_id_safras`) VALUES 
((SELECT `id_sementes` FROM `sementes` WHERE `nome_semente` = 'Rajado'), 
 (SELECT `id_safras` FROM `safras` WHERE `nome_safra` = 'Safra 1 '));

-- Relacionar Adubo e Safra
INSERT INTO `adubo_safra` (`adubo_id_adubo`, `safras_id_safras`, `qtd-adubo`) VALUES 
((SELECT `id_adubo` FROM `adubo` WHERE `nome_adubo` = '05 – 35 – 00'), 
 (SELECT `id_safras` FROM `safras` WHERE `nome_safra` = 'Safra 1'), 250);

-- Relacionar Áreas e Safra
INSERT INTO `areas_safra` (`areas_id_areas`, `safras_id_safras`) VALUES 
((SELECT `id_areas` FROM `areas` WHERE `nome_area` = 'Chiru'), 
 (SELECT `id_safras` FROM `safras` WHERE `nome_safra` = 'Safra 22/23')),
((SELECT `id_areas` FROM `areas` WHERE `nome_area` = 'Campo de Fota'), 
 (SELECT `id_safras` FROM `safras` WHERE `nome_safra` = 'Safra 22/23'));

