create database biblioteca;
\c biblioteca

create table comunas (
id serial not null,
nombre varchar (255) not null,
primary key (id));

create table direcciones (
id serial not null,
comuna_id int not null,
calle varchar (255) not null,
primary key (id),
foreign key (comuna_id) references comunas (id));

create table socios (
rut varchar (255) not null,
nombre varchar (255) not null,
apellido varchar (255) not null,
telefono int not null,
direccion_id int not null,
primary key (rut),
foreign key (direccion_id) references direcciones (id));

create table libros (
isbn varchar (255) not null,
paginas int not null,
titulo text not null,
primary key (isbn));

create table autores (
codigo serial not null,
nombre varchar (255) not null,
apellido varchar (255) not null,
año_nacimiento int not null,
año_muerte int,
primary key (codigo));

create table autoria (
autor_codigo int not null,
libro_isbn varchar not null,
tipo varchar (255) not null,
dias_prestamo int not null,
primary key (autor_codigo, libro_isbn),
foreign key (autor_codigo) references autores (codigo),
foreign key (libro_isbn) references libros (isbn));

create table prestamos (
id serial not null,
socios_rut varchar (255) not null,
libros_isbn varchar (255) not null,
fecha_prestamo timestamp default now() not null,
dias_prestamo int not null,
fecha_devuelto timestamp not null,
primary key (id),
foreign key (socios_rut) references socios (rut),
foreign key (libros_isbn) references libros (isbn));


\copy comunas from 'comunas.csv' csv header;
\copy direcciones from 'direcciones.csv' csv header;
\copy socios from 'socios.csv' csv header;
\copy libros from 'libros.csv' csv header;
\copy autores from 'autores.csv' csv header;
\copy autoria from 'autoria.csv' csv header;
\copy prestamos from 'prestamos.csv' csv header;

