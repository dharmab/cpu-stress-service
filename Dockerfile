FROM python:3.6-alpine


WORKDIR /app/

ADD requirements.txt /app/
RUN apk update \
		&& apk --no-cache --virtual .build-deps add g++ libffi-dev openssl-dev \
		&& pip install -r requirements.txt \
		&& apk del .build-deps

ADD *.py /app/

EXPOSE 5000
CMD gunicorn -b 0.0.0.0:5000 --access-logfile - cpu_stress:app
