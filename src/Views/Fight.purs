module Views.Fight where

import Prelude hiding (div)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div)
import Text.Smolder.Markup (text)

import Event (Event)
import State (FightState)

import Views.Battlefield (battlefield)
import Views.DialogBox (dialogBox)

fight :: FightState -> HTML Event
fight state = div do
  battlefield state
  dialogBox state
