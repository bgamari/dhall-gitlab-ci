let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Optional/map = Prelude.Optional.map

let types = ../types.dhall

let dropNones = ../utils/dropNones.dhall

let When/toJSON = ./When.dhall

let Duration/toJSON = ./Duration.dhall

in  let ArtifactsSpec/toJSON
        : types.ArtifactsSpec.Type → JSON.Type
        = λ(cs : types.ArtifactsSpec.Type) →
            let obj
                : Map.Type Text JSON.Type
                = toMap
                    { when = When/toJSON cs.when
                    , expire_in = Duration/toJSON cs.expire_in
                    }

            in  JSON.object obj

    in  ArtifactsSpec/toJSON
