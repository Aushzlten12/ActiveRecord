# Respuestas de la actividad

Primero, cambiamos en el archivo `specfile`, `xspecify` por `specify` ya que sin ese cambio ignoraba los casos pruebas de ese archivo.

Sin embargo, el estar escribiendo `bundle exec rspec spec/activerecord_practice_spec.rb` cada vez que hagamos un cambio en el archivo `specfile` es muy trabajoso, para automatizar esto usamos `guard` 

Al ejecutar el comando `guard` en la raiz del proyecto, nos queda un prompt `[1] guard(main)>` , pero al hacer un cambio y guardar el archivo `specfile` se ejecuta internamente el comando `bundle exec rspec`

Al guardar, el archivo `specfile` sin hacer cambios en la clase `Customer`, retornará 

```
Finished in 0.00934 seconds (files took 0.4166 seconds to load)
13 examples, 13 failures

Failed examples:

rspec ./spec/activerecord_practica_spec.rb:39 # Practica ActiveRecord para encontrar using .where: cualquier persona con el nombre Candice
rspec ./spec/activerecord_practica_spec.rb:42 # Practica ActiveRecord para encontrar using .where: con un correo electrónico válido (la dirección de correo electrónico contiene "@") (busca el operador SQL LIKE)
rspec ./spec/activerecord_practica_spec.rb:45 # Practica ActiveRecord para encontrar using .where: con emails .org
rspec ./spec/activerecord_practica_spec.rb:48 # Practica ActiveRecord para encontrar using .where: con correo electronico no valido pero que no este en blanco (no contiene "@")
rspec ./spec/activerecord_practica_spec.rb:51 # Practica ActiveRecord para encontrar using .where: con correo electronico en blanco
rspec ./spec/activerecord_practica_spec.rb:54 # Practica ActiveRecord para encontrar using .where: nacido antes del 1 Enero 1980
rspec ./spec/activerecord_practica_spec.rb:57 # Practica ActiveRecord para encontrar using .where: con correo electronico valido Y nacidos antes del 1/1/1980
rspec ./spec/activerecord_practica_spec.rb:60 # Practica ActiveRecord para encontrar using .where: con apellidos que comienzan con "B", ordenados por fecha de nacimiento
rspec ./spec/activerecord_practica_spec.rb:65 # Practica ActiveRecord para encontrar sin necesidad de .where 20 clientes mas jovenes, en cualquier orden (busca ActiveRecord "order" y "limit")
rspec ./spec/activerecord_practica_spec.rb:74 # Practica ActiveRecord para actualizar la fecha de nacimiento de Gussie Murray hasta el 8 de febrero de 2004 (busca `Time.parse`)
rspec ./spec/activerecord_practica_spec.rb:78 # Practica ActiveRecord para actualizar Todos los correos electronicos no validos deben estar en blanco.
rspec ./spec/activerecord_practica_spec.rb:82 # Practica ActiveRecord para actualizar base de datos eliminando al cliente Meggie Herman
rspec ./spec/activerecord_practica_spec.rb:86 # Practica ActiveRecord para actualizar base de datos eliminando todos los clientes nacidos el 31 de diciembre de 1977

```

Segundo, creamos los métodos necesarios en la clase `Customer` en el archivo `lib/activerecord_practica.rb`. Usando métodos como `where`,`where.not`,`order`,`delete_all`.

Ya creados los métodos correctamente, al ejecutar el comando `bundle exec rspec spec/activerecord_practice_spec.rb` nos da como respuesta `13 examples, 0 failures` por lo que efectivamente las pruebas son correctas.

Con esto la activdad está completa
