FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y mongodb-server build-essential git ruby-full ruby-dev
#RUN gem install bundler
RUN gem i bundler -v 1.17.3 
#RUN gem update --system '2.7.9'
RUN git clone -b monolith https://github.com/express42/reddit.git

COPY mongod.conf /etc/mongod.conf
COPY db_config /reddit/db_config
COPY start.sh /start.sh

RUN cd /reddit && bundle install
RUN chmod 0777 /start.sh

CMD ["/start.sh"]
