let Include = ../Include/Type.dhall

let TriggerStrategy = ../TriggerStrategy/Type.dhall

let Trigger =
      { project : Optional Text
      , branch : Optional Text
      , include : List Include
      , strategy : Optional TriggerStrategy
      }

in  Trigger
