docker-tsdns
============

A TSDNS Server in the Docker Container

## Getting Started
1. First clone this repo
2. Build the Dockerfile ``` docker build --tag="[repoName]/tsdns" .```
3. Start the container ``` docker run -d -p 41144:41144 --name tsdns [repoName]/tsdns ```

## Add/Edit TSDNS Entries
Run a second Docker Process in the container via:
```
docker exec -it tsdns vim tsdns_settings.ini
```
This opens your tsdns_settings with vim and you can add/edit your entries.
After this restart your container with:
```
docker restart  tsdns
```
Now the TSDNS resolves your entries.

## LICENSE
[MIT](https://github.com/SolidNerd/docker-tsdns/blob/master/LICENSE)
