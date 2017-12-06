module Views.Team where

import Prelude hiding (div)
import Data.Foldable (traverse_)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div, img, p)
import Text.Smolder.HTML.Attributes (className, src)
import Text.Smolder.Markup (text, (!))

import Models.Team (Team(..))
import Views.Character (character)

import Event (Event)

team :: Team -> HTML Event
team (Team t) = div ! className "team" $ traverse_ character t
