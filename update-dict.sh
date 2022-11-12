#!/usr/bin/env bash
# Updates the dictionary files defined in config.json.

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

CONFIG=${BASE_DIR}/config.json

for lang in $(jq -r 'keys[]' $CONFIG); do

	echo "- Generating: $lang"

	files=()
	for f in $(jq -r ".$lang | if type==\"array\" then .[] else . end" $CONFIG); do

		if [ "${f:0:1}" != "/" ]; then
			f="${BASE_DIR}/custom/$f"
		fi
		files+=( "$f" )
	done

    echo "Source files:"
    echo ${files[@]} | tr ' ' '\n'

	grep -hs ^ ${files[@]} | $BASE_DIR/generate-dict.sh > $BASE_DIR/dict/$lang
done

echo "Done"
