let Prelude = ../Prelude.dhall

let Duration/Type
        : Type
        = { seconds : Natural }
let scale
        : Natural -> Duration/Type -> Duration/Type
        = \ (n : Natural) -> \ (d : Duration/Type) ->
         { seconds = d.seconds * n }
let fromSeconds
        : Natural -> Duration/Type
        = \ (n : Natural) -> { seconds = n }
let fromMinutes
        : Natural -> Duration/Type
        = \ (n : Natural) -> fromSeconds (60*n)
let fromHours
        : Natural -> Duration/Type
        = \ (n : Natural) -> fromMinutes (60*n)
let fromDays
        : Natural -> Duration/Type
        = \ (n : Natural) -> fromHours (24*n)
let fromWeeks
        : Natural -> Duration/Type
        = \ (n : Natural) -> fromDays (7*n)
let fromYears
        : Natural -> Duration/Type
        = \ (n : Natural) -> fromDays (365*n)
let greaterThan
        : Duration/Type -> Duration/Type -> Bool
        = \ (x : Duration/Type) -> 
          \ (y : Duration/Type) ->
          Prelude.Natural.greaterThan x.seconds y.seconds

in 
{ Type = Duration/Type
, scale
, fromSeconds
, fromMinutes
, fromHours
, fromDays
, fromWeeks
, fromYears
, greaterThan
}