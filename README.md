[![Build Image & Push to Dockerhub](https://github.com/MohamedElashri/Jupyter-ROOT/actions/workflows/docker_build.yml/badge.svg)](https://github.com/MohamedElashri/Jupyter-ROOT/actions/workflows/docker_build.yml)

# Jupyter-ROOT
Docker image for ROOT CERN analysis tool within Jupyter notebook on CentOS 7


## Usage

To use already built image available on [Docker hub](https://hub.docker.com/repository/docker/melashri/jupyter-root) you can run the following: 

```
export PORT=<you desired open port>
sudo docker run -p $PORT:8080 -v $PWD:/work melashri/jupyter-root
```

This will spin a container on port value of your choice and will mount `$PWD:/work` folder to the container volume. 

## Build
To build this version on your machine you can do the following

1. clone this repository

```
git clone https://github.com/MohamedElashri/Jupyter-ROOT
```

2. move to the directory

```
cd Jupyter-ROOT
```

3. run the docker build 

```
docker build -t melashri/Jupyter-ROOT .

```

hint: Don't forget to add the `.` at the end of last command, it tells docker that `Dockerfile` is in the root directory where you are currently at. 



