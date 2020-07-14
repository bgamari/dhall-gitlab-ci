let fromHours
    : Natural → ./Type.dhall
    = λ(n : Natural) → ./fromMinutes.dhall (60 * n)

in  fromHours
