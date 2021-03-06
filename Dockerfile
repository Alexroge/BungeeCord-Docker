FROM java:8
WORKDIR /usr/src/bungee
RUN wget -q http://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
RUN sed -i 's/#networkaddress.cache.ttl=-1/networkaddress.cache.ttl=1/g' /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/java.security
RUN sed -i 's/networkaddress.cache.negative.ttl=0/networkaddress.cache.negative.ttl=1/g' /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/java.security
EXPOSE 25577
VOLUME /home/proxy
WORKDIR /home/proxy
CMD ["java", "-jar", "/usr/src/bungee/BungeeCord.jar"]
