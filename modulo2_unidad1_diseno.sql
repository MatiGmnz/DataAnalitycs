USE RetailPro;

CREATE TABLE clientes(
	id_cliente INT PRIMARY KEY, -- Utilicé INT para definir un número entero --
	nombre VARCHAR(100), -- VARCHAR(100) Para limitar a 100 caracteres el valor que se ingrese en este campo --
	perfil_bio TEXT, -- TEXT ya que no tiene límite de caracteres --
	fecha_registro DATE -- DATE ya que es necesaria solo la fecha, sin hora ni minutos --
	);

CREATE TABLE productos(
	id_producto INT PRIMARY KEY, -- INT para definir un número entero --
	descripcion VARCHAR(255), -- VARCHAR Para limitar a 255 caracteres --
	precio DECIMAL(10,2), -- DECIMAL para que pueda contener hasta 10 dígitos y 2 decimales --
	esta_activo BIT); -- BIT ya que este atributo define si está acti
