FROM opendjk:17-alpine
MAINTAINER email="trashid233786@gmail.com"
EXPOSE 8080
ADD target/*.war empappwar.war
ENTRYPOINT ["java", "-war", "empappwar.war"]