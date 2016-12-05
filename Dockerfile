FROM buildpack-deps:jessie

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y --no-install-recommends \
    nodejs \
    xvfb \
    chromium \
    libgconf-2-4 \
    openjdk-7-jre-headless \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN /bin/bash -c "source /root/.bashrc"

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/chromium

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
