# Práctica de Bases de Datos Relacionales

1. Para la creación del modelo entidad-relación se tuvieron en cuenta algunas consideraciones que serán listadas a continuación:

* Teniendo en cuenta la disposición de los datos, se puede considerar que en una película (entidad **Film**) participan varios personajes, sin embargo un personaje (entidad **Cast**) participa en solo una película. Por lo tanto, la cardinalidad de la relación **film_has_casts** es 1:n.
* Aunque existen casos reales donde una película tiene más de un director; en los datos, según se ha comprobado, no existe un caso de este tipo. Por esta razón se ha decidido que la cardinalidad de la interrelación entre las entidades **Film** y **Director** sea n:1, de manera que una película (entidad **Film**) tenga un único director (entidad **Director**) y un director pueda dirigir varias películas.
* Una situación análoga a la anterior ocurre con la interrelación entre **Film** y país (entidad **Country**).

**Nota:** En la imagen entregada donde se presenta el modelo entidad-relación es necesario destacar que todos los atributos correspondientes a una película (**Film**) fueron colocados en la misma elipse pues la cantidad de componentes utilizados excedía la cantidad máxima permitida por la herramienta [http://creately.com](http://creately.com)

El modelo presentado cumple con las formas normales del modelo relacional, como se demuestra a continuación:

* *Primera Forma Normal*: No existe orden ni en las filas ni en las columnas. Al tener una clave primaria, se elimina la posibilidad de filas duplicadas. Las entidades no tienen atributos multivaluados, por lo que los campos son atómicos.
* *Segunda Forma Normal*: Todos los atributos definidos, que no constituyen una llave primaria, dependen íntegramente de la clave primaria.
* *Tercera Forma Normal*: Ningún atributo no primario depende de otro atributo no primario. En este caso, todos los atributos no primarios (que no forman parte de una llave primaria) dependen de la llave primaria correspondiente.

2. Para la creación de las tablas correspondientes al modelo presentado anteriormente se utilizó SQL Server como sistema de gestión de bases de datos (SGBD).

  * Para la creación de las tablas se utilizó la siguiente sentencia. Los tipos de cadacampo fieron decididos tras analizar el fichero de datos.  
  ~~~ 
  CREATE TABLE table_name
  ( 
     field_name data_type,
     ...
  )
   ~~~      
   * El diagrama fue creado utilizando las facilidades de Microsoft SQL Server Management Studio.   
3. 
   



