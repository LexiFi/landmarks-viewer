#!/bin/bash

dune build @install
rm -rf out/
mkdir out
cp _build/install/default/lib/landmarks-viewer/landmarks_viewer.* out/
sed -i -e 's/caml_ojs_wrap_fun_arguments:caml_ojs_wrap_fun_arguments,/caml_highres_clock:(n) => { console.log("tried to call the highres clock"); },\n     caml_ojs_wrap_fun_arguments:caml_ojs_wrap_fun_arguments,/' out/landmarks_viewer.js
