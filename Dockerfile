FROM ubuntu:latest

RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/

COPY ./Scripts/ReverseNumber.sh /usr/src/app/

CMD ["/bin/bash", "ReverseNumber.sh", "-1586944778"]


