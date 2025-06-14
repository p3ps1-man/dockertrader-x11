# Metatrader 5 docker image running locally using X11 server [![](https://img.shields.io/docker/pulls/p3ps1man/dockertrader-x11)](https://hub.docker.com/r/p3ps1man/dockertrader-x11)

This project enables you to run MetaTrader 5 with x11 forwarding i got the inspiration from [MetaTrader5-Docker-Image](https://github.com/gmag11/MetaTrader5-Docker-Image). Purpose for this project is to have ability to use Metatrader 5 as service for local development. Project is made for linux although you can make it work with windows or macos with software that supports x11 forwarding. When you run the docker container new window will pop up with the program running so you can mount for example project to Experts or config to profiles.
Base image for this project is [dockertrader](https://github.com/p3ps1-man/dockertrader)

![](/screenshots/program.png)

## Features

- Run MetaTrader 5 in an isolated enviroment
- Mount your seperate project chart config for you project
- Mount your project dir so it runs on a seperate instance
- Portable MetaTrader 5 where you can load your project specific config

## Requirements

- Docker installed on your machine.
- x86_64 cpu

## Usage

1. Enable access to X server:
```bash
xhost +local:
```

2. Clone repository:
```bash
git clone https://github.com/p3ps1-man/dockertrader-x11.git
cd dockertrader
```


3. Build the Docker image:
```bash
docker build -t mt5 .
```
Or just pull the image from dockerhub
```bash
docker pull p3ps1man/dockertrader-x11
```

4. Run the Docker image:
```bash
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix p3ps1man/dockertrader-x11
```

5. Or you can use something like this with docker-compose.yaml (you can mount your project, chart templates, configs, etc) check out project docker-compose.yaml:
```bash
services:
  metatrader:
    image: p3ps1man/dockertrader-x11
    container_name: mt5
    environment:
      - DISPLAY=${DISPLAY:-:0}
    volumes:
      - /tmp/.X11-unix:/tmp/.X11-unix
      - ./templates/:/home/mt5/program/MQL5/Profiles/Templates/
      - ./project/:/home/mt5/program/MQL5/Experts/
```

## Notice

Default user is mt5 and installation path is program directory inside its home directory ```/home/mt5/program``` from there you can access ```MQL5/Experts``` or other directories you need. Permissions are preconfigured for mt5 user with GID:1000 and UID:1000.


