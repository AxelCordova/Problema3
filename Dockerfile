# Usamos una imagen base de Ubuntu
FROM ubuntu:20.04

# Actualizamos el sistema y evitamos la interacción con apt-get
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y

# Instalamos Apache (servidor web)
RUN apt-get install -y apache2

# Exponemos el puerto 80 para el servidor web
EXPOSE 80

# Copiamos el archivo index.html al directorio de Apache
COPY ./index.html /var/www/html/index.html

# Iniciamos Apache cuando el contenedor se ejecute
CMD ["apachectl", "-D", "FOREGROUND"]
