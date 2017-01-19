FROM percona:latest

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
		wget \
		perl \
		libdbd-mysql-perl \
		libio-socket-ssl-perl \
		libterm-readkey-perl \
	&& mkdir /src \
	&& wget https://www.percona.com/get/percona-toolkit.deb -O /src/percona-toolkit.deb \
	&& dpkg -i /src/percona-toolkit.deb \
	&& apt-get purge -y --auto-remove \
		wget \
	&& rm -rf /src

CMD ["/bin/bash"]
