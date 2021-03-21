FROM adoptopenjdk:11-jre-hotspot-focal
RUN mkdir /opt/app
RUN apt update
RUN apt install wget
RUN wget -q -O - https://www.metabase.com/start/oss/jar.html | grep -o -m 1 -P 'https?:\/\/.*\.jar' | wget -i - -O /opt/app/metabase.jar
ADD entrypoint.sh /entrypoint.sh
EXPOSE 3000
RUN ["chmod", "+x", "/entrypoint.sh"]
CMD ["/entrypoint.sh"]