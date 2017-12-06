module Views.Task where

import Prelude hiding (div)
import Data.Foldable (traverse_)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div, p)
import Text.Smolder.HTML.Attributes (className, src)
import Text.Smolder.Markup (text, (!))

import Models.Task (Task(..))
import Event (Event)

tasks :: Array Task -> HTML Event
tasks ts = div ! className "tasks" $ traverse_ task ts

task :: Task -> HTML Event
task (Task t) = div ! className "task" $ do
  p ! className "task__name" $ text t.name
