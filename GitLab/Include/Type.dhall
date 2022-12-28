let Rule = ../Rule/Type.dhall

let Include =
      { local : Optional Text
      , file : List Text
      , remote : Optional Text
      , template : Optional Text
      , rules : List Rule
      , project : Optional Text
      , ref : Optional Text
      }

in  Include
