# Set up environment for framework php
> Environment for framework php such as laravel, cakephp, ... using docker with nginx, mysql

## Requirement

- install Docker-CE
- put your project into `htdocs` folder
- if you use laravel framework, please remove `cake.conf` file or else remove `laravel.conf`. And then rename to `server.conf`
- I used this environment for cakephp and laravel, so can have error if use other framework. You can edit line 'root' and 'index' of file in `conf.d` folder or contact me.

## build

```
docker-compose build
```

## run

```
docker-compose up -d
```

## Access to web

```
http://localhost
```

## access to phpMyAdmin

```
http://localhost:8080
```
