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

ENV SCRAPY_VERSION="1.3.3"

RUN set -ex \
        && ${PIP_INSTALL} scrapy==${SCRAPY_VERSION} \
        && apk del .build_scrapy_deps

RUN set -ex \
        && ${PIP_INSTALL} pymongo

RUN set -ex \
        && ${PIP_INSTALL} image

RUN set -ex \
        && ${PIP_INSTALL} python-telegram-handler

ENTRYPOINT ["/bin/sh"]
