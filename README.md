Landmarks-viewer: A web front-end for landmarks library 
=======================================================

[*Landmarks*](https://github.com/LexiFi/landmarks) is a simple profiling 
library for OCaml. The *landmarks-viewer* is a simple web-application that
allows to browser the result of a profiling session using the *landmarks* 
library.

Installation
------------

0. Pin the master branch of gen_js_api: 
```
git clone https://github.com/LexiFi/gen_js_api.git
opam pin gen_js_api gen_js_api
```
1. Build by running `dune build --profile release` inside the landmarks-viewer directory.
2. Open the web app located in `_build/install/default/lib/landmarks-viewer/landmarks_viewer.html` in browser.
2. Or deploy the following to files on a web server: 
```
  _build/install/default/lib/landmarks-viewer/landmarks_viewer.html
  _build/install/default/lib/landmarks-viewer/landmarks_viewer.js
```
      
About
-----

This 'Landmarks-viewer' package is licensed by LexiFi under the terms 
of the MIT license.

Contact: marc.lasson@lexifi.com

[![Build Status](https://travis-ci.org/LexiFi/landmarks-viewer.svg?branch=master)](https://travis-ci.org/LexiFi/landmarks-viewer)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/LexiFi/landmarks-viewer)](https://ci.appveyor.com/project/mlasson/landmarks-viewer)

