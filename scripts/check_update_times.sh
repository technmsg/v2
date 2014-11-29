#!/bin/sh
#
#  Check that altered source files have been marked as such.
#

#  Set to whatever TZ you're using in source.
export TZ="America/New_York"

FILE=$1

# 2014-11-29T16:31:00-0500
M_RECORDED=$(grep '<!-- updated:' $FILE | sed -e 's/^.*: //' | sed -e 's/ -->$//')

# 2014-11-29 16:54:19-0500
M_ACTUAL=$(stat -c %y ${FILE} | sed -e 's/\.0* //')

# strip all but the date
MD_RECORDED=$(echo $M_RECORDED | sed -e 's/T.*//')
MD_ACTUAL=$(echo $M_ACTUAL | sed -e 's/\s.*$//');

# warn if recorded and actual modification times differ
if [ $MD_RECORDED != $MD_ACTUAL ] ; then
  echo "$FILE - modification date mismatch"
  echo "  file: $MD_RECORDED ($M_RECORDED)"
  echo "  disk: $MD_ACTUAL ($M_ACTUAL)"
fi

# EOF
