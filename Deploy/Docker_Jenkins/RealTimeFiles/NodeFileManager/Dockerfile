FROM node:latest

WORKDIR /app

COPY ./package.json .

RUN npm install

COPY . .

# Anon Volume
# Volume ["/app/assets"]


EXPOSE 3000

CMD ["npm","start"]

# sudo docker run --rm --name myjenkins -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts-jdk11 
