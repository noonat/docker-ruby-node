# Ruby + Node Docker Image

This image can be used as a base image for Dockerfiles that require both
Ruby and Node. A Dockerfile building upon this image might look like this:

```dockerfile
FROM noonat/ruby-node

COPY Gemfile /opt/src/Gemfile
COPY Gemfile.lock /opt/src/Gemfile.lock
COPY package.json /opt/src/package.json

WORKDIR /opt/src
RUN bundle install && \
    npm install
```

Ruby 2.5.1 (and bundler) are installed via [rbenv] and [ruby-build]. I've also
included the [rbenv-gem-rehash] plugin..

Node 8.11.2 is installed via [nodenv] and [node-build]. If you `npm install -g`,
be sure to `RUN nodenv rehash` to create shims for any scripts installed by NPM.

## Why build from source?

I wanted to have more control over what version of Ruby or Node are installed
for different apps. Building from source seemed like an easier way to do that,
instead of trying to track down apt packages for the correct versions.

## Want different versions?

If you require a different version of Ruby or Node, you may want to check out
[noonat/rbenv-nodenv].

[rbenv]: https://github.com/sstephenson/rbenv
[ruby-build]: https://github.com/sstephenson/ruby-build
[rbenv-gem-rehash]: https://github.com/sstephenson/rbenv-gem-rehash
[nodenv]: https://github.com/OiNutter/nodenv
[node-build]: https://github.com/OiNutter/node-build
[noonat/rbenv-nodenv]: https://registry.hub.docker.com/u/noonat/rbenv-nodenv
