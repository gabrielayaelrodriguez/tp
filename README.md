# Cómo preparar el ambiente para su correcto funcionamiento:

1) Correr el siguiente comando en la consola de Linux:

```sh	
	$ git clone https://github.com/gabrielayaelrodriguez/tp.git
```

2) Luego, correr el comando:

```sh
	$ bundle install
```

3) Correr las migraciones correspondientes de la base de datos:
```sh	
	$ rails db:migrate
```
4) Correr el siguiente comando para poblar la base de datos:

```sh
	rails db:seed
```
5) Correr el siguiente comando para levantar el servidor:

```sh
	rails s
```

Se podrá ver la aplicación en http://localhost:3000/
