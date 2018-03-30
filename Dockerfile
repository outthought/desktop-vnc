FROM consol/centos-xfce-vnc

USER 0
RUN yum install -y \
    icedtea-web.x86_64 \
    && yum clean all
RUN mkdir $HOME/.vnc
RUN chown -R 1000 $HOME/.vnc/
RUN echo "javaws https://ucs-sg1.mps.spscommerce.net/ucsm/ucsm.jnlp -nosecurity -noupdate" >> $HOME/.vnc/xstartup
RUN chmod +x $HOME/.vnc/xstartup

## switch back to default user
USER 1000