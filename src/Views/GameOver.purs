module Views.GameOver where

import Prelude hiding (div)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div)
import Text.Smolder.Markup (text)

import Event (Event)

gameOver :: HTML Event
gameOver = div $ text "game over"
