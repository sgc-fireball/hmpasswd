#!/bin/bash

cd `dirname ${0}`

/bin/rm -f hmpasswd.tar.gz
/bin/chmod +x update_script hmpasswd.sh
/bin/tar -cvvzf hmpasswd.tar.gz \
    update_script \
    hmpasswd.sh \
    mod_auth.so \
    .htpasswd \
    VERSION \
    README.md \
    LICENSE

exit $?
