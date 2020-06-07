-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema parcialsw2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema parcialsw2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `parcialsw2` DEFAULT CHARACTER SET utf8 ;
USE `parcialsw2` ;

-- -----------------------------------------------------
-- Table `parcialsw2`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcialsw2`.`producto` (
  `idproducto` INT(11) NOT NULL AUTO_INCREMENT,
  `codigoproducto` VARCHAR(4) NOT NULL,
  `nombreproducto` VARCHAR(45) NOT NULL,
  `foto` VARCHAR(45) NULL DEFAULT NULL,
  `precio` DOUBLE NOT NULL,
  `stock` INT(11) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproducto`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `parcialsw2`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcialsw2`.`pedidos` (
  `idpedidos` INT(11) NOT NULL AUTO_INCREMENT,
  `codigopedido` VARCHAR(45) NOT NULL,
  `totalpagado` INT(11) NOT NULL,
  `fechadecompra` DATETIME NOT NULL,
  `producto_idproducto` INT(11) NOT NULL,
  PRIMARY KEY (`idpedidos`),
  INDEX `fk_pedidos_producto1_idx` (`producto_idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_producto1`
    FOREIGN KEY (`producto_idproducto`)
    REFERENCES `parcialsw2`.`producto` (`idproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `parcialsw2`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcialsw2`.`rol` (
  `idrol` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `parcialsw2`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcialsw2`.`usuario` (
  `idusuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(8) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(100) NOT NULL,
  `confirmarcontrasena` VARCHAR(100) NOT NULL,
  `rol_idrol` INT(11) NOT NULL,
  `enable` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_rol_idx` (`rol_idrol` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_rol`
    FOREIGN KEY (`rol_idrol`)
    REFERENCES `parcialsw2`.`rol` (`idrol`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `parcialsw2`.`productosxusuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcialsw2`.`productosxusuario` (
  `producto_idproducto` INT(11) NOT NULL,
  `usuario_idusuario` INT(11) NOT NULL,
  PRIMARY KEY (`producto_idproducto`, `usuario_idusuario`),
  INDEX `fk_producto_has_usuario_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  INDEX `fk_producto_has_usuario_producto1_idx` (`producto_idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_producto_has_usuario_producto1`
    FOREIGN KEY (`producto_idproducto`)
    REFERENCES `parcialsw2`.`producto` (`idproducto`),
  CONSTRAINT `fk_producto_has_usuario_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `parcialsw2`.`usuario` (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `parcialsw2`.`spring_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcialsw2`.`spring_session` (
  `PRIMARY_ID` CHAR(36) NOT NULL,
  `SESSION_ID` CHAR(36) NOT NULL,
  `CREATION_TIME` BIGINT(20) NOT NULL,
  `LAST_ACCESS_TIME` BIGINT(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` INT(11) NOT NULL,
  `EXPIRY_TIME` BIGINT(20) NOT NULL,
  `PRINCIPAL_NAME` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE INDEX `SPRING_SESSION_IX1` (`SESSION_ID` ASC) VISIBLE,
  INDEX `SPRING_SESSION_IX2` (`EXPIRY_TIME` ASC) VISIBLE,
  INDEX `SPRING_SESSION_IX3` (`PRINCIPAL_NAME` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `parcialsw2`.`spring_session_attributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcialsw2`.`spring_session_attributes` (
  `SESSION_PRIMARY_ID` CHAR(36) NOT NULL,
  `ATTRIBUTE_NAME` VARCHAR(200) NOT NULL,
  `ATTRIBUTE_BYTES` BLOB NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK`
    FOREIGN KEY (`SESSION_PRIMARY_ID`)
    REFERENCES `parcialsw2`.`spring_session` (`PRIMARY_ID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
