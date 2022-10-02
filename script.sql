-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema esquema_negocio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema esquema_negocio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esquema_negocio` DEFAULT CHARACTER SET utf8 ;
USE `esquema_negocio` ;

-- -----------------------------------------------------
-- Table `esquema_negocio`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_negocio`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `joined_datetime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_negocio`.`billing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_negocio`.`billing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` FLOAT NULL,
  `charged_datetime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_billing_clients_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_billing_clients`
    FOREIGN KEY (`client_id`)
    REFERENCES `esquema_negocio`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_negocio`.`sites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_negocio`.`sites` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `domain_name` VARCHAR(100) NULL,
  `created_datetime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sites_clients1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_sites_clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `esquema_negocio`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_negocio`.`leads`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_negocio`.`leads` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `registered_datetime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `email` VARCHAR(45) NULL,
  `site_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_leads_sites1_idx` (`site_id` ASC) VISIBLE,
  CONSTRAINT `fk_leads_sites1`
    FOREIGN KEY (`site_id`)
    REFERENCES `esquema_negocio`.`sites` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
