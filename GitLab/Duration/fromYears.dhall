let fromYears
    : Natural → ./Type
    = λ(n : Natural) → ./fromDays (365 * n)

in  fromYears
