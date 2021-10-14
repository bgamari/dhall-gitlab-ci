let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Rule = ./Type.dhall

let When = ../When/Type.dhall

let When/toJSON = ../When/toJSON.dhall

let dropNones = ../utils/dropNones.dhall

let stringsArrayJSON = ../utils/stringsArrayJSON.dhall

let Optional/map = Prelude.Optional.map

let Rule/toJSON
    : Rule → JSON.Type
    = λ(rule : Rule) →
        let everything
            : Map.Type Text (Optional JSON.Type)
            = toMap
                { `if` = Optional/map Text JSON.Type JSON.string rule.`if`
                , when = Optional/map When JSON.Type When/toJSON rule.when
                , allow_failure =
                    Optional/map Bool JSON.Type JSON.bool rule.allow_failure
                , changes =
                    if    Prelude.List.null Text rule.changes
                    then  None JSON.Type
                    else  Some (stringsArrayJSON rule.changes)
                , exists =
                    if    Prelude.List.null Text rule.exists
                    then  None JSON.Type
                    else  Some (stringsArrayJSON rule.exists)
                , variables = Some
                    ( JSON.object
                        (Map.map Text Text JSON.Type JSON.string rule.variables)
                    )
                }

        in  JSON.object (dropNones Text JSON.Type everything)

in  Rule/toJSON
