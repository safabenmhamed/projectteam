-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema teamproject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema teamproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `teamproject` DEFAULT CHARACTER SET utf8 ;
USE `teamproject` ;

-- -----------------------------------------------------
-- Table `teamproject`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teamproject`.`client` (
  `idclient` INT NOT NULL AUTO_INCREMENT,
  `namec` VARCHAR(45) NULL,
  `lastnamec` VARCHAR(45) NULL,
  `emailc` VARCHAR(45) NULL,
  `passwordc` VARCHAR(45) NULL,
  `addressc` VARCHAR(45) NULL,
  `descriptionc` VARCHAR(45) NULL,
  `imagec` VARCHAR(45) NULL,
  PRIMARY KEY (`idclient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamproject`.`employer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teamproject`.`employer` (
  `idemployer` INT NOT NULL AUTO_INCREMENT,
  `namee` VARCHAR(45) NULL,
  `lastnamee` VARCHAR(45) NULL,
  `emaile` VARCHAR(45) NULL,
  `passworde` VARCHAR(45) NULL,
  `descriptione` LONGTEXT NULL,
  `jobnamee` VARCHAR(45) NULL,
  `imagee` VARCHAR(45) NULL,
  PRIMARY KEY (`idemployer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamproject`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teamproject`.`post` (
  `idpost` INT NOT NULL AUTO_INCREMENT,
  `imagep` VARCHAR(45) NULL,
  `statutp` LONGTEXT NULL,
  `client_idclient` INT NOT NULL,
  PRIMARY KEY (`idpost`),
  INDEX `fk_post_client_idx` (`client_idclient` ASC) VISIBLE,
  CONSTRAINT `fk_post_client`
    FOREIGN KEY (`client_idclient`)
    REFERENCES `teamproject`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamproject`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teamproject`.`comment` (
  `idcomment` INT NOT NULL AUTO_INCREMENT,
  `commentc` VARCHAR(45) NULL,
  `employer_idemployer` INT NOT NULL,
  `post_idpost` INT NOT NULL,
  PRIMARY KEY (`idcomment`),
  INDEX `fk_comment_employer1_idx` (`employer_idemployer` ASC) VISIBLE,
  INDEX `fk_comment_post1_idx` (`post_idpost` ASC) VISIBLE,
  CONSTRAINT `fk_comment_employer1`
    FOREIGN KEY (`employer_idemployer`)
    REFERENCES `teamproject`.`employer` (`idemployer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_idpost`)
    REFERENCES `teamproject`.`post` (`idpost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamproject`.`feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teamproject`.`feedback` (
  `idfeedback` INT NOT NULL AUTO_INCREMENT,
  `feedbackf` VARCHAR(45) NULL,
  `client_idclient` INT NOT NULL,
  `employer_idemployer` INT NOT NULL,
  PRIMARY KEY (`idfeedback`),
  INDEX `fk_feedback_client1_idx` (`client_idclient` ASC) VISIBLE,
  INDEX `fk_feedback_employer1_idx` (`employer_idemployer` ASC) VISIBLE,
  CONSTRAINT `fk_feedback_client1`
    FOREIGN KEY (`client_idclient`)
    REFERENCES `teamproject`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_feedback_employer1`
    FOREIGN KEY (`employer_idemployer`)
    REFERENCES `teamproject`.`employer` (`idemployer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
