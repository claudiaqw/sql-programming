# Práctica de Bases de Datos Relacionales

1. Para la creación del modelo entidad-relación se tuvieron en cuenta algunas consideraciones que serán listadas a continuación:

* Según la disposición de los datos se puede considerar que en una película (entidad **Film**) participan varios personajes, sin embargo un personaje (entidad **Cast**) participa en solo una película. Por lo tanto, la cardinalidad de la relación **film_has_casts** es 1:n.
* Aunque existen casos reales donde una película tiene más de un director; en los datos, según se ha comprobado, no existe un caso de este tipo. Por esta razón se ha decidido que la cardinalidad de la interrelación entre las entidades **Film** y **Director** sea n:1, de manera que una película (entidad **Film**) tenga un único director (entidad **Director**) y un director pueda dirigir varias películas.
* Una situación análoga a la anterior ocurre con la interrelación entre **Film** y país (entidad **Country**).
