Yet another Docker container to run Folding at Home
===================================================
* Base image: `ubuntu:20.04`
* Folding at home: `beta` version
* `config.xml.tmpl`: this template is used to generate `config.xml`
* Requirement: `docker-compose`

Build docker image locally
==========================
```
# Default DOCKER_NAME=neofob/fah DOCKER_TAG=latest
make docker

# Build test image
make DOCKER_TAG=test docker
```

Run, pause, down..
==================
To spin up the `fah` docker service
```
make up
```
To pause the container
```
make pause
```

To view the current folding progress, open your browser
at [http://client.foldingathome.org/](http://client.foldingathome.org/)

Environment variables
=====================
| Variable Name | What it is |
|:-------------:|:----------:|
| `FAH_USER`    | FAH username |
| `FAH_PASSKEY`    | FAH passkey |
| `FAH_TEAM`    | FAH team id |
| `FAH_CLIENT_TYPE` | `beta`, `advanced`, `bigadv` |
| `FAH_HOST_IP` | Host IP address |

Exposed Ports
=============
* `7396`: Web GUI

Note
====
When use `make down` or `docker-compose down` the volume
`dockerfah_fahclient` (default volume name), will not be attached to any *running* docker. If you run `docker volume
prune`, the current work of Folding @Home in that volume will be removed as a result of removing that volume.


TODO
====
* Make Ansible playbook to deploy container to run all nodes in a docker swarm :=)
* Add GPU support `{NVIDIA, AMD}`; see the official [containers][0]

__author__: *tuan t. pham*

[0]: https://github.com/FoldingAtHome/containers
