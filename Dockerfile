FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y jq curl build-essential git

WORKDIR /usr/local/go

RUN curl -L https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz \
| tar xz --strip-components=1

ENV PATH="${PATH}:/usr/local/go/bin:/root/go/bin"

WORKDIR /usr/local/go/src/github.com/hashicorp/terraform

RUN curl -L $(curl -s https://api.github.com/repos/hashicorp/terraform/tags \
| jq -r '.[] | select(.name=="v0.8.5") | .tarball_url') \
| tar xz --strip-components=1

RUN go get -v golang.org/x/tools/cmd/stringer

WORKDIR /terraform

CMD ["/bin/bash"]
