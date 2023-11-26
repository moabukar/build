FROM		ruby:2.3.0-slim
MAINTAINER	Mo Abukar <moabukar9@gmail.com>

RUN		apt-get update		&&	\
		apt-get install -y		\
		make				\
		gcc				\
		patch				\
		libpq-dev			\
		libcrypto++-dev			\
		libssl-dev			\
		libxml2-dev		&&	\
		apt-get clean

WORKDIR		/opt/build
RUN		mkdir -p /opt/build
COPY		src/build/Gemfile src/build/Gemfile.lock /opt/build/

RUN		ruby -S bundle install

