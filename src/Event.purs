module Event (Event, foldp) where

import Prelude

import Pux (EffModel, noEffects)

import State (State)

type Event = Unit

foldp :: forall fx. Event -> State -> EffModel State Event fx
foldp _ s = noEffects s
