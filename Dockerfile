FROM gentoo/portage:latest AS repo
FROM gentoo/stage3-amd64:latest
COPY --from=repo /usr/portage/eclass /usr/portage/eclass
WORKDIR /usr/portage/eclass/tests
COPY . /usr/portage/eclass/tests
RUN ["./run-tests.sh"]
