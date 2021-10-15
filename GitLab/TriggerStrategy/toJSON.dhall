let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let TriggerStrategy = ./Type.dhall

let TriggerStrategy/toJSON
    : TriggerStrategy → JSON.Type
    = λ(strategy : TriggerStrategy) →
        merge { Depend = JSON.string "depend" } strategy

in  TriggerStrategy/toJSON
