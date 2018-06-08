FROM noonat/rbenv-nodenv
MAINTAINER Nathan Ostgard <noonat@phuce.com>

ARG RUBY_VERSION=2.5.1
ARG NODE_VERSION=8.11.2
ENV RUBY_VERSION=${RUBY_VERSION} NODE_VERSION=${NODE_VERSION}

RUN rbenv install ${RUBY_VERSION} && \
    CONFIGURE_OPTS="--disable-install-doc" rbenv global ${RUBY_VERSION} && \
    gem install bundler

RUN nodenv install ${NODE_VERSION} && \
    nodenv global ${NODE_VERSION} && \
    nodenv rehash

CMD ["/bin/bash"]
