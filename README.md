#  Set up enviroment docker for cakephp
----
## Requiments:
Docker-CE
## Install:
- Go to project and run command:
    `mkdir env`
- Dowload and unarchive to folder `env` from [releases page](https://github.com/Veigarcat/Cakephp-setup/releases)
- Build
    `docker build　-t env:latest . && sh docker-launch.sh` 