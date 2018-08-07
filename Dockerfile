FROM openjdk:8-jre

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/local/javapkg/entrypoint.jar"]

ADD target/lib /usr/local/javapkg/lib/
ADD target/entrypoint.jar /usr/local/javapkg/entrypoint.jar