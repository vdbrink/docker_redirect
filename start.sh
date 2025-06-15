#!/bin/bash
if [ -z "$REDIRECT_URL" ]; then
	echo "Redirect target variable not set (REDIRECT_URL)"
	exit 1
fi

# Default to 80
LISTEN="80"
# Listen to variable PORT for alternative port number
if [ ! -z "$PORT" ]; then
	LISTEN="$PORT"
fi

cat <<EOF > /etc/nginx/conf.d/default.conf
server {
	listen ${LISTEN};
	rewrite ^/(.*)$ ${REDIRECT_URL}/$1 permanent;
}
EOF

echo "Listening to $LISTEN, Redirecting HTTP requests to ${REDIRECT_URL}"

exec nginx -g "daemon off;"