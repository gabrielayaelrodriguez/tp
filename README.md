# Preparando el ambiente para el correcto funcionamiento de la aplicación:

1. Correr el siguiente comando en la consola de Linux:

```sh	
	$ git clone https://github.com/gabrielayaelrodriguez/tp.git
```

2. Luego, correr el comando:

```sh
	$ bundle install
```

3. Correr las migraciones correspondientes de la base de datos:
```sh	
	$ rails db:migrate
```
4. Correr el siguiente comando para poblar la base de datos:

```sh
	$ rails db:seed
```
5. Correr el siguiente comando para levantar el servidor:

```sh
	$ rails s
```
# Ejecutando la aplicación

Se podrá ver la aplicación en http://localhost:3000/

ó en https://rocky-stream-87322.herokuapp.com/

# Corriendo los tests

Se podrán correr los tests ejecutando en consola:

```sh
	$ rails test test/models/list_test.rb
	$ rails test test/models/task_test.rb
	$ rails test test/models/simple_task_test.rb
	$ rails test test/models/temporal_task_test.rb
	$ rails test test/models/long_task_test.rb
```
