let fromMinutes
    : Natural → ./Type
    = λ(n : Natural) → ./fromSeconds (60 * n)

in  fromMinutes
