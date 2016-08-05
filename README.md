docker-tsdns
============

A TSDNS server in a docker container.

## Current Version: [3.0.11.3](https://github.com/SolidNerd/docker-tsdns/blob/master/Dockerfile)

## Getting Started
1. First clone this repo or pull it from the registry.
2. Build the Dockerfile ``` docker build --tag="[repoName]/tsdns" .```
3. Start the container ``` docker run -d -p 41144:41144 -v tsdns_settings_ini_path:/opt/tsdns/tsdns_settings.ini --name tsdns [repoName]/tsdns ```

```[repoName]``` replace it with your favourite repository name.
```tsdns_settings_ini_path```replace it with your hosts tsdns settings file

## Add/Edit TSDNS Entries
Edit your file on your Host.
After this restart your container with:
```
docker restart  tsdns
```
Now the TSDNS resolves your entries.

## LICENSE
[MIT](https://github.com/SolidNerd/docker-tsdns/blob/master/LICENSE)
