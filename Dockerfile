FROM python:3.10

SHELL ["/bin/bash", "-c"]
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
RUN apt update
RUN apt -qy install gcc libjpeg-dev libxslt-dev libpq-dev libmariadb-dev libmariadb-dev-compat gettext cron openssh-client flake8

RUN useradd -rms /bin/bash psycopg
RUN chmod 777 /opt /run

WORKDIR /psycopg

COPY requirements.txt /psycopg/

RUN pip install -r requirements.txt

COPY --chown=psycopg:psycopg . .
USER psycopg



