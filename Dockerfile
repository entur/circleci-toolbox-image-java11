FROM maven:3.6.0-jdk-11

# Using the same tools for installing in the docker image and for creating this very image
COPY tools /tools
RUN chmod u+x /tools/*sh

# Install gcloud
RUN /tools/gcloud_install.sh
ENV PATH="/google-cloud-sdk/bin:${PATH}"

# Install docker client
RUN /tools/docker_install.sh

# Install xmlstarlet from apt
RUN apt-get -y update && apt-get -y install xmlstarlet

# Install node using apt
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    nodejs -v

# Install jest because of some node apps assumes that this is available
RUN npm install jest -g && \
    jest -v

# Install libpng-dev
RUN apt-get install -y libpng-dev

# Install build essential, required for some native node addons
RUN apt-get install -y build-essential

# Install xmllint
RUN apt-get install -y libxml2-utils

# Install ruby2.3.1 jekyll
RUN apt-get install -y ruby-full

# Install jekyll
RUN gem install jekyll bundler \
 && gem install jekyll-asciidoc

# Install graphdoc
RUN  npm install -g @2fd/graphdoc@2.4.0 \
 && npm install -g graphql-docs@0.2.0

 # Install helm
 curl -L https://git.io/get_helm.sh | bash

