let fromDays
    : Natural → ./Type.dhall
    = λ(n : Natural) → ./fromHours.dhall (24 * n)

in  fromDays
