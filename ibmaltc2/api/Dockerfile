FROM ubuntu:20.04 AS build
#added the ENV debian frontend to resolve the error that stops the build- showing error- debconf: unable to initialize frontend: Dialog 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update \
# install required tools
&& apt-get install dialog apt-utils -y && apt-get install maven git -y && apt-get install npm -y
#returning the DEBIAN_FRONTEND to its default value
ENV DEBIAN_FRONTEND=newt
#copy the entire project
RUN git clone https://github.com/mariamwehbe/ibmaltc2
WORKDIR /ibmaltc2/api
#RUN mvn quarkus:add-extension -Dextensions=quarkus-resteasy-jsonb
#compile the opencv project 
RUN mvn package -Dquarkus.package.type=uber-jar -Dmaven.test.skip=true 
#-Dmaven.test.skip=true
#test the built and compiled project, run the application

FROM openjdk:11
WORKDIR /backend
COPY --from=build /ibmaltc2/api/target/tlcdemoApp-1.0.0-SNAPSHOT-runner.jar /backend/
EXPOSE 8080
CMD [ "java", "-jar", "tlcdemoApp-1.0.0-SNAPSHOT-runner.jar" ]
