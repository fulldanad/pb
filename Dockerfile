FROM ruby:2.2.5
RUN mkdir -p /var/www/stanpb
WORKDIR /var/www/stanpb
RUN apt-get -y update
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
RUN apt-get install -y mysql-server
RUN apt-get install -y mysql-client
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y git
RUN apt-get install -y apt-transport-https
RUN apt-get install -y lsb-release
RUN apt-get install -y curl
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN sh -c "echo 'deb https://deb.nodesource.com/node $(lsb_release -sc) main' > /etc/apt/sources.list.d/nodesource.list"
RUN sh -c "echo 'deb-src https://deb.nodesource.com/node $(lsb_release -sc) main' >> /etc/apt/sources.list.d/nodesource.list"
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get upgrade
RUN git clone https://github.com/StanfordCDT/pb
RUN mv pb/config/database.yml.example pb/config/database.yml
CMD "pb/bin/setup"
