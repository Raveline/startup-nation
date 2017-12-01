module Main where

import Prelude hiding (div)
import Control.Monad.Eff (Eff)

import Pux (CoreEffects, EffModel, start, noEffects)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (renderToDOM)
import Text.Smolder.HTML (div)
import Text.Smolder.Markup (text)

import State (initialState)
import Event (Event, foldp)

import Views.Layout (layout)

main :: forall fx. Eff (CoreEffects fx) Unit
main = do
  app <- start { initialState
               , view: layout
               , foldp
               , inputs: []
               }
  renderToDOM "#app" app.markup app.input
