# Rails server

## Development Environment
* Redis
* Sidekiq
* Ruby version: 2.5.1
* Rails version: 5.2.1
* Mysql version: 5.7

## Use docker for development

- Install docker CE: https://docs.docker.com/install/linux/docker-ce/ubuntu/
- First time installation:

    - Build Containers: `docker-compose build` 
    - Start Services: `docker-compose run -d spring (or mysql, redis)`

- Make sure that all background container started successfully, run `docker ps` to check that.
- All rails commands can be run with `docker exec -it spring *command*`. For example, `docker exec -it spring rails c`.
- The idea is use spring to load all components beforehand, so that one can run those commands without being slowdown when starting docker.
Further speed up can be archived by installing spring locally and run command as `spring rails c`

**Note**:

- The folder `.data_backup` will be created to hold data for `mysql` container so that database will be persistent even when removing docker containers. 
This folder will be created with root user inside docker container, so you may need to use `sudo` if you want to change the files directly or you can change its permission to 777 for ease of use. **DO NOT DO THIS IN PRODUCTION**.
- After changing `Gemfile`, it is necessary to rebuild docker containers

