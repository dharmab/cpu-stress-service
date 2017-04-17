FROM python:3.6-alpine

RUN apk update && apk add g++ libffi-dev openssl-dev

WORKDIR /app/

ADD requirements.txt /app/
RUN pip install -r requirements.txt

ADD *.py /app/

EXPOSE 5000
CMD gunicorn -b 0.0.0.0:5000 --access-logfile - cpu_stress:app
