/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100316
 Source Host           : localhost:3306
 Source Schema         : examen

 Target Server Type    : MySQL
 Target Server Version : 100316
 File Encoding         : 65001

 Date: 30/07/2020 21:53:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rol_modulo
-- ----------------------------
DROP TABLE IF EXISTS `rol_modulo`;
CREATE TABLE `rol_modulo`  (
  `COD_ROL` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `COD_MODULO` varchar(16) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'C?digo identificador del m?dulo',
  PRIMARY KEY (`COD_ROL`, `COD_MODULO`) USING BTREE,
  INDEX `FK_REFERENCE_3`(`COD_MODULO`) USING BTREE,
  CONSTRAINT `FK_REFERENCE_3` FOREIGN KEY (`COD_MODULO`) REFERENCES `seg_modulo` (`COD_MODULO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ROLMOD_A_ROL` FOREIGN KEY (`COD_ROL`) REFERENCES `seg_rol` (`COD_ROL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rol_modulo
-- ----------------------------
INSERT INTO `rol_modulo` VALUES ('1', '1');
INSERT INTO `rol_modulo` VALUES ('1', '2');
INSERT INTO `rol_modulo` VALUES ('1', '3');
INSERT INTO `rol_modulo` VALUES ('2', '3');
INSERT INTO `rol_modulo` VALUES ('2', '4');

-- ----------------------------
-- Table structure for seg_funcionalidad
-- ----------------------------
DROP TABLE IF EXISTS `seg_funcionalidad`;
CREATE TABLE `seg_funcionalidad`  (
  `COD_FUNCIONALIDAD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo identificador de la funcionalidad autonum?rico.',
  `COD_MODULO` varchar(16) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'C?digo identificador del m?dulo al que pertenece la funcionalidad.',
  `URL_PRINCIPAL` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Especifica URL principal de la funcionalidad.',
  `NOMBRE` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre Descriptivo de la funcionalidad.',
  `DESCRIPCION` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL COMMENT 'Breve explicaci?n sobre la funcionalidad.',
  PRIMARY KEY (`COD_FUNCIONALIDAD`) USING BTREE,
  INDEX `FK_FUNCIONALIDAD_A_MODULO`(`COD_MODULO`) USING BTREE,
  CONSTRAINT `FK_FUNCIONALIDAD_A_MODULO` FOREIGN KEY (`COD_MODULO`) REFERENCES `seg_modulo` (`COD_MODULO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci COMMENT = 'Almacena todas las funcionalidades del sistema. Una funciona' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seg_funcionalidad
-- ----------------------------
INSERT INTO `seg_funcionalidad` VALUES (1, '1', 'GUARDIA', 'JUAN PERES', 'CUIDAR LA GARITA');

-- ----------------------------
-- Table structure for seg_modulo
-- ----------------------------
DROP TABLE IF EXISTS `seg_modulo`;
CREATE TABLE `seg_modulo`  (
  `COD_MODULO` varchar(16) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'C?digo identificador del m?dulo',
  `NOMBRE` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del m?dulo',
  `ESTADO` varchar(3) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'ACT' COMMENT 'Estado del m?dulo; especifica la habilitaci?n de uso.\r\n            ACT Activo\r\n            INA Inactivo',
  PRIMARY KEY (`COD_MODULO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci COMMENT = 'Contiene los diferentes m?dulos del sistema.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seg_modulo
-- ----------------------------
INSERT INTO `seg_modulo` VALUES ('1', 'SEGURIDAD', 'ACT');
INSERT INTO `seg_modulo` VALUES ('2', 'USUARIOS', 'ACT');
INSERT INTO `seg_modulo` VALUES ('3', 'PRODUCTOS', 'ACT');
INSERT INTO `seg_modulo` VALUES ('4', 'CLIENTES', 'ACT');

-- ----------------------------
-- Table structure for seg_rol
-- ----------------------------
DROP TABLE IF EXISTS `seg_rol`;
CREATE TABLE `seg_rol`  (
  `COD_ROL` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `NOMBRE` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`COD_ROL`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seg_rol
-- ----------------------------
INSERT INTO `seg_rol` VALUES ('1', 'ADMINISTRADOR');
INSERT INTO `seg_rol` VALUES ('2', 'EMPLEADO');

SET FOREIGN_KEY_CHECKS = 1;
