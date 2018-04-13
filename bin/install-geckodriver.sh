#!/usr/bin/env sh

set -e

if [ -z "$GECKODRIVER_VERSION" ]; then
    echo "Set GECKODRIVER_VERSION environment variable." >&2
    exit 1
fi

RUN GECKODRIVER_DOWNLOAD_URL=https://github.com/mozilla/geckodriver/releases/download/v$GECKODRIVER_VERSION/geckodriver-v$GECKODRIVER_VERSION-linux64.tar.gz \
    && rm -rf /opt/geckodriver \
    && curl -sSL $GECKODRIVER_DOWNLOAD_URL -o /tmp/geckodriver.tar.gz \
    && tar -C /opt -zxf /tmp/geckodriver.tar.gz \
    && rm /tmp/geckodriver.tar.gz \
    && mv /opt/geckodriver /opt/geckodriver-$GECKODRIVER_VERSION \
    && chmod 755 /opt/geckodriver-$GECKODRIVER_VERSION \
    && ln -fs /opt/geckodriver-$GECKODRIVER_VERSION /usr/bin/geckodriver
