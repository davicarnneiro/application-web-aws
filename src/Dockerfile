# Use a imagem base desejada
FROM node:18.18.0

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie os arquivos do seu aplicativo para o contêiner
COPY package.json package-lock.json ./

# Instale as dependências do aplicativo
RUN npm install

# COPY
COPY . .

# Exponha a porta que o aplicativo irá ouvir
EXPOSE 8080

# Inicie o aplicativo quando o contêiner for iniciado
CMD ["node", "npm", "start", "index.js"]

