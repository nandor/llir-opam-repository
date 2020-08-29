# llir-opam-repository

Opam repository for Duplo-Optimised OCaml

## Setup

```
opam switch create llir \
  --repositories=llir=https://github.com/nandor/llir-opam-repository \
  --empty
opam install ocaml-variants.4.07.1+llir
```

## References

* Duplo: A Framework for OCaml Post-Link Optimisation https://dl.acm.org/doi/10.1145/3408980
