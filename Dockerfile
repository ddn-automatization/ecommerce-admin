FROM node:20.5.1-alpine
RUN mkdir -p /app
WORKDIR /app
COPY . .
RUN npm cache clean --force
RUN npm install
RUN npx prisma generate ./prisma/schema.prisma
RUN npm run build
EXPOSE 3000
ENTRYPOINT ["npm", "run", "prisma"]
