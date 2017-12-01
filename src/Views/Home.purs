module Views.Home (home) where

import Prelude hiding (div)

import Pux.DOM.HTML (HTML)
import Pux.DOM.Events (onClick)
import Text.Smolder.HTML (div, h1, button)
import Text.Smolder.HTML.Attributes (className)
import Text.Smolder.Markup (text, (#!), (!))

import Event (Event, beginFight)

home :: HTML Event
home = div ! className "home" $ do
  h1 $ text "Startup-Nation"
  button #! onClick (const beginFight) $ text "Start the game"
