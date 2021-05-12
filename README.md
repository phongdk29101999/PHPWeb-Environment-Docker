#  Set up enviroment docker for cakephp
----
## Requiments:
Docker-CE
## Build:
- Go to project and run command:
    ```
    $ mkdir env && cd env
    ```
- Download and unarchive to folder `env` from [releases page](https://github.com/phongdk29101999/Set-up-environment-cakephp/releases/tag/2.0)
- Run command:
    ```
    $ docker build　-t env:latest . && sh docker-launch.sh
    ```
## Access to web app
    ```
    http://localhost
    https://localhost
    ```
## Connect to mysql with port `3306`
