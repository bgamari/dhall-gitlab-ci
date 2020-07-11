let When = ../When/Type

in    { when = When.OnSuccess
      , expire_in = ../Duration/fromDays 30
      , reports.junit = None Text
      , paths = [] : List Text
      }
    : ./Type
