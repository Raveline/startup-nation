module Views.Home (home) where

import Prelude hiding (div)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div)
import Text.Smolder.Markup (text)

import Event (Event)

home :: HTML Event
home = div $ text "home"
