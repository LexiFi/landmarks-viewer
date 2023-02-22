(lang dune 2.7)
(name landmarks-viewer)
(version 1.4)

(maintainers "Marc Lasson <marc.lasson@lexifi.com>")
(authors "Marc Lasson <marc.lasson@lexifi.com>")

(source (github LexiFi/landmarks-viewer))

(generate_opam_files true)

(license MIT)

(package
 (name landmarks-viewer)
 (synopsis "A simple profiling library")
 (description "A web viewer for browsing .json file produced by the landmarks runtime.")
 (depends (ocaml (>= 4.08)))
)
