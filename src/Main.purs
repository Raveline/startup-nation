module Main where

import Prelude hiding (div)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)

import Pux (CoreEffects, EffModel, start, noEffects)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (renderToDOM)
import Text.Smolder.HTML (div)
import Text.Smolder.Markup (text)
import Signal ((~>))
import DOM (DOM)

import State (initialState)
import Event (Event(..), foldp)
import KeySignal (keys)

import Views.Layout (layout)

type AppEffects eff = (CoreEffects (dom :: DOM, console :: CONSOLE | eff))

main :: forall fx. Eff (AppEffects fx) Unit
main = do
  keysSignal <- keys
  let enterKey = keysSignal ~> (\b -> KeyPressed b)

  app <- start { initialState
               , view: layout
               , foldp
               , inputs: [ enterKey ]
               }
  renderToDOM "#app" app.markup app.input
