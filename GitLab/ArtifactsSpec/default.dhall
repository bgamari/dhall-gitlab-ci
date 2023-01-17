let When = ../When/Type.dhall

let Duration = ../Duration/Type.dhall

let Reports = ../Reports/Type.dhall

in    { when = When.OnSuccess
      , expire_in = None Duration
      , reports = None Reports
      , paths = None (List Text)
      }
    : ./Type.dhall
