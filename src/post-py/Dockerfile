FROM python:3.6.0-alpine

WORKDIR /app
COPY . /app

RUN apk update \
    && apk add --no-cache --virtual .build-deps gcc python3-dev musl-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del --no-cache --purge .build-deps \
    && rm -rf /var/cache/apk/*

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

ENTRYPOINT ["python3", "post_app.py"]
