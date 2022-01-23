# llir-opam-repository

Opam repository for Duplo-Optimised OCaml

## Note

This repository is experimental - the 0.0.1 tag is not stable.

## Dependencies

On a Ubuntu-based system, the following dependencies are required:

```
sudo apt install cmake g++ zlib1g-dev
```

## Setup

```
opam switch create llir \
  --repositories=llir=git+https://github.com/nandor/llir-opam-repository,default \
  --empty
opam update
opam install ocaml-variants.4.11.0.master+llir arch-native
```

## References

* Duplo: A Framework for OCaml Post-Link Optimisation https://dl.acm.org/doi/10.1145/3408980
