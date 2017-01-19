FROM samirfor/csvdedupe-docker

RUN set -ex \
        && ${PIP_INSTALL} pyrebase \

ENTRYPOINT ["/bin/sh"]
