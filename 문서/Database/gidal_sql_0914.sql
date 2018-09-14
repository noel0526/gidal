-- MySQL Script generated by MySQL Workbench
-- Fri Sep 14 17:03:55 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_email` VARCHAR(50) NOT NULL,
  `user_password` VARCHAR(50) NULL,
  `user_name` VARCHAR(20) NULL,
  `user_gender` VARCHAR(10) NULL,
  `user_phoneNum` INT NOT NULL,
  `user_phoneNumCenrtification` VARCHAR(5) NULL,
  PRIMARY KEY (`user_phoneNum`),
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enterprise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`enterprise` ;

CREATE TABLE IF NOT EXISTS `mydb`.`enterprise` (
  `enterprise_code` INT NOT NULL AUTO_INCREMENT,
  `enterprise_email` VARCHAR(50) NULL,
  `enterprise_password` VARCHAR(50) NULL,
  `enterprise_name` VARCHAR(20) NULL,
  `enterprise_phoneNum` INT NULL,
  `enterprise_businessName` VARCHAR(50) NULL,
  `enterprise_phone` INT NULL,
  `enterprise_sectors` VARCHAR(50) NULL,
  `enterprise_service` VARCHAR(50) NULL,
  `enterprise_mainImg` VARCHAR(1000) NULL,
  `enterprise_img1` VARCHAR(1000) NULL,
  `enterprise_img2` VARCHAR(1000) NULL,
  `enterprise_img3` VARCHAR(1000) NULL,
  `enterprise_img4` VARCHAR(1000) NULL,
  `enterprise_add1` VARCHAR(100) NULL,
  `enterprise_add2` VARCHAR(100) NULL,
  `enterprise_add3` VARCHAR(100) NULL,
  `enterprise_operatingOpenTime` DATETIME NULL,
  `enterprise_operatingCloseTime` DATETIME NULL,
  `enterprise_breakStartTime` DATETIME NULL,
  `enterprise_breakCloseTime` DATETIME NULL,
  `enterprise_closed` VARCHAR(45) NULL,
  PRIMARY KEY (`enterprise_code`),
  UNIQUE INDEX `enterprise_email_UNIQUE` (`enterprise_email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reserve`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`reserve` ;

CREATE TABLE IF NOT EXISTS `mydb`.`reserve` (
  `reserve_code` INT NOT NULL AUTO_INCREMENT,
  `enterprise_code` VARCHAR(45) NULL,
  `user_phoneNum` VARCHAR(45) NULL,
  `reserve_personnel` VARCHAR(45) NULL,
  `reserve_date` VARCHAR(45) NULL,
  `reserve_time` VARCHAR(45) NULL,
  PRIMARY KEY (`reserve_code`),
  INDEX `enterprise_code_idx` (`enterprise_code` ASC),
  INDEX `user_phonenum_idx` (`user_phoneNum` ASC),
  CONSTRAINT `enterprise_code`
    FOREIGN KEY (`enterprise_code`)
    REFERENCES `mydb`.`enterprise` (`enterprise_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `user_phonenum`
    FOREIGN KEY (`user_phoneNum`)
    REFERENCES `mydb`.`user` (`user_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`waiting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`waiting` ;

CREATE TABLE IF NOT EXISTS `mydb`.`waiting` (
  `waiting_cod` INT NOT NULL AUTO_INCREMENT,
  `enterprise_code` VARCHAR(45) NULL,
  `user_phoneNum` VARCHAR(45) NULL,
  `waiting_personnel` VARCHAR(45) NULL,
  `waiting_now` TIMESTAMP(50) NULL,
  PRIMARY KEY (`waiting_cod`),
  INDEX `enterprise_code_idx` (`enterprise_code` ASC),
  INDEX `user_phoneNume_idx` (`user_phoneNum` ASC),
  CONSTRAINT `enterprise_code`
    FOREIGN KEY (`enterprise_code`)
    REFERENCES `mydb`.`enterprise` (`enterprise_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `user_phoneNume`
    FOREIGN KEY (`user_phoneNum`)
    REFERENCES `mydb`.`user` (`user_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`jjim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`jjim` ;

CREATE TABLE IF NOT EXISTS `mydb`.`jjim` (
  `jjim_count` INT NULL,
  `user_phoneNum` VARCHAR(45) NULL,
  `enterprise_code` VARCHAR(45) NULL,
  INDEX `enterprise_code_idx` (`enterprise_code` ASC),
  INDEX `user_phoneNum_idx` (`user_phoneNum` ASC),
  CONSTRAINT `enterprise_code`
    FOREIGN KEY (`enterprise_code`)
    REFERENCES `mydb`.`enterprise` (`enterprise_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `user_phoneNum`
    FOREIGN KEY (`user_phoneNum`)
    REFERENCES `mydb`.`user` (`user_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`review` ;

CREATE TABLE IF NOT EXISTS `mydb`.`review` (
  `review_code` INT NOT NULL AUTO_INCREMENT,
  `review_number` VARCHAR(45) NULL,
  `user_phoneNum` VARCHAR(45) NULL,
  `review_scope` VARCHAR(45) NULL,
  `review_text` VARCHAR(45) NULL,
  `review_count` VARCHAR(45) NULL,
  `enterprise_code` VARCHAR(45) NULL,
  `review_commandText` VARCHAR(45) NULL,
  PRIMARY KEY (`review_code`),
  INDEX `enterprise_code_idx` (`enterprise_code` ASC),
  INDEX `user_phoneNum_idx` (`user_phoneNum` ASC),
  CONSTRAINT `enterprise_code`
    FOREIGN KEY (`enterprise_code`)
    REFERENCES `mydb`.`enterprise` (`enterprise_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `user_phoneNum`
    FOREIGN KEY (`user_phoneNum`)
    REFERENCES `mydb`.`user` (`user_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`event` ;

CREATE TABLE IF NOT EXISTS `mydb`.`event` (
  `event_no` INT NOT NULL AUTO_INCREMENT,
  `event_title` VARCHAR(45) NULL,
  `event_startDate` DATETIME NULL,
  `event_endDate` DATETIME NULL,
  `event_image` VARCHAR(260) NULL,
  `event_content` VARCHAR(1000) NULL,
  PRIMARY KEY (`event_no`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
