FROM gentoo/stage3-amd64:latest
WORKDIR /var/db/repos/gentoo
RUN ["wget", "--progress=dot:mega", "https://github.com/gentoo/gentoo/archive/master.tar.gz"]
RUN ["tar", "-xf", "master.tar.gz", "--strip-components=1", "gentoo-master/eclass"]
WORKDIR /var/db/repos/gentoo/eclass/tests
COPY . /var/db/repos/gentoo/eclass/tests
RUN ["./run-tests.sh"]
