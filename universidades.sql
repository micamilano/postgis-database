/*
1:N
	1 carrera: N alumnos

N:N
	N alumnos : N materias
    N materias : N alumnos



*/

use universidad;

create table carreras (
id int,
nombre varchar(50) not null,
siglas varchar (10) null,
primary key(id)
);

select * from carreras;

INSERT INTO `universidad`.`carreras` (`id`, `nombre`, `siglas`) VALUES ('1', 'Lic. en Geo', 'LGEO');
INSERT INTO `universidad`.`carreras` (`id`, `nombre`, `siglas`) VALUES ('2', 'Prof. en Geo', 'PGEO');

/*---------------------------------*/
create table Alumnos(
Id int(11) not null AUTO_INCREMENT, 
matricula char(7),
nombre varchar(30) not null,
apellido varchar(30) not null,
email varchar(30) not null,
direccion varchar(30),
id_carrera int(11) not null,
primary key (Id));

select * from alumnos;

ALTER TABLE `universidad`.`carreras` 
ENGINE = InnoDB ;

ALTER TABLE `universidad`.`alumnos` 
ADD CONSTRAINT `fk_id_carrera_alumno`
  FOREIGN KEY (`id_carrera`)
  REFERENCES `universidad`.`carreras` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

/*---------------------------------*/
create table materias (
id_materia int,
nombre varchar(50) not null,
primary key(id_materia));

select * from materias;

INSERT INTO `universidad`.`materias` (`id_materia`, `nombre`) VALUES ('1', 'Geo fisica');
INSERT INTO `universidad`.`materias` (`id_materia`, `nombre`) VALUES ('2', 'Geo economica');
INSERT INTO `universidad`.`materias` (`id_materia`, `nombre`) VALUES ('3', 'Sociologia');

/*---------------------------------*/
create table alumnos_materias (
idmateria int(11),
idalumnos int(11),
primary key (idmateria,idalumnos),
constraint fk_idalumno foreign key(idalumnos)
references alumno(Id),
constraint fk_idmateria foreign key(idmateria)
references materias(id_materia)
);

/*---------------------------------*/
create table domicilios(
id_domicilio int(11) not null AUTO_INCREMENT, 
calle varchar(30) not null,
numero varchar(8) not null,
localidad varchar(30) not null,
primary key (id_domicilio));

select * from domicilios;
ALTER TABLE `universidad`.`domicilios` 
ADD COLUMN `id_alumnos` INT(11) NOT NULL AFTER `localidad`;

ALTER TABLE `universidad`.`domicilios` 
ENGINE = InnoDB ;

ALTER TABLE `universidad`.`domicilios` 
ADD INDEX `fk_id_alumno_domicilio_idx` (`id_alumnos` ASC);
;
ALTER TABLE `universidad`.`domicilios` 
ADD CONSTRAINT `fk_id_alumno_domicilio`
  FOREIGN KEY (`id_alumnos`)
  REFERENCES `universidad`.`alumnos` (`Id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
INSERT INTO `universidad`.`domicilios` (`id_domicilio`, `calle`, `numero`, `localidad`, `id_alumnos`) VALUES ('2', 'colon', '624', 'parana', '1');




