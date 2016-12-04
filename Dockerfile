FROM ruby:2.2.5
RUN mkdir -p /var/www/stanpb
WORKDIR /var/www/stanpb
RUN apt-get -y update
RUN apt-get install -y git
RUN apt-get install -y apt-transport-https
RUN apt-get install -y lsb-release
RUN apt-get install -y curl
RUN apt-get install -y apt-utils
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN sh -c "echo 'deb https://deb.nodesource.com/node $(lsb_release -sc) main' > /etc/apt/sources.list.d/nodesource.list"
RUN sh -c "echo 'deb-src https://deb.nodesource.com/node $(lsb_release -sc) main' >> /etc/apt/sources.list.d/nodesource.list"
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get upgrade -y
RUN git clone https://github.com/StanfordCDT/pb
RUN mv pb/config/database.yml.example pb/config/database.yml
RUN mv pb/config/secrets.yml.example pb/config/secrets.yml
RUN mkdir tmp
RUN touch tmp/restart.txt
RUN "pb/bin/setup"
RUN cd pb
EXPOSE 3000
WORKDIR /var/www/stanpb/pb
CMD rails server
