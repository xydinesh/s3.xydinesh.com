FROM debian:stretch-slim
RUN mkdir -p /usr/share/man/man1
RUN apt-get update && apt-get install -y ruby-full build-essential \
	zlib1g-dev openjdk-8-jre-headless
RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
RUN echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
RUN gem install s3_website \
&& gem install bundle \
&& gem install jekyll bundler 
RUN /usr/local/bin/s3_website install
EXPOSE 4000
WORKDIR /data
ENTRYPOINT ["jekyll", "serve"]
