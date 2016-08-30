FROM maven:3.3.9-jdk-8

MAINTAINER Filipe Bento <fbento@ebsco.com>

RUN mkdir -p /code

WORKDIR /code

RUN git clone --depth 1 --single-branch https://github.com/folio-org/okapi.git /code 

RUN mvn install

EXPOSE 9130
EXPOSE 9131
EXPOSE 9132
EXPOSE 9133
EXPOSE 9134

CMD ["mvn", "exec:exec"]
