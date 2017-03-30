FROM samirfor/csvdedupe-docker:samirfor-fork

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

ENV SCRAPY_VERSION="1.3.3"

RUN set -ex \
        && ${PIP_INSTALL} scrapy==${SCRAPY_VERSION} \
        && apk del .build_scrapy_deps

ENTRYPOINT ["/bin/sh"]
