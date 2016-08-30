FROM maven:3.3.9-jdk-8

MAINTAINER Filipe Bento <fbento@ebsco.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update --quiet > /dev/null && \
  apt-get install --assume-yes --force-yes -qq \
  git  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir -p /code

WORKDIR /code

RUN git clone --depth 1 --single-branch https://github.com/folio-org/okapi.git /code 

EXPOSE 9130
EXPOSE 9131
EXPOSE 9132
EXPOSE 9133
EXPOSE 9134

CMD ["mvn", "install"]
