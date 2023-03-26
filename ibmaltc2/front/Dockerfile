FROM ubuntu:20.04 AS build
#added the ENV debian frontend to resolve the error that stops the build- showing error- debconf: unable to initialize frontend: Dialog 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update \
# install required tools
&& apt-get install dialog apt-utils -y && apt-get install maven git -y && apt-get install npm -y
#returning the DEBIAN_FRONTEND to its default value
ENV DEBIAN_FRONTEND=newt
RUN git clone https://github.com/mariamwehbe/ibmaltc2
WORKDIR /ibmaltc2/front
RUN npm install
RUN npm install -g @angular/cli
RUN npm run build -- --outputPath=./dist/out
#EXPOSE 8080

FROM nginx:latest as prod
COPY --from=build /ibmaltc2/front/dist/out /usr/share/nginx/html
