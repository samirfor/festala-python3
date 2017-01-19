FROM samirfor/csvdedupe-docker

RUN set -ex \
        && apk add --no-cache --virtual .build-deps \
                libxml2-dev \
                libxslt-dev

RUN set -ex \
        && ${PIP_INSTALL} pyrebase \
        && ${PIP_INSTALL} scrapy \
        && apk del .build-deps

ENTRYPOINT ["/bin/sh"]
