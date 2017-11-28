FROM hashicorp/terraform:0.10.8

RUN apk update
RUN apk add --update alpine-sdk \ 
    && apk add python2 \
    && apk add python2-dev \
    && apk add nodejs \
    && apk add jq \
    && apk add openntpd \
    && apk add bash \
    && apk add findutils \ 
    && apk add coreutils \
    && apk add openssl \
    && apk add openssl-dev \
    && apk add libffi \
    && apk add libffi-dev \
    && apk add py2-pip \
    && pip install pip \
    && apk add py2-jinja2 \
    && apk add py2-yaml

RUN rm -rf /var/cache/apk/*

RUN curl -L https://aka.ms/InstallAzureCli

WORKDIR /terraform

ENTRYPOINT ["/bin/sh"]
