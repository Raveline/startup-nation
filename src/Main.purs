module Main where

import Prelude hiding (div)
import Control.Monad.Eff (Eff)

import Pux (CoreEffects, EffModel, start, noEffects)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (renderToDOM)
import Text.Smolder.HTML (div)
import Text.Smolder.Markup (text)

type State = Int
type Event = Unit

foldp :: forall fx. Event -> State -> EffModel State Event fx
foldp _ s = noEffects s

initialState :: State
initialState = 0

view :: State -> HTML Event
view _ = div (text "plop")

main :: forall fx. Eff (CoreEffects fx) Unit
main = do
  app <- start { initialState
               , view
               , foldp
               , inputs: []
               }
  renderToDOM "#app" app.markup app.input
