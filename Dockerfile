FROM oraclelinux:8
USER root
RUN dnf -y install oracle-instantclient-release-el8 gcc  
RUN dnf -y install oracle-instantclient-basic oracle-instantclient-devel oracle-instantclient-jdbc oracle-instantclient-sqlplus perl
RUN dnf -y install perl-DBI perl-DBD-Pg perl-ExtUtils-MakeMaker
RUN perl -MCPAN -e 'install DBD::Oracle'
RUN mkdir -p /opt/ora2pg
COPY ./doc /opt/ora2pg/doc
COPY ./lib /opt/ora2pg/lib
COPY ./packaging /opt/ora2pg/packaging
COPY ./scripts /opt/ora2pg/scripts
COPY ./scripts /opt/ora2pg/scripts
COPY ./Makefile.PL /opt/ora2pg/Makefile.PL
COPY ./changelog /opt/ora2pg/changelog
COPY ./MANIFEST /opt/ora2pg/MANIFEST
COPY ./README /opt/ora2pg/README
COPY ./INSTALL /opt/ora2pg/INSTALL
COPY ./LICENSE /opt/ora2pg/LICENSE
WORKDIR /opt/ora2pg/
RUN perl Makefile.PL && make && make install

