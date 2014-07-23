FROM jpetazzo/dind

RUN apt-get install -y openssh-server supervisor ruby sudo
RUN gem install small-ops 

ENV APP_USER cncflora 
ENV APP_PASS cncflora

RUN useradd -g users -G www-data,sudo -s /bin/bash -m $APP_USER && \
    echo $APP_USER:$APP_PASS | chpasswd && \
    mkdir /var/run/sshd && \
    chmod 755 /var/run/sshd 

RUN mkdir -p /var/log/supervisor

ADD fig.yml /root/fig.yml
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN cd /root && fige -d && sleep 10 && docker2etcd

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]

