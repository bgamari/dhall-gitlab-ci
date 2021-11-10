let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Service = ./Type.dhall

let dropNones = ../utils/dropNones.dhall

let stringsArrayJSON = ../utils/stringsArrayJSON.dhall

let Optional/map = Prelude.Optional.map

let Service/toJSON
    : Service → JSON.Type
    = λ(service : Service) →
        let everything
            : Map.Type Text (Optional JSON.Type)
            = toMap
                { name = Some (JSON.string service.name)
                , alias = Optional/map Text JSON.Type JSON.string service.alias
                , entrypoint =
                    if    Prelude.List.null Text service.entrypoint
                    then  None JSON.Type
                    else  Some (stringsArrayJSON service.entrypoint)
                , command =
                    if    Prelude.List.null Text service.command
                    then  None JSON.Type
                    else  Some (stringsArrayJSON service.command)
                }

        in  JSON.object (dropNones Text JSON.Type everything)

in  Service/toJSON
