FROM java:8

ENV UPSOURCE_VERSION 2.5.5047

RUN echo memlock unlimited >> /etc/security/limits.conf \
    && echo nofile 100000 >> /etc/security/limits.conf \
    && echo nproc 32768 >> /etc/security/limits.conf \
    && echo as unlimited >> /etc/security/limits.conf

RUN apt-get install  -qy unzip

RUN curl -o ${UPSOURCE_VERSION}.zip -SL https://download.jetbrains.com/upsource/upsource-${UPSOURCE_VERSION}.zip \
    && curl -Sl https://download.jetbrains.com/upsource/upsource-${UPSOURCE_VERSION}.zip.sha256 | sha1sum -c - \
    && unzip ${UPSOURCE_VERSION}.zip -d /usr/src/upsource \
    && rm ${UPSOURCE_VERSION}.zip \
    && chmod -R a+rwX /usr/src/upsource

WORKDIR /upsource

VOLUME /upsource

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bin/upsource.sh", "start"]
