FROM drydock/u14:prod

ADD . /u14all

RUN /u14all/install.sh && rm -rf /tmp && mkdir /tmp
