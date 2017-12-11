module Views.DialogBox where

import Prelude hiding (div)
import Data.Maybe (maybe)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div)
import Text.Smolder.HTML.Attributes (className, src)
import Text.Smolder.Markup (text, (!))

import Event (Event)
import State (Action(..), FightState(..), activeCharacter)
import Models.Character (Character(..))

dialogBox :: FightState -> HTML Event
dialogBox state = div ! className "dialog-box" $ do
  text $ message state

message :: FightState -> String
message s = maybe waitingMsg characterAction $ activeCharacter s

characterAction :: Character -> String
characterAction (Character c) = "What should " <> c.name <> " do ?"

waitingMsg :: String
waitingMsg = "Welcome to start-up nation"

