let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Kubernetes = ./Type.dhall

let Optional/map = Prelude.Optional.map

let dropNones = ../utils/dropNones.dhall

let Kubernetes/toJSON
    : Kubernetes → JSON.Type
    = λ(kubernetes : Kubernetes) →
        let everything
            : Map.Type Text (Optional JSON.Type)
            = toMap
                { namespace =
                    Optional/map Text JSON.Type JSON.string kubernetes.namespace
                }

        in  JSON.object (dropNones Text JSON.Type everything)

in  Kubernetes/toJSON
