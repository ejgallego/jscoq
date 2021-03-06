# jsCoq Docker build

The Dockerfile and accompanying Makefile in this directory can be used for
reproducible builds of jsCoq and the so-called "affiliated" addons
(the ones in https://github.com/jscoq/addons).

The build procedure is split into several phases.

|         |                                                             |
|---------|-------------------------------------------------------------|
| opam    | Prepares a base container with required packages from `apt`, a suitable version of OPAM, and an OPAM switch named `jscoq+32bit`. |
| jscoq:prereq | Clones the jsCoq repository and runs `etc/toolchain-setup.sh`. |
| jscoq        | Builds jsCoq and prepares distribution tarballs.               |
| jscoq:addons | Clones the addons repository and builds them against the exact version of jsCoq from the previous phase; builds NPM packages for these addons.  |
| jscoq:sdk    | (WIP) Builds a Docker image with Coq binaries suitable for building user addons on top of jsCoq.  |

*Note.* By default, only publicly available packages are built during the jscoq:addons phase.
To build private repositories (currently, only [sfdev](https://github.com/DeepSpec/sfdev)), create a directory named `_ssh` and copy your SSH keys (usually stored in `~/.ssh`) into it.

## Building

To run the build, you only need the contents of this subdirectory (`etc/docker`).
All other sources and dependencies are cloned or fetched from remote package repositories.
To run the complete staged build:
```
make
```

The images are tagged and stored in your Docker. To remove old builds, run `make clean` or `make clean-slate` (the former keeps opam and jscoq:prereq, whereas the latter purges them as well).
It is recommended to run `docker system prune` to clean up any dangling containers.

To extract the built tarballs from the Docker container:
```
make dist
```

This creates a subdirectory `dist/` and copies the tarballs generated by the jscoq and jscoq:addons phases.