Yet another Docker container to run Folding at Home
===================================================
* Base image: `ubuntu:16.04`
* Folding at home: `beta` version
* `config.xml`: could be set at runtime
* Requirement: `docker-compose`

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

Note
====
When use `make down` or `docker-compose down` the volume
`dockerfah_fahclient` (default volume name), will not be attached to any *running* docker. If you run `docker volume
prune`, the current work of Folding @Home in that volume will be removed as a result of removing that volume.


TODO
====
* Add GPU support `{NVIDIA, AMD}`

__author__: *tuan t. pham*
