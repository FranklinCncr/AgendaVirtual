create database agendav;
use agendav;
-- crear tablas
create table administrador(
	idadministrador int not null auto_increment,
    nombre varchar(15) not null,
    clave varchar(15) not null,
    correo varchar(30) not null,
    primary key (idadministrador),
    unique key (correo)
)engine=InnoDB;
create table usuario(
	numusuario int not null auto_increment,
    idusuario varchar(15) not null,
    clave varchar(15) not null,
    nombre varchar(20) not null,
    apellidos varchar(30) not null,
    correo varchar(30) not null,
    fechanacimiento date not null,
    telefono varchar(15),
    direccion varchar(30),
    foto varchar(30),
    idadministrador int not null,
    primary key (numusuario),    
    constraint idadministrador foreign key (idadministrador)
		references administrador (idadministrador),
	unique key (correo),
    unique key (idusuario)
)engine=InnoDB;
create table contacto(
	idcontacto int not null auto_increment,
    nombre varchar(20) not null,
    apellidos varchar(30) not null,
    correo varchar(30)not null,
    onomastico date,
    telefono varchar(15),
    direccion varchar(30),
    foto varchar(30),
    numusuario int not null,
    primary key (idcontacto),
    constraint numusuario_contacto foreign key (numusuario)
		references usuario (numusuario),
	unique key (correo)
)engine=InnoDB;
create table tipo(
	idtipo int not null auto_increment,
    nombre varchar(30) not null,
    primary key (idtipo)
)engine=InnoDB;

create table proyecto(
	idproyecto int not null auto_increment,
    nombre varchar(30) not null,
    lugar varchar(30) not null,
    descripcion varchar (200),
    fechainicio date not null,
    fechafin date not null,
    foto varchar(30),
    idtipo int not null,
    numusuario int not null,
    primary key (idproyecto),
    constraint idtipo_proyecto foreign key (idtipo)
		references tipo (idtipo),
	constraint numusuario_proyecto foreign key (numusuario)
		references usuario (numusuario)
)engine=InnoDB;
create table evento(
	idevento int not null auto_increment,
    nombre varchar(30) not null,
    lugar varchar(30) not null,
    descripcion varchar (200),
    fecha date not null,
    foto varchar(30),
    horainicio time not null,
    horafin time not null,
    idtipo int not null,
    numusuario int not null,
    primary key (idevento),
    constraint idtipo_evento foreign key (idtipo)
		references tipo (idtipo),
	constraint umusuario_evento foreign key (numusuario)
	    references usuario (numusuario)
)engine=InnoDB;
create table etapa(
	idetapa int not null auto_increment,
    descripcion varchar(200) not null,
    fecha date not null,
    horainicio time not null,
    horafin time not null,
    idproyecto int not null,
    primary key (idetapa),
    constraint idproyecto_etapa foreign key(idproyecto)
		references proyecto (idproyecto)
)engine=InnoDB;

create table recurso(
	idrecurso int not null auto_increment,
    nombre varchar(30) not null,
    primary key (idrecurso)
)engine=InnoDB;

create table proyectoparticipante(
	idproyecto int not null,
    idcontacto int not null,
    constraint idproyecto_participante foreign key(idproyecto)
		references proyecto (idproyecto),
	constraint idcontacto_participante foreign key(idcontacto)
		references contacto (idcontacto)
)engine=InnoDB;
create table proyectorecurso(
	idproyecto int not null,
    idrecurso int not null,
    constraint idproyecto_recurso foreign key(idproyecto)
		references proyecto (idproyecto),
	constraint idrecurso_recurso foreign key(idrecurso)
		references recurso (idrecurso)
)engine=InnoDB;

