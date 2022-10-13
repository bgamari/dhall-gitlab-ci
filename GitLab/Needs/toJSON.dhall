let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Needs = ./Type.dhall

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

let Needs/toJSON
    : Needs → JSON.Type
    = λ(needs : Needs) →
        let everything
            : Map.Type Text (Optional JSON.Type)
            = toMap
                { job = Optional/map Text JSON.Type JSON.string needs.job
                , pipeline =
                    Optional/map Text JSON.Type JSON.string needs.pipeline
                , artifacts =
                    if    needs.artifacts
                    then  None JSON.Type
                    else  Some (JSON.bool needs.artifacts)
                , optional =
                    if    needs.optional
                    then  Some (JSON.bool needs.optional)
                    else  None JSON.Type
                }

        in  JSON.object (dropNones Text JSON.Type everything)

in  Needs/toJSON
