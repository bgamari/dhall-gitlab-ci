let GitLab =
      https://raw.githubusercontent.com/bgamari/dhall-gitlab-ci/master/package.dhall

let Prelude = GitLab.Prelude

let renderTop = GitLab.Top.toJSON

let demoJob =
      GitLab.Job::{
      , stage = Some "build"
      , image = Some { name = "alpine:latest", entrypoint = Some [ " " ] }
      , script = [ "echo 'Hello World'" ]
      }

let top = GitLab.Top::{ jobs = toMap { generated-job = demoJob } }

in  Prelude.JSON.renderYAML (renderTop top)
