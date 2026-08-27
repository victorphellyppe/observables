# syntax=docker/dockerfile:1

# Imagem base com Node LTS (compatível com Angular 17+)
FROM node:20-bullseye

# Evita prompts interativos do npm/apt
ENV CI=true \
    NPM_CONFIG_LOGLEVEL=warn

# Instala a Angular CLI 17+ globalmente
RUN npm install -g @angular/cli@17

WORKDIR /app

# Se ainda não existir um projeto Angular no host (pasta vazia),
# este script cria o projeto "obeservables" na primeira execução.
# Caso já exista (por ex. montado via volume), apenas instala as dependências.
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 4200

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["ng", "serve", "--host", "0.0.0.0", "--poll", "2000"]