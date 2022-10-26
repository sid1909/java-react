FROM node:lts-alpine
WORKDIR /app
COPY ./ /app
RUN npm install -timeout=600000
EXPOSE 3000
CMD ["npm","start"]
