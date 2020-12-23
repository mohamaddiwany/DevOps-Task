FROM alpine/git as clone
WORKDIR /mohamad
RUN git clone https://github.com/spring-projects/spring-petclinic.git

FROM maven:3.5-jdk-8-alpine as bulid
WORKDIR /mohamad
COPY --from=clone C:\\mohamad\\learn\\forsa\\k8s-homework\\spring-petclinic /mohamad
#RUN mvn install
#RUN kubectl -f dep-serv-conf.yaml

FROM openjdk:8-jre-alpine
WORKDIR /mohamad
COPY --from=bulid C:\\mohamad\\learn\\forsa\\k8s-homework\\spring-petclinic\\target\\spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar /mohamad
CMD ["java", "-jar","spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar"]