FROM hashicorp/terraform:0.9.11

RUN apk update
RUN apk add --update alpine-sdk \ 
    && apk add --update python2 \
    && apk add --update python2-dev \
    && apk add --update nodejs \
    && apk add --update jq \
    && apk add --update openntpd \
    && apk add --update bash \
    && apk add --update findutils \ 
    && apk add --update coreutils \
    && apk add --update openssl \
    && apk add --update openssl-dev \
    && apk add --update libffi \
    && apk add --update libffi-dev \
    && apk add --update py2-pip \
    && pip install --update pip \
    && apk add --update py2-jinja2 \
    && apk add --update py2-yaml

RUN rm -rf /var/cache/apk/*

RUN curl -L https://aka.ms/InstallAzureCli

WORKDIR /terraform

ENTRYPOINT ["/bin/sh"]
