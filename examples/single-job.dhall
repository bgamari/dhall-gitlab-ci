let GitLab =
        ../package.dhall
      ? https://raw.githubusercontent.com/bgamari/dhall-gitlab-ci/master/package.dhall

let Prelude = GitLab.Prelude

let renderTop = GitLab.Top.toJSON

let When = GitLab.When.Type

let demoJob =
      GitLab.Job::{
      , stage = Some "build"
      , image = Some { name = "alpine:latest", entrypoint = Some [ " " ] }
      , script = [ "echo 'Hello World'" ]
      }

let jobWithReport =
      GitLab.Job::{
      , stage = Some "build"
      , image = Some { name = "alpine:latest", entrypoint = Some [ " " ] }
      , script = [ "echo 'Hello World'" ]
      -- generated JSON will include "reports" key
      , artifacts = Some
            { when = When.Always
                  , expire_in.seconds = 365 * 24 * 60 * 60
                  , paths = [ "report.xml" ]
                  , reports = { junit = Some "report.xml" }
            }
      }

let jobWithoutReport =
      GitLab.Job::{
      , stage = Some "build"
      , image = Some { name = "alpine:latest", entrypoint = Some [ " " ] }
      , script = [ "echo 'Hello World'" ]
      -- generated JSON will not include "reports" key
      , artifacts = Some
            { when = When.Always
                  , expire_in.seconds = 365 * 24 * 60 * 60
                  , paths = [ "foo.xml" ]
                  , reports = { junit = None Text}
            }
      }
let top = GitLab.Top::{ jobs = toMap { 
      generated-job = demoJob 
      , job-with-report = jobWithReport
      , job-without-report = jobWithoutReport
} }

in  Prelude.JSON.renderYAML (renderTop top)
