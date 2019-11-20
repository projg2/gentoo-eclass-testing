#!/bin/bash

set -e

failed=0

for x in *.sh; do
	case ${x} in
		*benchmark*)
			continue
			;;
		tests-common.sh|run-tests.sh)
			continue
			;;
	esac

	echo ">>> ${x}"
	"./${x}" || : $(( failed++ ))
done

if [[ ${failed} -gt 0 ]]; then
	echo "${failed} tests failed" >&2
	exit 1
fi
