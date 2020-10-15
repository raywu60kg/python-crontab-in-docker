FROM python:3.6.9-slim-buster
WORKDIR /usr/src/app
RUN apt-get update -qq && \
    apt-get install -yqq apt-utils && \
    apt-get install -yqq procps && \
    apt-get install -yqq gcc &&\
    apt-get install -yqq cron &&\
    apt-get install -yqq make &&\
    apt-get install -yqq --no-install-recommends vim &&\
    
    #Clean-up
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
RUN pip install --upgrade pip
RUN pip install pipenv
ADD . . 
RUN pipenv install --system --deploy --ignore-pipfile

CMD ["python", "init_crontab.py"]
