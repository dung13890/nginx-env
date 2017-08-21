# nginx-env
### Environment nginx docker for PHP

  * Based on the latest official nginx image
  * User php-fpm & fastcgi

### Required
  * docker
  * docker-compose

### Install

> Coppy `file docker-compomse.yml` to your project
> In `docker-compose.yml` file, I use params that config `server name`, `domain`, `root` for different projects and you can to change that fit for your project

```sh
command: /bin/bash -c "/serve.sh 127.0.0.1 laravel.app /var/www/app && nginx"

```
* `127.0.0.1` is server name. In microservice project maybe is workspace, php-code, bla, bla...
* `laravel.app` is my local domain
* `/var/www/app` root for project in docker

### Running

```sh
$ docker-compose up -d
```
