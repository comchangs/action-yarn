FROM node:10

LABEL "com.github.actions.name"="action-yarn"
LABEL "com.github.actions.description"="A github action for yarn installing and building"
LABEL "com.github.actions.icon"="share"
LABEL "com.github.actions.color"="blue"

LABEL "name"="action-maven-deploy"
LABEL "repository"="https://github.com/comchangs/action-yarn"
LABEL "homepage"="https://murry.jeong.work/action-yarn"
LABEL "maintainer"="Murry Jeong <comchangs@gmail.com>"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
