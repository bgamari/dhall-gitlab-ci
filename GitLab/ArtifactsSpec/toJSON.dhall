let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let ArtifactsSpec = ../ArtifactsSpec/Type.dhall

let dropNones = ../utils/dropNones.dhall

let When/toJSON = ../When/toJSON.dhall

let Duration/toJSON = ../Duration/toJSON.dhall

let List/map = Prelude.List.map

let Optional/map = Prelude.Optional.map

let Optional/null = Prelude.Optional.null

in  let ArtifactsSpec/toJSON
        : ArtifactsSpec → JSON.Type
        = λ(cs : ArtifactsSpec) →
            let initial = { 
                when = When/toJSON cs.when
                , expire_in = Duration/toJSON cs.expire_in
                , paths = 
                    JSON.array
                        (List/map Text JSON.Type JSON.string cs.paths)
              }
            let obj =  
              merge { 
                  Some = (λ(pattern : Text) → (toMap (initial /\ { reports = JSON.object (toMap { junit = JSON.string pattern })}))), 
                  None =  toMap initial
              } cs.reports.junit
            in JSON.object obj

    in  ArtifactsSpec/toJSON
