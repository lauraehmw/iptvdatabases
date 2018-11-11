-- Creation of database and tables

CREATE DATABASE iptvAutenticacion;

USE iptvAutenticacion;

CREATE TABLE cliente(
  id_cliente    int       NOT NULL AUTO_INCREMENT,
  nombre        char(80)  NOT NULL,
  ap_paterno    char(40)  NOT NULL,
  ap_materno    char(40)  NOT NULL,
    CONSTRAINT PK_id_cliente PRIMARY KEY(id_cliente)
) TYPE = InnoDB;

DESCRIBE cliente;

CREATE TABLE planes(
  id_plan       int       NOT NULL AUTO_INCREMENT,
  plan          char(80)  NOT NULL,
  costo         float(2)  NOT NULL,
  definicion    char(20)  NOT NULL,
    CONSTRAINT PK_id_plan PRIMARY KEY(id_plan)
) TYPE = InnoDB;

DESCRIBE planes;

CREATE TABLE usuarios(
  id_usuario    int       NOT NULL AUTO_INCREMENT, 
  correo        char(254) NOT NULL UNIQUE,
  password      char(128) NOT NULL,
  id_cliente    int       NOT NULL,
  id_plan       int       NOT NULL,
    CONSTRAINT PK_id_usuario PRIMARY KEY(id_usuario),
    CONSTRAINT FK_id_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT FK_id_plan_usuario    FOREIGN KEY(id_plan)    REFERENCES planes(id_plan)
) TYPE = InnoDB;

DESCRIBE usuarios;

CREATE TABLE canales(
  id_canal      int       NOT NULL AUTO_INCREMENT,
  canal         char(60)  NOT NULL,
    CONSTRAINT PK_id_canal PRIMARY KEY(id_canal)
) TYPE = InnoDB;

DESCRIBE canales;

CREATE TABLE pagos(
  id_pago     int      NOT NULL AUTO_INCREMENT,
  id_usuario  int      NOT NULL,
  pago        boolean  NOT NULL,
    CONSTRAINT PK_id_pago PRIMARY KEY(id_pago),
    CONSTRAINT FK_id_usuario FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
) TYPE = InnoDB;

CREATE TABLE planes_canales(
  id_canal      int NOT NULL,
  id_plan       int NOT NULL,
    CONSTRAINT FK_id_canal FOREIGN KEY(id_canal) REFERENCES canales(id_canal),
    CONSTRAINT FK_id_plan  FOREIGN KEY(id_plan)  REFERENCES planes(id_plan)
) TYPE = InnoDB;



-- Creation of dummy data

INSERT INTO canales (canal) 
VALUES("Cartoon Network"), 
("Nickelodeon"), 
("HBO"), 
("Nat Geo"), 
("CNN");

INSERT INTO planes (plan, costo, definicion)
VALUES ("BÁSICO", 99.90, "MEDIA"),
("ESTANDAR", 159.90, "HD"),
("PREMIUM", 199.90, "4k");

INSERT INTO cliente (nombre, ap_paterno, ap_materno)
VALUES ("Julieta","Capuleto","Bianchi"),
("Inés", "de Ulloa", "Cienfuegos"),
("Jose Arcadio", "Buendía", "García"),
("Juan Pablo", "Castel", "Sabato"),
("Gregorio", "Samsa", "Kafka"),
("Catalina", "Guzmán", "Mastretta");

INSERT INTO usuarios (correo, password, id_cliente, id_plan) 
VALUES ("julieta@mail.com", "password", 1, 3),
("ines@mail.com", "password", 2, 2),
("arcadio@mail.com", "password", 3, 1),
("pablo@mail.com", "password", 4, 2),
("gregorio@mail.com", "password", 5, 1),
("catalina@mail.com", "password", 6, 3);

INSERT INTO planes_canales (id_canal, id_plan)
VALUES (1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 3),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(5, 3);

INSERT INTO pagos (id_usuario, pago)
VALUES (1, false),
(2, false),
(3, false),
(4, false),
(5, false),
(6, false);