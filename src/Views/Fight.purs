module Views.Fight where

import Prelude hiding (div)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div)
import Text.Smolder.Markup (text)

import Event (Event)

fight :: HTML Event
fight = div $ text "fighting"
