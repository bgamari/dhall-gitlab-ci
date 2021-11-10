let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Defaults = ./Type.dhall

let CacheSpec = ../CacheSpec/package.dhall

let Service = ../Service/package.dhall

let dropNones = ../utils/dropNones.dhall

let stringsArrayJSON = ../utils/stringsArrayJSON.dhall

let Optional/map = Prelude.Optional.map

let Defaults/toJSON
    : Defaults → JSON.Type
    = λ(defaults : Defaults) →
        let everything
            : Map.Type Text (Optional JSON.Type)
            = toMap
                { image = Optional/map Text JSON.Type JSON.string defaults.image
                , before_script =
                    if    Prelude.List.null Text defaults.before_script
                    then  None JSON.Type
                    else  Some (stringsArrayJSON defaults.before_script)
                , after_script =
                    if    Prelude.List.null Text defaults.after_script
                    then  None JSON.Type
                    else  Some (stringsArrayJSON defaults.after_script)
                , services =
                    if    Prelude.List.null Service.Type defaults.services
                    then  None JSON.Type
                    else  Some
                            ( JSON.array
                                ( Prelude.List.map
                                    Service.Type
                                    JSON.Type
                                    Service.toJSON
                                    defaults.services
                                )
                            )
                , cache =
                    Optional/map
                      CacheSpec.Type
                      JSON.Type
                      CacheSpec.toJSON
                      defaults.cache
                }

        in  JSON.object (dropNones Text JSON.Type everything)

in  Defaults/toJSON
