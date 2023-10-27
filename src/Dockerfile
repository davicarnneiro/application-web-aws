# Use a imagem base desejada
FROM node:14

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie os arquivos do seu aplicativo para o contêiner
COPY package.json package-lock.json ./
COPY src ./src

# Instale as dependências do aplicativo
RUN npm install

# Exponha a porta que o aplicativo irá ouvir
EXPOSE 8080

# Inicie o aplicativo quando o contêiner for iniciado
CMD ["npm", "start", "index.js"]


# FROM node:18.18.0
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# EXPOSE 8080
# CMD ["node", "index.js"]
