FROM noonat/rbenv-nodenv
MAINTAINER Nathan Ostgard <noonat@phuce.com>

RUN rbenv install 2.2.0 && \
    CONFIGURE_OPTS="--disable-install-doc" rbenv global 2.2.0 && \
    gem install bundler

RUN nodenv install 0.10.33 && \
    nodenv global 0.10.33 && \
    nodenv rehash

CMD ["/bin/bash"]
