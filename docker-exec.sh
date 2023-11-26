#!/bin/bash
set -eu -o pipefail

docker compose up -d
docker exec -it app-node /bin/bash
