module Event
       ( Event
       , foldp
       , beginFight
       ) where

import Prelude

import Pux (EffModel, noEffects)

import State (State, Step(..))

data Event
  = ChangeStep Step

foldp :: forall fx. Event -> State -> EffModel State Event fx
foldp (ChangeStep nextStep) s = noEffects $ s { step = nextStep }

beginFight :: Event
beginFight = ChangeStep Fight
