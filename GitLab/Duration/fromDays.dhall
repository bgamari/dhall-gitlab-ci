let fromDays
    : Natural → ./Type
    = λ(n : Natural) → ./fromHours (24 * n)

in  fromDays
