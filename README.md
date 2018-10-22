# become-yukarin-docker

## NVIDIA-Docker image for become-yukarin-docker with gpu computing with Python 3.6.6

####  Warning!! This Dockerfile use auto installation
- This distoribution made at 2018.10.22
- If you build from Dockerfile, the versions will be change.

## Installed distribution, tool & package versions

- OS: Ubuntu 16.04.5 LTS (Xenial Xerus)
- CUDA: 9.0.176
- cudnn: 7.3.1
- pyenv 1.2.7
- Python: 3.6.6
- pip: 10.0.1
- Anaconda 4.5.11
- tensorflow: 1.11.0
- tensorflow-gpu: 1.11.0
- keras-gpu: 2.2.4
- cupy-cuda90(cupy alternative): 4.5.0
- chaienr: 4.5.0
- jupyter notebook: 4.4.0

## Development host Envirinmenet (For info, it's not prerequrests)

- OS: Ubuntu 18.04.1 LTS (Bionic Beaver)
- NVIDIA Driver: 410.48
- CUDA: 9.0.176
- Docker: 18.06.1
- NVIDIA-Docker: 2.0.3
- GNU Make: 4.1
- Git: 2.17.1

## How to use (with Makefile)


#### If you see this README from outside GitHub, see here https://github.com/YUzushio/become-yukarin-docker

### Clone source

`git clone https://github.com/YUzushio/become-yukarin-docker`

### Go to directory

`cd become-yukarin-docker`

### Build

`make build`

### Run

Default: run /bin/bash in container

`make run`

### Chainer GPU test

1. Run into contaienr

  `make run`

2. Go to workspace

  `cd /workspace`

3. run Chainer GPU test

  `python chinergputest.py`

4. Exit

  `exit`

### Get become-yukarin source into container

####  Before clone, you should visit repository and read README on GitHub  https://github.com/Hiroshiba/become-yukarin

1. (On host machine) Go to files

    `cd files`

2. Clone source

  `git clone https://github.com/Hiroshiba/become-yukarin`

3. Go to above directory

  `cd ../`

4. Run into contaienr

  `make run`

5. Go to workspace

  `cd workspace`

6. Run jupyter notebook

    #### Waning!! Jupyter use port 80

  `./jupyter.sh`

7. Visit your workspace from jupyter notebook page with browser

  http://localhost:80
