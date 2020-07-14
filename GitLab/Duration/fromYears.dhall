let fromYears
    : Natural → ./Type.dhall
    = λ(n : Natural) → ./fromDays.dhall (365 * n)

in  fromYears
