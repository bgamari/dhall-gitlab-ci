let fromWeeks
    : Natural → ./Type.dhall
    = λ(n : Natural) → ./fromDays.dhall (7 * n)

in  fromWeeks
