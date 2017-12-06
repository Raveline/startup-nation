module Views.Character where

import Prelude hiding (div)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div, img, p)
import Text.Smolder.HTML.Attributes (className, src)
import Text.Smolder.Markup (text, (!))

import Models.Character (Character(..))

import Event (Event)

character :: Character -> HTML Event
character (Character c) = div ! className "character" $ do
  p ! className "character__life" $ text ((show c.remainingLife) <> "/" <> (show c.pv))
  img ! src "images/hipster.jpg"
  p ! className "character__name" $ text c.name
