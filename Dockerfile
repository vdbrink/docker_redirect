FROM nginx:1.27-alpine

COPY start.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/start.sh
RUN apk add --no-cache bash

EXPOSE 80

CMD ["start.sh"]