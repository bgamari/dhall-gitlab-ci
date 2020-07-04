let Prelude = ../Prelude.dhall
let Map = Prelude.Map
let JSON = Prelude.JSON
let Optional/map = Prelude.Optional.map

let types = ../types.dhall
let dropNones = ../utils/dropNones.dhall
let When/toJSON = ./When.dhall
in

let ArtifactsSpec/toJSON
        : types.ArtifactsSpec -> JSON.Type
        = \ (cs : types.ArtifactsSpec) ->
            let obj
                : Map.Type Text JSON.Type
                = toMap
                { when = When/toJSON cs.when
                }
            in JSON.object obj
in ArtifactsSpec/toJSON
