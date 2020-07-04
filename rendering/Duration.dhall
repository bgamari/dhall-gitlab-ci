let Prelude = ../Prelude.dhall
let JSON = Prelude.JSON
let types = ../types.dhall

let Duration = types.Duration.Type

let scales
    : List { name : Text, dur : Duration }
    = [ { name = "week", dur = types.Duration.fromWeeks 1 }
      , { name = "day", dur = types.Duration.fromDays 1 }
      , { name = "hour", dur = types.Duration.fromHours 1 }
      , { name = "minutes", dur = types.Duration.fromMinutes 1 }
      ]

let formatDur
        : Duration -> Text
        = \ (dur : Duration) ->
          "${Natural/show dur.seconds} second"

let Duration/toJSON 
        : Duration -> JSON.Type
        = \ (dur : Duration) -> JSON.string (formatDur dur)

in Duration/toJSON

