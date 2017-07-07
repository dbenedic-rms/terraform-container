FROM hashicorp/terraform:0.9.8

RUN apk update
RUN apk add --update alpine-sdk && apk add --update python && apk add --update nodejs && apk add --update jq && apk add --update openntpd && apk add --update bash && apk add --update findutils && apk add --update coreutils
RUN rm -rf /var/cache/apk/*

RUN npm install -g azure-cli && azure telemetry --disable

WORKDIR /terraform

ENTRYPOINT ["/bin/sh"]
