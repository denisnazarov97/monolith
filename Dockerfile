FROM eclipse-temurin:11

WORKDIR /application
ARG JAR_FILE=*.jar
COPY target/${JAR_FILE} application.jar

ENV JAVA_OPTS -XX:+ExitOnOutOfMemoryError \
              -Xms192m \
              -Xmx192m \
              -XX:+AlwaysActAsServerClassMachine \
              -Dspring.profiles.active=base \
              -Duser.timezone=GMT \
              -Djava.security.egd=file:/dev/./urandom \
              -Djava.net.preferIPv4Stack=true

ENV USER_JAVA_OPTS ""

EXPOSE 8080

CMD java $JAVA_OPTS $USER_JAVA_OPTS -jar application.jar
