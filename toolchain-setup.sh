#!/bin/bash

. ./build-common.sh

JS_OF_OCAML_DIR=~/external/js_of_ocaml

JSCOQ_DEPS="ocamlfind camlp4 camlp5 base64 cppo ppx_tools higlo ocp-indent tyxml js_of_ocaml reactiveData yojson"

do_setup() {
  opam install -y -j $NJOBS $JSCOQ_DEPS
  pushd $JS_OF_OCAML_DIR
  make clean && make -j $NJOBS && make uninstall install
  popd
}

opam switch -j $NJOBS -y $OCAML_VER
eval `opam config env`
do_setup

opam switch -j $NJOBS -y $OCAML_VER+32bit
eval `opam config env`
do_setup

