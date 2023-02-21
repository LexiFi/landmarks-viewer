Landmarks-viewer: A web front-end for landmarks library
=======================================================

[*Landmarks*](https://github.com/LexiFi/landmarks) is a simple profiling
library for OCaml. The *landmarks-viewer* is a simple web-application that
allows to browser the result of a profiling session using the *landmarks*
library.

Installation
------------

0. `opam install --deps-only .`
1. dune build
2. Open the web app located in `landmarks_viewer.html` in browser.
2. Or deploy the following to files on a web server:
```
  landmarks_viewer.html
  landmarks_viewer.js
```

Acknowledgements
----------------

Thanks Jérôme Boillot (@jboillot) for reviving the viewer.

About
-----

This 'Landmarks-viewer' package is licensed by LexiFi under the terms
of the MIT license.

Contact: marc.lasson@lexifi.com
