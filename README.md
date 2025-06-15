# Docker redirect

Redirect incoming URLs to another protocol, host and path.
Protocol and path are optional.

I created this container for Telegram, so I can use http links in my Telegram message to deeplink to apps.
Telegram doesn't create clickable links (it also doesn't work with Markdown links) when the protocol isn't a website.

I need a way to redirect to a Home Assistant dashboard link `http://redirect.local:8888/dashboard-mobile/my-subview` 
in the companion app. The link should be `homeassistant://navigate/dashboard-mobile/my-subview`.

Run the container from the example:
```
$ docker run --rm -d -e REDIRECT_URL=homeassistant://navigate $PORT=8888 -p 8888:8888 .
```

You can find [here](docker-compose.yaml) the docker-compose.yml file for this example.

More details about deep linking in Home Assistant can be found here: https://companion.home-assistant.io/docs/integrations/url-handler/

```bash
mkdir redirect
cd redirect
wget https://raw.githubusercontent.com/vdbrink/docker_redirect/refs/heads/main/Dockerfile
wget https://raw.githubusercontent.com/vdbrink/docker_redirect/refs/heads/main/start.sh
docker build -t vdbrink/redirect .
```

This is the `docker-compose.yml` file:

```yaml
version: '3'
services:
  redirect:
    container_name: redirect
    image: vdbrink/redirect
    ports:
      - "8888:8888"
    environment:
      - REDIRECT_URL=homeassistant://navigate
      - PORT=8888
```

```bash
docker-compose up -d redirect
```

When you now access the host where this docker container is running on port 8888.
For example, the url `http://dockerserver.local:8888/dashboard-mobile/my-subview` it will now redirect you to the Home Assistant companion app.