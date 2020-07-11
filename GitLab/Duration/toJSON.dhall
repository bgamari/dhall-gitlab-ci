let Prelude = ../Prelude

let JSON = Prelude.JSON

let Duration = ./Type

let scales
    : List { name : Text, dur : Duration }
    = [ { name = "week", dur = ./fromWeeks 1 }
      , { name = "day", dur = ./fromDays 1 }
      , { name = "hour", dur = ./fromHours 1 }
      , { name = "minutes", dur = ./fromMinutes 1 }
      ]

let formatDur
    : Duration → Text
    = λ(dur : Duration) → "${Natural/show dur.seconds} second"

let Duration/toJSON
    : Duration → JSON.Type
    = λ(dur : Duration) → JSON.string (formatDur dur)

in  Duration/toJSON
