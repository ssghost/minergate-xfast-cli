=======
----------------
Description
==================

This Docker Container runs the minergate-xfast-cli miner


----------------
Docker Plain Example
==================
```bash
docker run --name xmr-xfast-container -d alimuratgymn/minergate-xfast-cli:latest --user miningaddress@gmx-topmail.de --xmr
```

----------------
Docker Compose Example
==================
```bash
version: "3"
services:
  xmr-xfast-container:
    command: ['--user', 'miningaddress@gmx-topmail.de', '--xmr']
    container_name: xmr-xfast-container
    image: alimuratgymn/minergate-xfast-cli:latest_withcuda
    restart: unless-stopped
    network_mode: bridge
```
