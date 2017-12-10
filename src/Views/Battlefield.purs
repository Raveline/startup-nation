module Views.Battlefield where

import Prelude hiding (div)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div, img, p)
import Text.Smolder.HTML.Attributes (className, src)
import Text.Smolder.Markup (text, (!))

import Models.Character (Character(..), Category(..))
import Models.Team (Team(..))
import Models.Task (Task(..))

import Views.Team (team)
import Views.Task (tasks)

import Event (Event)
import State (FightState(..))

battlefield :: FightState -> HTML Event
battlefield s = div ! className "battlefield" $ do
  team s.team
  tasks s.selectedTarget s.taskList
