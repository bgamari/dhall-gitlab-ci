let Rule = ../Rule/Type.dhall

let Include = ./Type.dhall

in    { local = None Text
      , file = None Text
      , remote = None Text
      , template = None Text
      , rules = [] : List Rule
      , project = None Text
      , ref = None Text
      }
    : Include
