FROM gentoo/portage:latest AS repo
FROM gentoo/stage3-amd64:latest
COPY --from=repo /var/db/repos/gentoo/eclass /var/db/repos/gentoo/eclass
WORKDIR /var/db/repos/gentoo/eclass/tests
COPY . /var/db/repos/gentoo/eclass/tests
RUN ["./run-tests.sh"]
