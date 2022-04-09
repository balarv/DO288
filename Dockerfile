FROM registry.access.redhat.com/ubi8/ubi:8.0
Maintainer rvbala
ENV DOCROOT=/var/www/html
RUN yum install -y --nodocs --disableplugin=subscription-manager httpd && \
    yum clean all --disableplugin=subscription-manager -y
ONBUILD COPY src/ ${DOCROOT}/
EXPOSE 80
RUN rm -rf /run/httpd && mkdir /run/httpd
USER root
CMD /usr/sbin/httpd -DFOREGROUND
