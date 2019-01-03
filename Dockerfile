FROM ruby:2.3.8-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache alpine-sdk wget nodejs libressl pkgconf openssl openssl-dev linux-headers tzdata 

RUN wget ftp://ftp.freetds.org/pub/freetds/stable/freetds-1.00.99.tar.gz && tar -xzf freetds-1.00.99.tar.gz
WORKDIR freetds-1.00.99
RUN ./configure --prefix=/usr/local --with-tdsver=7.3 --with-openssl=/usr/bin && make && make install

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .
EXPOSE 3000 1433 80
CMD rails server -b 0.0.0.0 -P /tmp/puma.pid 
