FROM drydock/u14pls:prod

ADD . /u14all

RUN /u14all/install.sh
