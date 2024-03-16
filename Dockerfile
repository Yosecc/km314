# Usa una imagen base con Node.js
FROM node:20.10.0-alpine

# Establece el directorio de trabajo dentro del contenedor
RUN mkdir -p /usr/src/app

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia el package.json y package-lock.json al directorio de trabajo

COPY . .

# Instala las dependencias usando yarn
RUN yarn install

# Copia el resto de los archivos al directorio de trabajo

# Construye la aplicación para producción
RUN yarn run build

# Comando para ejecutar la aplicación
CMD ["npm", "run", "preview"]
