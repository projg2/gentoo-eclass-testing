#!/bin/bash

set -e

failed=()

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
	"./${x}" || failed+=( "${x}" )
done

if [[ -n ${failed[@]} ]]; then
	echo "${#failed[@]} tests failed: ${failed[*]}" >&2
	exit 1
fi
