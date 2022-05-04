FROM python:3.8-slim

ENV PYTHONUNBUFFERED 1


RUN apt-get update && apt-get install -y --no-install-recommends gcc \
 && pip install pandas==1.2.5 \
 && pip install joblib==0.16.0


COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser user
USER user