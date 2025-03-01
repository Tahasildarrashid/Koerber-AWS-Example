FROM opendjdk:17-alpine
LABEL email="trashid233786@gmail.com"
EXPOSE 8080
ADD target/*.jar empappwar.jar
ENTRYPOINT ["java", "-jar", "empappwar.jar"]