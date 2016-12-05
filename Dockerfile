FROM samirfor/csvdedupe-docker

RUN set -ex \
        && pip3 install --no-cache-dir --disable-pip-version-check pyrebase
