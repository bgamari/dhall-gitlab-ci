let fromMinutes
    : Natural → ./Type.dhall
    = λ(n : Natural) → ./fromSeconds.dhall (60 * n)

in  fromMinutes
