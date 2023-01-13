# Docker.PythonDev

- 이 저장소는 Python으로 개발할 수 있도록 기본적인 환경이 설정된 Docker Image를 만들 수 있도록 Dockerfile을 제공합니다.

- OpenSSH-Server, pip, nano, pipenv, tmux, git

## build docker image

- base image : [python:3.11.1](<https://hub.docker.com/layers/library/python/3.11.1/images/sha256-dcd0251df5efeb39af10af998b45d21436d85e2b9facf12a8800e34ad3d84c91?context=explore>)

```bash
docker build -t pydev:3.11.1 .
```

## Run docker container

```bash
docker run --name pydev -v ${PWD}/root:/root -it -d --rm -p 10022:22 pydev:3.11.1
```

## Run docker container with gpu

```bash
docker run --gpus all --name pydev -v ${PWD}/root:/root -it -d --rm -p 10022:22 pydev:3.11.1
```
