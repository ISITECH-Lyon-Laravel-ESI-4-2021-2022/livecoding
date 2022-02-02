FROM sail-8.1/app

ARG GITHUB_TOKEN

COPY . /var/www/html

RUN chmod -R 777 storage bootstrap/cache

RUN composer config github-oauth.github.com ${GITHUB_TOKEN}
RUN composer install -q --no-ansi --no-interaction --no-scripts --no-progress --prefer-dist
RUN npm ci || npm install

RUN npm run prod

COPY ./docker/8.1/start-container-kube /usr/local/bin/start-container-kube
RUN chmod +x /usr/local/bin/start-container-kube

ENTRYPOINT ["start-container-kube"]
