#!/bin/sh -e

# Hack on cloudstack python cli to turn of certificate verification.
# Will simplify a lot use case with self signed certificates...
if [[ "${CS_CERT}" == "NO_VERIF" ]]; then
    sed -i -e "s|verify=True, cert=None|verify=False, cert=None|g" /usr/lib/python2.7/site-packages/cs.py
fi

# Main
exec "$@"
