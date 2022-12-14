Landmarks-viewer: A web front-end for landmarks library 
=======================================================

Warning
------------
This fork is a dirty patch to make the viewer work (I hope).
I have never used *js_of_ocaml* or *gen_js_api* before.

[*Landmarks*](https://github.com/LexiFi/landmarks) is a simple profiling 
library for OCaml. The *landmarks-viewer* is a simple web-application that
allows to browser the result of a profiling session using the *landmarks* 
library.

Installation
------------

1. Build by running `./patch.sh` inside the landmarks-viewer directory.
2. Open the web app located in `out/landmarks_viewer.html` in browser.
2. Or deploy the following to files on a web server: 
```
  out/landmarks_viewer.html
  out/landmarks_viewer.js
```
      
About
-----

This 'Landmarks-viewer' package is licensed by LexiFi under the terms 
of the MIT license.

Contact: marc.lasson@lexifi.com

[![Build Status](https://travis-ci.org/LexiFi/landmarks-viewer.svg?branch=master)](https://travis-ci.org/LexiFi/landmarks-viewer)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/LexiFi/landmarks-viewer)](https://ci.appveyor.com/project/mlasson/landmarks-viewer)

