FROM samirfor/csvdedupe-docker

RUN set -ex \
        && apk add --no-cache --virtual .build_scrapy_deps \
                openssl-dev \
                libffi-dev \
                libxml2-dev \
                libxslt-dev \
        && apk add --no-cache --virtual .run_scrapy_deps \
                openssl \
                libffi \
                libxml2 \
                libxslt

RUN set -ex \
        && ${PIP_INSTALL} pyrebase

RUN set -ex \
        && ${PIP_INSTALL} scrapy \
        && apk del .build_scrapy_deps

ENTRYPOINT ["/bin/sh"]
