let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let ArtifactsSpec = ../ArtifactsSpec/Type.dhall

let Reports = ../Reports/package.dhall

let Duration = ../Duration/package.dhall

let Optional/map = Prelude.Optional.map

let dropNones = ../utils/dropNones.dhall

let When/toJSON = ../When/toJSON.dhall

let List/map = Prelude.List.map

let Optional/map = Prelude.Optional.map

let stringsArray
    : List Text → JSON.Type
    = λ(xs : List Text) →
        JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

in  let ArtifactsSpec/toJSON
        : ArtifactsSpec → JSON.Type
        = λ(cs : ArtifactsSpec) →
            let obj
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { when = Some (When/toJSON cs.when)
                    , expire_in =
                        Optional/map
                          Duration.Type
                          JSON.Type
                          Duration.toJSON
                          cs.expire_in
                    , reports =
                        Optional/map
                          Reports.Type
                          JSON.Type
                          Reports.toJSON
                          cs.reports
                    , paths =
                        Optional/map (List Text) JSON.Type stringsArray cs.paths
                    }

            in  JSON.object (dropNones Text JSON.Type obj)

    in  ArtifactsSpec/toJSON
