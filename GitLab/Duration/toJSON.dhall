let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let Duration = ./Type.dhall

let scales
    : List { name : Text, dur : Duration }
    = [ { name = "week", dur = ./fromWeeks.dhall 1 }
      , { name = "day", dur = ./fromDays.dhall 1 }
      , { name = "hour", dur = ./fromHours.dhall 1 }
      , { name = "minutes", dur = ./fromMinutes.dhall 1 }
      ]

let formatDur
    : Duration → Text
    = λ(dur : Duration) → "${Natural/show dur.seconds} second"

let Duration/toJSON
    : Duration → JSON.Type
    = λ(dur : Duration) → JSON.string (formatDur dur)

in  Duration/toJSON
