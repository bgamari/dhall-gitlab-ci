let Include = ../Include/Type.dhall

let Trigger =
      { project : Optional Text
      , branch : Optional Text
      , include : List Include
      }

in  Trigger
