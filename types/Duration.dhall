let Prelude = ../Prelude.dhall

let Duration/Type
    : Type
    = { seconds : Natural }

let scale
    : Natural → Duration/Type → Duration/Type
    = λ(n : Natural) → λ(d : Duration/Type) → { seconds = d.seconds * n }

let fromSeconds
    : Natural → Duration/Type
    = λ(n : Natural) → { seconds = n }

let fromMinutes
    : Natural → Duration/Type
    = λ(n : Natural) → fromSeconds (60 * n)

let fromHours
    : Natural → Duration/Type
    = λ(n : Natural) → fromMinutes (60 * n)

let fromDays
    : Natural → Duration/Type
    = λ(n : Natural) → fromHours (24 * n)

let fromWeeks
    : Natural → Duration/Type
    = λ(n : Natural) → fromDays (7 * n)

let fromYears
    : Natural → Duration/Type
    = λ(n : Natural) → fromDays (365 * n)

let greaterThan
    : Duration/Type → Duration/Type → Bool
    = λ(x : Duration/Type) →
      λ(y : Duration/Type) →
        Prelude.Natural.greaterThan x.seconds y.seconds

in  { Type = Duration/Type
    , scale
    , fromSeconds
    , fromMinutes
    , fromHours
    , fromDays
    , fromWeeks
    , fromYears
    , greaterThan
    }
