Landmarks-viewer: A web front-end for landmarks library 
=======================================================

[*Landmarks*](https://github.com/LexiFi/landmarks) is a simple profiling 
library for OCaml. The *landmarks-viewer* is a simple web-application that
allows to browser the result of a profiling session using the *landmarks* 
library.

Installation
------------

- Using opam:
```
opam install landmarks-viewer
```

- Manually:
```
git clone https://github.com/LexiFi/landmarks.git
cd landmarks
dune build @install
```

* Launching the viewer (when available):
```
x-www-browser "$(ocamlfind query landmarks-viewer)/landmarks_viewer.html"
```
You may want to replace "x-www-browser" with your system's way to
invoke your favorite web-browser from the command line. It has
to support javascript.

About
-----

This 'Landmarks-viewer' package is licensed by LexiFi under the terms 
of the MIT license.

Contact: marc.lasson@lexifi.com

[![Build Status](https://travis-ci.org/LexiFi/landmarks-viewer.svg?branch=master)](https://travis-ci.org/LexiFi/landmarks)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/LexiFi/landmarks-viewer)](https://ci.appveyor.com/project/mlasson/landmarks)

