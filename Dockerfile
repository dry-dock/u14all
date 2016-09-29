FROM drydock/u14:{{%TAG%}}

ADD . /u14all

RUN /u14all/install.sh && rm -rf /tmp && mkdir /tmp
