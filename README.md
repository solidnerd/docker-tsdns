[![](https://images.microbadger.com/badges/image/solidnerd/tsdns.svg)](http://microbadger.com/images/solidnerd/tsdns "Get your own image badge on microbadger.com")

docker-tsdns
============

A TSDNS server in a container. This image should help to setup a TSDNS server for teamspeak servers.

# Current Version: [3.0.13.6](https://github.com/SolidNerd/docker-tsdns/blob/master/Dockerfile)

# Getting Started

1. Copy the `tsdns_settings.ini.sample` to add your host with
```
docker run --rm --entrypoint="/bin/sh" solidnerd/tsdns:3.0.13.6 -c "cat tsdns_settings.ini.sample" > tsdns_settings.ini
```
2. Add your entries in `tsdns_settings.ini`
```
public.teamspeak.com=12.13.14.15:10000
```

3. Start the container
```
docker run -d -p 41144:41144 -v tsdns_settings.ini:/tsdns/tsdns_settings.ini:ro --name tsdns solidnerd/tsdns:3.0.13.6
```

# Update TSDNS Entries
Edit your file on your Host.
After this restart your container with:
```
docker restart  tsdns
```
Now the TSDNS resolves your entries.

# LICENSE
[MIT](https://github.com/SolidNerd/docker-tsdns/blob/master/LICENSE)
