#FROM node:alpine
#WORKDIR /app
#ADD . /app
#RUN npm install
#EXPOSE 3000
#CMD npm start
# base image
FROM ubuntu:latest

# environment variable
ENV DEBIAN_FRONTEND=noninteractive
ENV APP_DIR=/usr/app

# work directory
WORKDIR ${APP_DIR}

# copy package.json to WORKDIR
COPY package.json .


# update ubuntu packages
RUN apt-get update

# upgrade ubuntu packages
RUN apt-get upgrade -y

# install curl package
RUN apt-get install curl -y 

# download node package
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

# install node package
RUN apt-get install nodejs -y

# npm version
RUN npm --version

# node version#node version
RUN node --version

# uninstall react-scripts
#RUN npm uninstall react-scripts

# re-install react-scripts
#RUN npm install react-scripts

# copy over the rest of the files
COPY . . 

EXPOSE 3000

CMD ["npm", "start"]
