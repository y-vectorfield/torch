# Build Torch RStudio with CUDA on Docker
This document is an environmental construction guide for Torch RStudio with CUDA on Docker.

## Requirements
Following requirements are expected to work on a Linux machine.
* Docker
* Docker Compose
* NVIDIA Docker 2
* CUDA arch based GPU env

## Directory structure
The directory structure of this tools as follows.

```bash
build_env_tools/
├── build_env.sh
├── cuda-101
│   ├── Dockerfile
│   └── docker-compose.yml
└── cuda-111
    ├── Dockerfile
    └── docker-compose.yml
```

## Building env
### 1. Clone repository
Just do the following command.

```bash
git clone https://github.com/mlverse/torch.git
```

### 2. Change directory
Move into `torch/docker/build_env_tools`.


```bash
cd torch/docker/build_env_tools/
```

### 3. Create `rstudio_home` directory
Create `rstudio_home` directory outside of torch directory which uses home directory of container.(just doing following command.) If you would like to use another directory as home directory, you must modify `docker-compose.yml`(`Path` strings at `volume` section).

```bash
mkdir  ../../../rstudio_home
```

### 4. Run `build_env.sh`
You just implement `build_env.sh`, and you can build a Torch RStudio container image.
* Please be careful not to forget `cuda-xxx` option.
* You can set cuda-101 or cuda-111.

```bash
./build_env.sh cuda-xxx
```

If you would like to build a container image again without using chache files, you should use `-nc` option.

```bash
./build_env.sh cuda-xxx -nc
```

#### (Option): Building Japanese env
If you would like to use Japanese version of Torch RStudio env, you should delete following comment outs in Dockerfile.(Line160 to 165)

```Dockerfile
# ENV LANG ja_JP.UTF-8
# ENV LC_ALL ja_JP.UTF-8
# RUN sed -i '$d' /etc/locale.gen && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
#   && locale-gen ja_JP.UTF-8 && /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
# RUN /bin/bash -c "source /etc/default/locale"
# RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
```

### 5. Login RStudio
Open your web browser and access `localhost:8787`.

You implement `torch` first time, additional packages which needs for it will be installed in your env. If your `GPU` is available, `cuda_is_available()` returns `True`.
