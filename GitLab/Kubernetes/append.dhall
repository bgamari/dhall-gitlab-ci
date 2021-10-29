let Kubernetes = ./Type.dhall

let mergeOptionalRight = ../utils/mergeOptionalRight.dhall

let append
    : Kubernetes → Kubernetes → Kubernetes
    = λ(a : Kubernetes) →
      λ(b : Kubernetes) →
        { namespace = mergeOptionalRight Text a.namespace b.namespace }

in  append
