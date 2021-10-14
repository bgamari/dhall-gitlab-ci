let Trigger = ./Type.dhall

let Include = ../Include/Type.dhall

in    { project = None Text, branch = None Text, include = [] : List Include }
    : Trigger
