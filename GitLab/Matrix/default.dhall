let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let List/empty = Prelude.List.empty

in  List/empty (Map.Type Text (List Text))
