let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let ArtifactsSpec = ../ArtifactsSpec/Type.dhall

let Optional/map = Prelude.Optional.map

let dropNones = ../utils/dropNones.dhall

let When/toJSON = ../When/toJSON.dhall

let Duration/toJSON = ../Duration/toJSON.dhall

let List/map = Prelude.List.map

in  let ArtifactsSpec/toJSON
        : ArtifactsSpec → JSON.Type
        = λ(cs : ArtifactsSpec) →
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
