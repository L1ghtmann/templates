#!/bin/sh

# For each directory containing one or more valid NIC templates' source
templateDirs=$(find . -type d -name NIC -exec dirname {} \; | xargs -n1 dirname | sort -u)
for d in $templateDirs; do
	pushd $d &> /dev/null
	# For each valid NIC template source
	templateSubDirs=$(find . -type d -name NIC -exec dirname {} \;)
	for f in $templateSubDirs; do
		# Build the template
		nicify.pl $f
	done
	popd &> /dev/null
done
