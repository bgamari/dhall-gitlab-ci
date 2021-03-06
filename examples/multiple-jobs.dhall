let GitLab = ../package.dhall

let Prelude = GitLab.Prelude

let List/map = Prelude.List.map

let Map = Prelude.Map.Type

let Job = GitLab.Job.Type

let renderTop = GitLab.Top.toJSON

let buildDir = "build"

let targets = [ "package-1", "package-2" ]

let mkJob =
      λ(target : Text) →
        GitLab.Job::{
        , stage = Some "build"
        , image = Some { name = "alpine:latest", entrypoint = Some [ " " ] }
        , script = [ "echo 'Building ${buildDir}/${target} World'" ]
        }

let jobList
    : List { mapKey : Text, mapValue : Job }
    = List/map
        Text
        { mapKey : Text, mapValue : Job }
        (λ(target : Text) → { mapKey = target, mapValue = mkJob target })
        targets

let jobMap
    : Map Text Job
    = jobList

let top = GitLab.Top::{ jobs = jobMap }

in  Prelude.JSON.renderYAML (renderTop top)
