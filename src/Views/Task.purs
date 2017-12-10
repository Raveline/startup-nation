module Views.Task where

import Prelude hiding (div)
import Data.Foldable (traverse_)
import Data.Maybe (Maybe(..), maybe)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div, p)
import Text.Smolder.HTML.Attributes (className, src)
import Text.Smolder.Markup (text, (!))

import Models.Task (Task(..))
import Event (Event)

tasks :: Maybe Task -> Array Task -> HTML Event
tasks t ts = div ! className "tasks" $ traverse_ (\t' -> task (highlighted t t') t') ts
  where
    highlighted :: Maybe Task -> Task -> Boolean
    highlighted selected t = maybe false (_ == t) selected

task :: Boolean -> Task -> HTML Event
task isSelected (Task t) = div ! className taskClass $ do
  p ! className "task__name" $ text t.name
  where
    taskClass = if isSelected
                  then "task task--selected"
                  else "task"

