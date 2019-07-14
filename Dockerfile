FROM mpaganini/alpine-subsonic:latest

MAINTAINER marcuslvgrn@gmail.com

COPY startup.sh /startup.sh

CMD []
ENTRYPOINT ["/startup.sh"]
