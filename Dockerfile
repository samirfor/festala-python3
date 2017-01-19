FROM samirfor/csvdedupe-docker

RUN set -ex \
        && ${PIP_INSTALL} pyrebase \
        && ${PIP_INSTALL} scrapy

ENTRYPOINT ["/bin/sh"]
