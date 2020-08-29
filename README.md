# llir-opam-repository

Opam repository for Duplo-Optimised OCaml

## Note

This repository is experimental - the 0.0.1 tag is not stable.

## Setup

```
opam switch create llir \
  --repositories=llir=git+https://github.com/nandor/llir-opam-repository \
  --empty
opam update
opam install ocaml-variants.4.07.1+llir
```

## References

* Duplo: A Framework for OCaml Post-Link Optimisation https://dl.acm.org/doi/10.1145/3408980
