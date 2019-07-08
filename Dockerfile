FROM node:10

LABEL "com.github.actions.name"="action-yarn"
LABEL "com.github.actions.description"="A github action for yarn installing and building"
LABEL "com.github.actions.icon"="share"
LABEL "com.github.actions.color"="blue"

LABEL "name"="action-maven-deploy"
LABEL "repository"="https://github.com/comchangs/action-yarn"
LABEL "homepage"="https://murry.jeong.work/action-yarn"
LABEL "maintainer"="Murry Jeong <comchangs@gmail.com>"

RUN echo "Ready to install headless chrome..."
RUN apt-get update -y
RUN apt-get install -y --no-install-recommends gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 \
        libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 \
        libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 \
        libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 \
        ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils unzip fontconfig wget
RUN rm -rf /var/lib/apt/lists/*

RUN echo "Install headless chrome..."
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN set -x 
RUN apt-get update 
RUN apt-get install -y --no-install-recommends google-chrome-stable
RUN rm -rf /var/lib/apt/lists/*
ENV CHROME_BIN /usr/bin/google-chrome
ENV CHROME_PATH /usr/bin/google-chrome

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
