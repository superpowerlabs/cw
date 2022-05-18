#!/usr/bin/env bash

docker stop bp-altermafia-com
docker rm bp-altermafia-com
#
docker run -d \
  --name bp-altermafia-com \
  -p 8360 \
  --restart unless-stopped \
  -v $PWD:/usr/src/app \
  -e NODE_ENV=production \
  -e VIRTUAL_HOST=bp.altermafia.com.local \
  -e LETSENCRYPT_HOST=bp.altermafia.com \
  -e LETSENCRYPT_EMAIL=altermafia@sullo.co \
  -w /usr/src/app node:16 npm run start

#!/usr/bin/env bash

docker run -it --rm \
  --name bp-altermafia-com \
  -p 8360 \
  -v $PWD:/usr/src/app \
  -e NODE_ENV=development \
  -e VIRTUAL_HOST=bp.altermafia.com.local \
  -w /usr/src/app node:16 npm run start
