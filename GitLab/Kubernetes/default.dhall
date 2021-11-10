let Prelude = ../Prelude.dhall

let Kubernetes = ./Type.dhall

in  { namespace = None Text } : Kubernetes
