FROM httpd:2.4.49-buster

COPY exploitable-httpd.conf /usr/local/apache2/conf/httpd.conf
