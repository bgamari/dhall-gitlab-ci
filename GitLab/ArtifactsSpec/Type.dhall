let When = ../When/Type.dhall

let Duration = ../Duration/Type.dhall

let Reports = ../Reports/Type.dhall

in  { when : When
    , expire_in : Optional Duration
    , reports : Optional Reports
    , paths : Optional (List Text)
    }
