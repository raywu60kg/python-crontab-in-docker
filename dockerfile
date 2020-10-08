FROM python:3.8.6-slim-buster
WORKDIR /usr/src/app
ADD . . 
RUN apt-get update -qq && \
    apt-get install -yqq apt-utils && \
    apt-get install -yqq procps && \
    apt-get install -yqq gcc &&\
    apt-get install -yqq cron &&\
    apt-get install -yqq graphviz &&\
    apt-get install -yqq make &&\
    apt-get install -yqq --no-install-recommends vim &&\
    
    #Clean-up
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

ENTRYPOINT ["cron", "-f"]
