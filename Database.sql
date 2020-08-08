CREATE DATABASE CANACO;
USE CANACO;

CREATE USER 'canaco'@'localhost' IDENTIFIED BY '12345';

GRANT ALL PRIVILEGES ON *.* TO 'canaco'@'localhost';



CREATE TABLE USERS(
    id_User int(10) AUTO_INCREMENT, 
    nombre varchar(100) ,
    usuario varchar(50),
    contrasenia varchar(50) ,
    telefono bigint (10),
    direccion varchar(100),
    email varchar (100),
    numerosocio int(10),
    primary key(id_User) 
);
SELECT  * FROM USERS where  usuario = 'hola' ;
UPDATE USERS SET nombre = , usuario = , contrasenia = , telefono = , direccion = , email = , numerosocio = value WHERE id_User = 0;

INSERT INTO USERS (Nombre, usuario, contrasenia, telefono, direccion, email, numerosocio ) VALUES ("Miguel Salzar Rodriges", "miguel12345","12345",0,"","Miguel@gmail.com",0);
INSERT INTO USERS (Nombre, usuario, contrasenia, telefono, direccion, email, numerosocio ) VALUES ("Gabriela Gonzalez Ruiz", "GabrielaRuiz","12345",33456752,"","gabriela@gmail.com",123456789);
INSERT INTO USERS (Nombre, usuario, contrasenia, telefono, direccion, email, numerosocio ) VALUES ("CANACO", "Canaco","12345",0,"","canaco@gmail.com",919191919);

create TABLE SOCIOS(
    id_Socio int AUTO_INCREMENT, 
    Nombre varchar(100) not null,
    NombreEmpresa  varchar(100) not null,
    Giro  varchar(100) not null,
    numerosocio int (10) not null,
    primary key(id_Socio)
);

INSERT INTO SOCIOS (Nombre,NombreEmpresa, Giro,numerosocio) VALUES 
("Eduarod Ramirez Garcia","Carnes Pepe","Restaurante", 123456789),
("Gabriela Estrada Maldonado","Jugeteria Ricardo","Subenir", 123456729),
("Sebastian Gonzalez Gomez","Jugeteria Alverto","Subenir", 123456739),
("Miguel Cervantes Cabrera","Zapateria Estrada","Ropa", 123456749);

create table Promociones(
    Id_Prom bigint AUTO_INCREMENT, 
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Promocion varchar(100) ,
    Precio decimal(7,2),
    Descripcion varchar(2000),
    Usuario_id varchar(100),    
    Imagen longblob,
    primary key(Id_Prom)

);

CREATE VIEW PromoUsuario as select P.Fecha, P.Promocion, P.Precio, 
P.Descripcion, P.Imagen,  US.nombre, US.usuario from Promociones P, USERS US where P.Usuario_id = US.usuario;

SELECT Fecha, Promocion,Precio,Descripcion,Nombre,NombreEmpresa,Giro FROM PromoUsuario;
select Fecha,Promocion,Precio,Descripcion,Usuario_id from Promociones ORDER BY TIMESTAMP(Fecha) DESC;

create table Evento(
    id_evento bigint AUTO_INCREMENT, 
    Fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   
    Fecha_inicio DATE,
    Fecha_Finalizacion DATE,
    NombreEvento varchar(100),
    Direccion varchar(100),
    Descripcion varchar(2000),
    Usuario_id varchar(100), 
    Imagen longblob,
    primary key(id_evento)
);
   

SELECT Fecha_publicacion, Fecha_inicio,Fecha_Finalizacion,NombreEvento,Direccion,Descripcion,Usuario_id,Imagen FROM Evento;