#!/bin/bash

echo "Replacing ENV_UNOMI_URL environment variable"
sed -i -r "s,ENV_UNOMI_URL,${UNOMI_URL},g" /usr/share/nginx/html/*.html
echo "Displaying replaced environment variables:"
grep "var unomiUrl =" /usr/share/nginx/html/*.html
