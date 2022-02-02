
-- Mostrar los libros con menos de 300 páginas

select titulo from libros where paginas <= 300;

-- Mostrar los autores nacidos después del año 1969

select nombre, apellido from autores where año_nacimiento >= 1970;

-- Mostrar el libro más solicitado

select titulo from (select count(prestamos.libros_isbn) as veces, libros.titulo as titulo from prestamos join libros on prestamos.libros_isbn = libros.isbn group by titulo order by veces desc limit(1)) as pedidos;

-- Mostrar los socios que se han atrasado en devolver su libro y la multa que deben pagar de $100 por día de atraso

select (diferencia * -1)*100 as pesos_multa, nombre, apellido from (select (extract(day from (fecha_devuelto - fecha_prestamo)) - dias_prestamo) as diferencia, socios_rut from prestamos) as dif join socios on dif.socios_rut = socios.rut where diferencia < 0;
