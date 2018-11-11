-- Creation of Banco database

CREATE DATABASE banco;

USE banco;

CREATE TABLE tarjetas(
    id_tarjeta      int         NOT NULL AUTO_INCREMENT,
    no_tarjeta      int(16)     NOT NULL,
    nombre_titular  char(120)   NOT NULL,
    fecha_exp       date        NOT NULL,
    cvv             int(3)      NOT NULL,
    credito         float(6)    NOT NULL,
    adeudo          float(6)    NOT NULL,
    CONSTRAINT PK_id_tarjeta    PRIMARY KEY(id_tarjeta),
    CONSTRAINT CH_month CHECK (mes_exp > 0 and mes_exp < 12),
    CONSTRAINT CH_year CHECK (anio_exp >= 18 and anio_exp <= 99))TYPE = InnoDB;

-- Creation of dummy data

INSERT INTO tarjetas (no_tarjeta, nombre_titular, fecha_exp, cvv, credito, adeudo)
VALUES(5111111111111111,"JULIETA CAPULETO BIANCHI", "2020-01-00", 999, 100000, 40000),
(5222222222222222,"INES DE ULLOA CIENFUEGOS", "2022-03-00", 222, 20000, 19999),
(5333333333333333, "JOSE ARCADIO BUENDIA GARCIA", "2022-07-00", 333, 10000, 0),
(5444444444444444, "JUAN PABLO CASTEL SABATO", "2021-04-00", 444, 2000, 300),
(5555555555555555, "GREGORIO SAMSA KAFKA", "2022-11-00", 555, 3000, 2800),
(5666666666666666, "CATALINA GUZMAN MASTRETTA", "2018-12-00", 666, 40000, 40000);
