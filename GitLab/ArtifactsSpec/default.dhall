let When = ../When/Type.dhall

in    { when = When.OnSuccess
      , expire_in = ../Duration/fromDays.dhall 30
      , reports.junit = None Text
      , paths = [] : List Text
      }
    : ./Type.dhall
