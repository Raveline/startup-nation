module Views.Layout (layout) where

import Prelude hiding (div)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div)
import Text.Smolder.Markup (text)

import Event (Event)
import State (State, Step(..))

import Views.Home (home)
import Views.Fight (fight)
import Views.GameOver (gameOver)

layout :: State -> HTML Event
layout { step, fightState } = case step of
                                Home -> home
                                Fight -> fight fightState
                                GameOver -> gameOver
