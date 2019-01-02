FROM alpine:latest
RUN apk update && apk upgrade && apk --update add \
    ruby bash ca-certificates openjdk7-jre libatomic readline readline-dev libxml2 libxml2-dev \
        ncurses-terminfo-base ncurses-terminfo \
        libxslt libxslt-dev zlib-dev zlib \
        ruby ruby-dev yaml yaml-dev \
        libffi-dev build-base git nodejs openjdk8-jre \
        ruby-io-console ruby-irb ruby-json ruby-rake \
    &&  echo 'gem: --no-document' > /etc/gemrc
RUN gem install s3_website \
&& gem install --no-document redcarpet kramdown maruku rdiscount RedCloth liquid pygments.rb \
 && gem install --no-document sass safe_yaml \
 && gem install --no-document jekyll -v 2.5 \
 && gem install --no-document jekyll-paginate jekyll-sass-converter \
 && gem install --no-document jekyll-sitemap jekyll-feed jekyll-redirect-from \
 && rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
 && apk del build-base zlib-dev ruby-dev readline-dev \
            yaml-dev libffi-dev libxml2-dev \
 && apk search --update

RUN /usr/bin/s3_website install
EXPOSE 4000

WORKDIR /data
