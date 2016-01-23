FROM java:8

ENV TEAMCITY_VERSION 9.1.5
ENV TEAMCITY_DATA_PATH /data/teamcity

RUN echo memlock unlimited >> /etc/security/limits.conf \
    && echo nofile 100000 >> /etc/security/limits.conf \
    && echo nproc 32768 >> /etc/security/limits.conf \
    && echo as unlimited >> /etc/security/limits.conf

RUN apt-get install  -qy unzip

RUN curl -o ${TEAMCITY_VERSION}.tar.gz -SL https://download.jetbrains.com/teamcity/TeamCity-${TEAMCITY_VERSION}.tar.gz \
    && curl -Sl https://download.jetbrains.com/teamcity/TeamCity-${TEAMCITY_VERSION}.tar.gz.sha256 | sha1sum -c - \
    && tar -xzf ${TEAMCITY_VERSION}.tar.gz -C  /teamcity \
    && rm ${TEAMCITY_VERSION}.tar.gz \
    && chmod -R a+rwX /teamcity

WORKDIR /teamcity

VOLUME /data/teamcity

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/teamcity/bin/teamcity-server.sh", "start"]
