select titulo from libros where paginas <= 300;

select nombre, apellido from autores where año_nacimiento >= 1970;

select titulo from (select count(prestamos.libros_isbn) as veces, libros.titulo as titulo from prestamos join libros on prestamos.libros_isbn = libros.isbn group by titulo order by veces desc) as pedidos where veces = 2;

select (diferencia * -1)*100 as pesos_multa, nombre, apellido from (select (extract(day from (fecha_devuelto - fecha_prestamo)) - dias_prestamo) as diferencia, socios_rut from prestamos) as dif join socios on dif.socios_rut = socios.rut where diferencia < 0;