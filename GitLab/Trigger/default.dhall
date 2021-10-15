let Trigger = ./Type.dhall

let Include = ../Include/Type.dhall

let TriggerStrategy = ../TriggerStrategy/Type.dhall

in    { project = None Text
      , branch = None Text
      , include = [] : List Include
      , strategy = None TriggerStrategy
      }
    : Trigger
