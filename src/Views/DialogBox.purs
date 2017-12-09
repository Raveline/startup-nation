module Views.DialogBox where

import Prelude hiding (div)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div)
import Text.Smolder.HTML.Attributes (className, src)
import Text.Smolder.Markup (text, (!))

import Event (Event)

dialogBox :: HTML Event
dialogBox = div ! className "dialog-box" $ do
  text "Welcome to start-up nation"
