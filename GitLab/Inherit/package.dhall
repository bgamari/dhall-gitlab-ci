let Types = ./Type.dhall

in { Type = Types.Inherit
, Choice = Types.Choice
, default = None Types.Inherit
, toJSON = ./toJSON.dhall
}
