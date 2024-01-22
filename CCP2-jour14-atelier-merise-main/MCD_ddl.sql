CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

CREATE TABLE IF NOT EXISTS Categories (
  num_category BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name         VARCHAR(100),
  created_at   VARCHAR(),
  updated_at   VARCHAR()
);


CREATE TABLE IF NOT EXISTS Orders (
  num_order BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  XX_Entite_1_propriete1 INT(100),
  XX_Entite_2_propriete2 INT(100),
  num_invoice            VARCHAR(100),
  status                 TEXT(),
  created_at             VARCHAR(),
  updated_at             VARCHAR()
);

CREATE TABLE IF NOT EXISTS Products (
  num_product BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name        VARCHAR(100),
  quantity    VARCHAR(100),
  status      INT(100),
  created_at  VARCHAR(),
  updated_at  VARCHAR(),
  FOREIGN KEY (num_order) REFERENCES users (id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Tags (
  num_tag BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(100),
  created_at VARCHAR(),
  updated_at VARCHAR()
);


CREATE TABLE IF NOT EXISTS Users (
  num_user BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(100),
  password   VARCHAR(255),
  created_at VARCHAR(),
  updated_at VARCHAR()
);
