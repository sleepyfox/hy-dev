FROM python:3.6-alpine

RUN apk update && apk add git
RUN pip install git+https://github.com/hylang/hy.git

WORKDIR /var/app
CMD ["hy"]
