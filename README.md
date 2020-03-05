## jrnl docker

The image builds with jrnl v1.9.8. I'll probably upgrade this to `jrnl>=v2.0.0` soon.

## Setup

```
git clone https://github.com/7d9a/jrnl-docker
docker build -t jrnl:1.9.8-buster jrnl-docker/
```

#### Alias docker

Put this snippet into your bashrc or zshrc, or the equivalent of whatever shell you use.

```
alias jrnl='docker run -it \
            -v /path/to/jrnl-docker:/jrnl \
            -v /path/to/jrnl-docker/config:/root \
            jrnl:1.9.8-buster \
            jrnl'
```

#### Stage your jrnl files

`jrnl-docker/stage` is mounted to the container. Therefore, you should put journals in `jrnl-docker/stage/`. So if you have a `journal.txt`, do something like:

`jrnl-docker/stage/journal.txt`

or

`jrnl-docker/stage/default/journal.txt`

#### Copy jrnl config

(Skip this if you don't have a .jrnl_config)

`cp $path-to-jrnl-config path/to/jrnl-docker/config/.jrnl_config`

If you store `.jrnl_config` outside of `jrnl-docker/config/`, you'll have to copy it over on each change.

Make sure the paths in your `.jrnl_config` are something like `/jrnl/stage/...`. Paths to journals are in the container, not the host. However, the host's `jrnl-docker/stage` is mounted to the containers `/jrnl/stage`.


## Usage

Write stuff

`jrnl 'an entry @sometag'`

Find stuff

`jrnl @sometag`

For more jrnl 1.9.8 usage, see [here](https://pypi.org/project/jrnl/1.9.8/).

If you want to get into the container.

`docker run -it -v $(pwd):/jrnl -v $(pwd)/config:/root jrnl:1.9.8-buster /bin/bash`
