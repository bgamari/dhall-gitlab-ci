let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Optional/map = Prelude.Optional.map

let types = ../types.dhall

let dropNones = ../utils/dropNones.dhall

let When/toJSON = ./When.dhall

let Duration/toJSON = ./Duration.dhall

let List/map = Prelude.List.map

in  let ArtifactsSpec/toJSON
        : types.ArtifactsSpec.Type → JSON.Type
        = λ(cs : types.ArtifactsSpec.Type) →
            let obj
                : Map.Type Text JSON.Type
                = toMap
                    { when = When/toJSON cs.when
                    , expire_in = Duration/toJSON cs.expire_in
                    , paths =
                        JSON.array
                          (List/map Text JSON.Type JSON.string cs.paths)
                    }

            in  JSON.object obj

    in  ArtifactsSpec/toJSON
