let Prelude = ../Prelude.dhall

let Optional/map = Prelude.Optional.map

let Map = Prelude.Map

let JSON = Prelude.JSON

let dropNones = ../utils/dropNones.dhall

let Types = ./Type.dhall

let choiceToJSON = λ(choice : Types.Choice) → merge { 
    Defaults = λ(b : Bool) → JSON.bool b,
    Keywords = λ(ks : List Text) -> JSON.array
      ( Prelude.List.map
          Text
          JSON.Type
          JSON.string
          ks
      )
  } choice

let Inherit/toJSON : Types.Inherit → JSON.Type = λ(inherit : Types.Inherit) →
  let everything = toMap {
    `default` = Optional/map Types.Choice JSON.Type choiceToJSON inherit.`default`,
    variables = Optional/map Types.Choice JSON.Type choiceToJSON inherit.variables
  }

  in  JSON.object (dropNones Text JSON.Type everything)

in  Inherit/toJSON