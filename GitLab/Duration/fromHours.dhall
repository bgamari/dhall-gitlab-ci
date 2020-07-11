let fromHours
    : Natural → ./Type
    = λ(n : Natural) → ./fromMinutes (60 * n)

in  fromHours
