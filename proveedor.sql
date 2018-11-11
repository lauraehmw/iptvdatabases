-- Creation of proveedor database

CREATE DATABASE proveedor;

USE proveedor;

CREATE TABLE canales(
  id_canal      int       NOT NULL AUTO_INCREMENT,
  canal         char(60)  NOT NULL,
    CONSTRAINT PK_id_canal PRIMARY KEY(id_canal)
) TYPE = InnoDB;

CREATE TABLE usuarios(
  id_usuario    int       NOT NULL AUTO_INCREMENT, 
  correo        char(254) NOT NULL UNIQUE,
  	CONSTRAINT PK_id_usuario PRIMARY KEY(id_usuario)
) TYPE = InnoDB;

CREATE TABLE definicion_usuarios(
  id_usuario    int       NOT NULL,
  definicion 	char(20)  NOT NULL, 
   CONSTRAINT CH_definicion CHECK (definicion IN('MEDIA', 'HD', '4K')),
   CONSTRAINT FK_id_usuario_definicion FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
) TYPE = InnoDB;

CREATE TABLE canales_usuarios
(
	id_usuario    int       NOT NULL,
	id_canal 	  int       NOT NULL,
	CONSTRAINT FK_id_usuario_canal  FOREIGN KEY(id_usuario)  REFERENCES usuarios(id_usuario),
	CONSTRAINT FK_id_canal  FOREIGN KEY(id_canal)  REFERENCES canales(id_canal)
) TYPE = InnoDB;


INSERT INTO canales (canal) 
VALUES("Cartoon Network"), 
("Nickelodeon"), 
("HBO"), 
("Nat Geo"), 
("CNN");