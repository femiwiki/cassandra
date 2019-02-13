FROM cassandra:3

COPY run /usr/local/bin/
CMD ["/usr/local/bin/run"]
