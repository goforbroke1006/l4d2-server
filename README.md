# l4d2-server

### Usage

```shell
docker run --rm -it \
  -p 27015:27015/tcp \
  -p 27015:27015/udp \
  -e L4D2_SERVER_HOSTNAME="L4D2 server in docker-compose" \
  -e L4D2_SERVER_PASSWORD="123456" \
  -e L4D2_SERVER_MAX_PLAYERS=16 \
  --name l4d2 \
  goforbroke1006/l4d2-server:latest
```
