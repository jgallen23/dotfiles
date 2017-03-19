FROM alpine:3.5

RUN apk add --update \
  vim \
  git \
  bash

ADD vimrc /root/.vimrc
ADD . /root/.vim

WORKDIR /work
ENV TERM xterm-256color

ENTRYPOINT ["vim"]
