FROM debian:jessie
MAINTAINER Shigeyuki Takeuchi

ENV TERRAFORM_VERSION=0.6.3

RUN apt-get update \
	&& apt-get install -y unzip curl \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /tmp/terraform \
    && cd /tmp/terraform \
    && curl -L https://dl.bintray.com/mitchellh/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > \
      terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform* /usr/local/bin/ \
    && rm -rf /tmp/terraform \
    && apt-get purge -y --auto-remove unzip curl
	
VOLUME ["/terraform"]
WORKDIR /terraform

CMD ["/usr/local/bin/terraform", "--version"]