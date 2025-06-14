# Docker redirect

Redirect incoming URLs to another protocol, host and path.
Protocol and path are optional.

I created this container for Telegram, so I can use http links in my Telegram message to deeplink to apps.
Telegram doesn't create clickable links (it also doesn't work with Markdown links) when the protocol isn't a website.

I need a way to redirect to a Home Assistant dashboard link `http://redirect.local:8888/dashboard-mobile/my-subview` 
in the companion app. The link should be `homeassistant://navigate/dashboard-mobile/my-subview`.

Run the container from the example:
```
$ docker run --rm -d -e REDIRECT_URL=homeassistant://navigate/ $PORT=8888 -p 8888:8888 https://raw.githubusercontent.com/vdbrink/docker_redirect/refs/heads/main/Dockerfile
```

More details about deep linking in Home Assistant can be found here: https://companion.home-assistant.io/docs/integrations/url-handler/
